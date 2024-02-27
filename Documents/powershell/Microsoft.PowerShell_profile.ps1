#Prompt
oh-my-posh init pwsh --config '~\AppData\Local\oh-my-posh/Dracula.omp.json'| Invoke-Expression

#Chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#Aliases
Set-Alias -Name Vim -Value Nvim
Set-Alias -Name tt -Value Tree
Set-Alias -Name G -Value Git
Set-Alias -Name Floorp -Value 'C:\Program Files\Ablaze Floorp\floorp.exe'

#Functions
Function Whereis ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

function pgrep($name) {
    Get-Process $name
}

function ll { Get-ChildItem -Path $pwd -File }

#Terminal Icons
Import-Module Terminal-Icons

#PSReadLine
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
set-PSReadLineOption -PredictionViewStyle ListView

#Z Jumper
Import-Module z
