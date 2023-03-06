function Update-Environment-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function Push-User-Path($userPath) {
    $path = [Environment]::GetEnvironmentVariable('Path', 'User')
    $newpath = "$userPath;$path"
    [Environment]::SetEnvironmentVariable("Path", $newpath, 'User')
    Update-Environment-Path
}

#
# Comprobar permisos de administrador
#
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Debes ejecutar el script como administrador"
    Exit
}

# Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Update-Environment-Path

# Utils
Get-Command -Module Microsoft.PowerShell.Archive


choco install opera-gx -y
choco install adobereader -y
choco install googlechrome -y
choco install vcredist140 --version 14.34.31938 -y
choco install 7zip.install -y
choco install anydesk.install -y
choco install vlc -y
choco install deluge -y
choco install leagueoflegends -y
choco install steam -y
choco install goggalaxy -y
choco install discord -y
choco install steelseries-engine -y 
choco install lghub -y
choco install epicgameslauncher -y
choco install obs-studio -y
choco install ps-remote-play -y
choco install hwmonitor -y
choco install blitz.gg -y
choco install geforce-experience -y
choco install directx -y
choco install parsec -y
choco install gamesavemanager -y
