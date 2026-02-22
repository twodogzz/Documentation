# Auto-generate Documentation Index

<# 	⭐ 3. Script to Auto‑Generate Documentation Indexes
	This script scans the Documentation folder and generates an index file listing all documents with links.
	Purpose
	- Automatically builds a Documentation_Index.md file
	- Ensures your documentation never drifts
	- Gives you a single, up‑to‑date overview
	- Perfect for large documentation sets
	Function
	- Recursively scans all subfolders
	- Lists all .md and .rtf files
	- Generates a clean Markdown index
	- Saves it at the root of the Documentation repo#>

$Root = $PSScriptRoot
$Output = Join-Path $Root "Documentation_Index.md"

$files = Get-ChildItem -Path $Root -Recurse -File |
         Where-Object { $_.Extension -in ".md", ".rtf" }

$index = @("# Documentation Index", "")

foreach ($file in $files) {
    $relative = $file.FullName.Replace($Root, "").TrimStart("\")
    $index += "- [$relative]($relative)"
}

$index | Set-Content -Path $Output
Write-Host "Documentation index generated."