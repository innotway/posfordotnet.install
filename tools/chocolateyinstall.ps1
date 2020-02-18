﻿# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
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

  checksum      = '48924C7CE766D3B4C640F3AC270603D70DFA978A0E016C35D2F20F2D19C8C14C'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs