$ErrorActionPreference = 'Stop'
$AppName = 'Voronkely'
$Source = Split-Path -Parent $PSScriptRoot
$Target = Join-Path $env:LOCALAPPDATA $AppName
New-Item -ItemType Directory -Force -Path $Target | Out-Null
Copy-Item -Path (Join-Path $PSScriptRoot 'voronkely.jar') -Destination $Target -Force
Copy-Item -Path (Join-Path $PSScriptRoot 'start-voronkely.bat') -Destination $Target -Force
Copy-Item -Path (Join-Path $PSScriptRoot 'README-install.txt') -Destination $Target -Force
New-Item -ItemType Directory -Force -Path (Join-Path $Target 'data') | Out-Null
$Shortcut = $env:USERPROFILE + '\Desktop\' + $AppName + '.lnk'
$WshShell = New-Object -ComObject WScript.Shell
$ShortcutObject = $WshShell.CreateShortcut($Shortcut)
$ShortcutObject.TargetPath = (Join-Path $Target 'start-voronkely.bat')
$ShortcutObject.WorkingDirectory = $Target
$ShortcutObject.IconLocation = (Join-Path $Target 'start-voronkely.bat')
$ShortcutObject.Save()
Write-Host 'Installation Voronkely terminée.'
