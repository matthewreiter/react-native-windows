$root = (split-path -parent $MyInvocation.MyCommand.Definition) + '\..\..'

Write-Host "Root is $root"

$reactAppDir = "$root\ReactWindows\Playground.Net46"
$reactAssetsDir = "$reactAppDir\ReactAssets"
$indexWindowsJSDir = "$reactAppDir"

Write-Host "React Native App Directory is $reactAppDir"
Write-Host "ReactAssets Directory is $reactAssetsDir"

If (Test-Path $reactAssetsDir)
{
    # Delete any existing output.
    Remove-Item $reactAssetsDir -Force -Recurse
}

New-Item -ItemType directory -Path "$reactAssetsDir"

Set-Location $root

react-native bundle --entry-file $indexWindowsJSDir\index.windows.js --platform windows --dev true --bundle-output $reactAssetsDir/index.windows.bundle --assets-dest $reactAssetsDir