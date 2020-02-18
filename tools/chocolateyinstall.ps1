# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
$ErrorActionPreference = 'Stop';

$packageName= 'posfordotnet.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/9/4/4/9444E977-DA6D-469F-8DA9-782F0C13CF30/PosForDotNet-1.14.1.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'Microsoft POS for .NET*'

  checksum      = '6CECF22600A4430A1D80573AC74049E8BEFD3B32B6DDDB10B1931A2A1B654E36'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs