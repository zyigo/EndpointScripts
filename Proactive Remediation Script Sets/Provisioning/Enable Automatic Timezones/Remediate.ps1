# Script based on https://github.com/IntuneTraining/TimezoneTurnOn

#region Settings
$ServiceName = 'tzautoupdate'
$Action = 'Auto'
#endregion

#region Functions
Function Repair-TimezoneServices {
    Param
    (
        [string]$ServiceName,
        [ValidateSet("Start", "Stop", "Restart", "Disable", "Auto", "Manual")]
        [string]$Action
    )

    try {
        Start-Transcript -Path "C:\Windows\Temp\$($ServiceName)_Management.Log" -Force -ErrorAction SilentlyContinue
        Get-Date
        $service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
        $service
        if ($service) {
            Switch ($Action) {
                "Start" { Start-Service -Name $ServiceName; Break; }
                "Stop" { Stop-Service -Name $ServiceName; Break; }
                "Restart" { Restart-Service -Name $ServiceName; Break; }
                "Disable" { Set-Service -Name $ServiceName -StartupType Disabled -Status Stopped; Break; }
                "Auto" { Set-Service -Name $ServiceName -StartupType Automatic -Status Running; Break; }
                "Manual" { Set-Service -Name $ServiceName -StartupType Manual -Status Running; Break; }
            }
            Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
        }
        Stop-Transcript -ErrorAction SilentlyContinue
    }
    catch {
        throw $_
    }
}
#endregion

#region Process
try {
    Write-Host "Repairing the Automatic Timezone service startup type to MANUAL."
    Repair-TimezoneServices -ServiceName $ServiceName -Action $Action
    Exit 0
}
catch {
    Write-Error $_.Exception.Message
}
#endregion
