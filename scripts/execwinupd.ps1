$ErrorActionPreference = 'Stop'

$wuInstallExe = Join-Path "$($env:windir)\SYSTEM32" 'WUInstallAMD64.exe'

if (!(Test-Path -Path $wuInstallExe))
{
    Invoke-WebRequest -UseBasicParsing -Uri 'https://www.dropbox.com/s/bk1dodl4fb7znj3/WUInstallAMD64.exe?dl=1' -OutFile $wuInstallExe
}

sleep 180
C:\Windows\SYSTEM32\WUInstallAMD64.exe /install /autoaccepteula /silent /nomatch 'Antivirus'