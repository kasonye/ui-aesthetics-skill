param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,
    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "references/sanitized.jsonl"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$raw = Get-Content -Raw -Path $InputPath

# Common markdown/chat escaping artifacts seen in copied JSON/JSONL
$clean = $raw
$clean = $clean -replace "\\_", "_"
$clean = $clean -replace "\\#", "#"
$clean = $clean -replace "\\<", "<"
$clean = $clean -replace "\\>", ">"

$dir = Split-Path -Parent $OutputPath
if (-not [string]::IsNullOrWhiteSpace($dir)) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

Set-Content -Path $OutputPath -Value $clean -Encoding UTF8
Write-Output "Sanitized -> $OutputPath"
