$targetDir = "node_modules"

# Check if node_modules exists
if (-Not (Test-Path -Path $targetDir -PathType Container)) {
	Write-Host "$targetDir does not exist"
	exit 1
}

# Patterns
$patterns = @(
	"__tests__",
	"_config.yml",
	".*ignore",
	".babel*",
	".circle*",
	".documentup*",
	".ds_store",
	".editorconfig",
	".env*",
	".git*",
	".idea",
	".lint*",
	".npm*",
	".nyc*",
	".prettier*",
	".tern-project",
	".yarn-integrity",
	".yarn-metadata.json",
	".yarnclean",
	".yo-*",
	"*.coffee",
	"*.flow*",
	"*.jst",
	"*.markdown",
	"*.md",
	"*.mkd",
	"*.swp",
	"*.tgz",
	"*appveyor*",
	"*coveralls*",
	"*eslint*",
	"*htmllint*",
	"*jshint*",
	"*readme*",
	"*stylelint*",
	"*travis*",
	"*tslint*",
	"*vscode*",
	"*wallaby*",
	"authors",
	"changelog",
	"changes",
	"circle.yml",
	"component.json",
	"contributors",
	"coverage",
	"doc",
	"docs",
	"example",
	"examples",
	"grunt*",
	"gulp*",
	"jenkins*",
	"jest*",
	"jsconfig.json",
	"karma.conf*",
	"licence",
	"LICENSE",
	"licence.txt",
	"makefile",
	"npm-debug.log",
	"powered-test",
	"prettier.*",
	"test",
	"tests",
	"tsconfig.json",
	"tsconfig.json"
)

# Production patterns
$prodPatterns = @(
	"*.map",
	"*.ts"
)

# Include production patterns if '-p' is passed
if ($args -Contains "-p") {
	$patterns = $patterns + $prodPatterns
	$host.UI.RawUI.ForegroundColor = "Blue"
	Write-Host "Prod mode"
}
else {
	$host.UI.RawUI.ForegroundColor = "Green"
	Write-Host "Dev mode"
}

function Get-DirectorySize {
	Param ([string]$path)
	$bytes = (Get-ChildItem -Path $path -Recurse -Force | Measure-Object -Property Length -Sum).Sum
	[math]::Round($bytes / 1024, 2)
}

# Display size before cleanup
$sizeBefore = Get-DirectorySize -path $targetDir
Write-Host "$targetDir size before: $sizeBefore KB"


# Cleanup
foreach ($pattern in $patterns) {
	Get-ChildItem -Path $targetDir -Recurse -Force -Include $pattern | 
	Remove-Item -Force -Recurse
}

# Display size after cleanup
$sizeAfter = Get-DirectorySize -path $targetDir
Write-Host "$targetDir size after: $sizeAfter KB"
$host.UI.RawUI.ForegroundColor = "White"
