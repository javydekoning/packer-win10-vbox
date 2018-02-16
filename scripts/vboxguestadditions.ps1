$driveletter = (gwmi win32_volume | ? {$_.label -match 'vbox'}).driveletter

$certpath = join-path $driveletter '\cert\'
$certutil = join-path $certpath 'VBoxCertUtil.exe'
gci $certpath -filter '*.cer' | select -expandproperty fullname | % {cmd /c $certutil add-trusted-publisher $_ --root $_}

$command = join-path $driveletter 'vboxwindowsadditions.exe'  
cmd /c $command /S /L