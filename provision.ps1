$isopath     = '.\iso\Windows10.iso'
$isochecksum = (Get-FileHash -Algorithm SHA1 -LiteralPath $isopath).hash
$arguments   = "build " + 
               "-var iso_checksum=$isochecksum " + 
               "-var iso_url=$isopath " +
               " .\windows_10_winrm_base.json"

Start-Process -FilePath 'packer.exe' -ArgumentList $arguments -Wait -NoNewWindow

Start-Process -FilePath 'packer.exe' -ArgumentList "build .\windows_10_winrm_update.json" -Wait -NoNewWindow

Start-Process -FilePath 'packer.exe' -ArgumentList "build .\windows_10_winrm_customize.json" -Wait -NoNewWindow