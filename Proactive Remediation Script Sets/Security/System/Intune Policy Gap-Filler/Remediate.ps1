# Developed IAW https://www.anoopcnair.com/4-methods-to-enable-credential-guard-on-windows/

# Configure Data
$data = @(
    "HKLM:\\SYSTEM\CurrentControlSet\Control\Lsa",                                                      "disabledomaincreds",           "DWord",    "1",       
    "HKLM:\\SYSTEM\CurrentControlSet\Control\Lsa",                                                      "RunAsPPL",                     "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Installer",                                             "AlwaysInstallElevated",        "DWord",    "0",
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Network Connections",                                   "NC_ShowSharedAccessUI",        "DWord",    "0",
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Network Connections",                                   "NC_StdDomainUserSetLocation",  "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services",                                  "UserAuthentication",           "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Microsoft Services\AdmPwd",                                               "AdmPwdEnabled",                "DWord",    "1",
    "HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity",    "Enabled",                      "DWord",    "1",       
    "HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity",    "Locked",                       "DWord",    "1",   
    "HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity",    "HVCIMATRequired",              "DWord",    "0"
)

try {
    for ($i = 0; $i -lt $data.Length; $i = $i + 4) {
        IF(!(Test-Path $data[$i]))
        {
            New-Item -Path $data[$i] -Force | Out-Null
        }
        Set-ItemProperty -path $data[$i] -name $data[$i+1] -value $data[$i+3] -type $data[$i+2]  -Force | Out-Null
    }
    exit 0
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}
