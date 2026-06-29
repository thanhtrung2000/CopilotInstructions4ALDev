# validate-phase1.ps1
# Purpose: Validate Phase 1 AL Copilot instruction framework before first push.

$ErrorActionPreference = "Stop"

$RequiredFiles = @(
    "README.md",
    ".github/copilot-instructions.md",
    ".github/pull_request_template.md",
    ".github/prompts/create-table.prompt.md",
    ".github/prompts/create-tableextension.prompt.md",
    ".github/prompts/create-page.prompt.md",
    ".github/prompts/create-pageextension.prompt.md",
    ".github/prompts/create-codeunit.prompt.md",
    ".github/prompts/create-event-subscriber.prompt.md",
    ".github/prompts/create-test-codeunit.prompt.md",
    ".github/prompts/review-al-code.prompt.md",
    ".github/prompts/fix-analyzer-issues.prompt.md",
    ".github/prompts/generate-documentation.prompt.md",
    ".vscode/settings.json",
    ".vscode/al.ruleset.json",
    "docs/al-copilot-framework-user-guide.md",
    "docs/al-copilot-quick-reference.md",
    "docs/copilot-prompt-catalog.md",
    "docs/copilot-governance.md",
    "docs/copilot-learnings.md"
)

$HasError = $false

Write-Host ""
Write-Host "=== Phase 1 Repository Validation ===" -ForegroundColor Cyan
Write-Host ""

# 1. Check required files
Write-Host "Checking required files..." -ForegroundColor Yellow

foreach ($File in $RequiredFiles) {
    if (-not (Test-Path $File)) {
        Write-Host "MISSING: $File" -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK: $File" -ForegroundColor Green
    }
}

# 2. Check JSON validity
Write-Host ""
Write-Host "Checking JSON files..." -ForegroundColor Yellow

$JsonFiles = @(
    ".vscode/settings.json",
    ".vscode/al.ruleset.json"
)

foreach ($JsonFile in $JsonFiles) {
    if (Test-Path $JsonFile) {
        try {
            Get-Content $JsonFile -Raw | ConvertFrom-Json | Out-Null
            Write-Host "OK JSON: $JsonFile" -ForegroundColor Green
        }
        catch {
            Write-Host "INVALID JSON: $JsonFile" -ForegroundColor Red
            Write-Host $_.Exception.Message -ForegroundColor Red
            $HasError = $true
        }
    }
}

# 3. Validate settings.json expected AL analyzer properties
Write-Host ""
Write-Host "Checking VS Code AL analyzer settings..." -ForegroundColor Yellow

if (Test-Path ".vscode/settings.json") {
    $Settings = Get-Content ".vscode/settings.json" -Raw | ConvertFrom-Json

    if ($Settings.'al.enableCodeAnalysis' -ne $true) {
        Write-Host "ERROR: al.enableCodeAnalysis should be true." -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK: al.enableCodeAnalysis = true" -ForegroundColor Green
    }

    if (-not $Settings.'al.codeAnalyzers') {
        Write-Host "ERROR: al.codeAnalyzers is missing." -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK: al.codeAnalyzers exists" -ForegroundColor Green
    }

    if ($Settings.'al.ruleSetPath' -ne "./.vscode/al.ruleset.json") {
        Write-Host "ERROR: al.ruleSetPath should be ./.vscode/al.ruleset.json" -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK: al.ruleSetPath is correct" -ForegroundColor Green
    }
}

# 4. Validate ruleset structure
Write-Host ""
Write-Host "Checking AL ruleset structure..." -ForegroundColor Yellow

if (Test-Path ".vscode/al.ruleset.json") {
    $RuleSet = Get-Content ".vscode/al.ruleset.json" -Raw | ConvertFrom-Json

    if (-not $RuleSet.name) {
        Write-Host "ERROR: ruleset name is missing." -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK: ruleset name exists" -ForegroundColor Green
    }

    if (-not $RuleSet.description) {
        Write-Host "ERROR: ruleset description is missing." -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK: ruleset description exists" -ForegroundColor Green
    }

    if (-not $RuleSet.rules) {
        Write-Host "ERROR: ruleset rules array is missing." -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK: ruleset rules array exists" -ForegroundColor Green
    }

    foreach ($Rule in $RuleSet.rules) {
        if (-not $Rule.id -or -not $Rule.action -or -not $Rule.justification) {
            Write-Host "ERROR: A rule is missing id, action, or justification." -ForegroundColor Red
            $Rule | ConvertTo-Json
            $HasError = $true
        }
    }
}

# 5. Check Markdown code fence balance
Write-Host ""
Write-Host "Checking Markdown code fence balance..." -ForegroundColor Yellow

$MarkdownFiles = Get-ChildItem -Recurse -Filter "*.md"

foreach ($MarkdownFile in $MarkdownFiles) {
    $Content = Get-Content $MarkdownFile.FullName
    $FenceCount = ($Content | Where-Object { $_ -match '^\s*```' }).Count

    if ($FenceCount % 2 -ne 0) {
        Write-Host "ERROR: Unbalanced code fence in $($MarkdownFile.FullName)" -ForegroundColor Red
        $HasError = $true
    }
    else {
        Write-Host "OK Markdown fences: $($MarkdownFile.FullName)" -ForegroundColor Green
    }
}

# 6. Check prompt files have expected sections
Write-Host ""
Write-Host "Checking prompt files for expected sections..." -ForegroundColor Yellow

$PromptFiles = Get-ChildItem ".github/prompts" -Filter "*.prompt.md" -ErrorAction SilentlyContinue

foreach ($PromptFile in $PromptFiles) {
    $Text = Get-Content $PromptFile.FullName -Raw

    $RequiredSections = @(
        "## Goal",
        "## Inputs",
        "## Instructions",
        "## Expected Output"
    )

    foreach ($Section in $RequiredSections) {
        if ($Text -notlike "*$Section*") {
            Write-Host "WARNING: $($PromptFile.Name) does not contain $Section" -ForegroundColor Yellow
        }
    }

    Write-Host "Checked prompt: $($PromptFile.Name)" -ForegroundColor Green
}

# 7. Final result
Write-Host ""
Write-Host "=== Validation Result ===" -ForegroundColor Cyan

if ($HasError) {
    Write-Host "FAILED: Critical issues found. Fix them before pushing." -ForegroundColor Red
}
else {
    Write-Host "PASSED: No critical structural or JSON errors found." -ForegroundColor Green
}
