<#
.SYNOPSIS
  <ScriptName: ConfigureEpsonIProjection>
.DESCRIPTION
  <Configures appropriate, and desired settings for an already installed instance of Epson's iProjection App.>
.OUTPUTS
  <Log file stored in C:\ProgramData\Microsoft\IntuneManagementExtension\Logs\win32-ConfigureEpsonIProjection.log>
#>

# If running as a 32-bit process on an x64 system, re-launch as a 64-bit process

if ("$env:PROCESSOR_ARCHITEW6432" -ne "ARM64")
{
    if (Test-Path "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe")
    {
        & "$($env:WINDIR)\SysNative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy bypass -NoProfile -File "$PSCommandPath"
        Exit $lastexitcode
    }
}

# Logging Preparation

$AppName = "ConfigureEpsonIProjection"
$Log_FileName = "win32-$AppName.log"
$Log_Path = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs\"
$TestPath = "$Log_Path\$Log_Filename"
$BreakingLine="- - "*10
$SubBreakingLine=". . "*10
$SectionLine="* * "*10

If(!(Test-Path $TestPath))
{
New-Item -Path $Log_Path -Name $Log_FileName -ItemType "File" -Force
}

function Write-Log {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$Message
    )
$timestamp = Get-Date -Format "dddd MM/dd/yyyy HH:mm:ss"
Add-Content -Path $TestPath -Value "$timestamp : $Message"
}

# TODO: #1 Configure appropriate error catching for Epson iProjection

# Start logging [Same file will be used for IME detection]
Write-Log "Configuring Epson iProjection settings..."
Write-Log $SectionLine

# Sets the connection mode to Advanced (i.e. via Wi-Fi)
reg add "HKLM\SOFTWARE\SEIKO EPSON CORPORATION\EasyMP Multi PC Projection\Setting" /v "ConnectedType" /t REG_DWORD /d "1" /f
Write-Log "Success: Advanced mode configured successfully"
Write-Log $SubBreakingLine

# Hides the Connection Type selection window on open.
reg add "HKLM\SOFTWARE\SEIKO EPSON CORPORATION\EasyMP Multi PC Projection\Setting" /v "ConnectType" /t REG_DWORD /d "0" /f
Write-Log "Success: Connection Type configured successfully"
Write-Log $SubBreakingLine

# Sets the bandwidth limit to the highest possible: (25Mbps)
reg add "HKLM\SOFTWARE\SEIKO EPSON CORPORATION\EasyMP Multi PC Projection\Setting" /v "ProjectionBand" /t REG_DWORD /d "8" /f
Write-Log "Success: Projection Band configured successfully"
Write-Log $SubBreakingLine

# Moves the Epson iProjection shortcut
Copy-Item /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\EPSON Projector\Epson iProjection\Epson iProjection Ver.3.00.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Epson iProjection.lnk"
Write-Log "Success: Epson iProjection shortcut relocated successfully"
Write-Log $SubBreakingLine

Write-Log "END - Epson iProjection was configured successfully"
Write-Log $BreakingLine