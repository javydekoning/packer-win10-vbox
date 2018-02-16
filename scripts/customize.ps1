write-host 'Installing PowerShell Modules'

Install-PackageProvider -name nuget -force

$PowerShellModules = @(
  'PSScriptAnalyzer','Pester','ISESteroids'
)

$PowerShellModules.ForEach({
  if (-not(get-module -name $_)) {
    find-module -name $_ | install-module -SkipPublisherCheck -force
  }
})

##################

write-host 'Installing Chocolatey and packages'

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$ChocoPackages = @(
  'googlechrome','filezilla','sublimetext3','jre8','7zip','greenshot','keepass',
  'dbeaver','unchecky','autohotkey','evernote','nodejs','keypirinha',
  'MobaXTerm','visualstudiocode','openssh','openvpn'
)

$ChocoPackages.ForEach({choco install $_ -y --no-progress -r})

##################

write-host 'Removing unwanted Windows Apps'
$null = get-appxpackage | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue