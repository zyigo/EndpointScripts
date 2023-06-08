# Developed IAW https://www.anoopcnair.com/4-methods-to-enable-credential-guard-on-windows/
Function Test-RegistryValue {
    param(
        [Alias("PSPath")]
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [String]$Path
        ,
        [Parameter(Position = 1, Mandatory = $true)]
        [String]$Name
        ,
        [Switch]$PassThru
    ) 

    process {
        if (Test-Path $Path) {
            $Key = Get-Item -LiteralPath $Path
            if ($null -ne $Key.GetValue($Name, $null)) {
                if ($PassThru) {
                    Get-ItemProperty $Path $Name
                }
                else {
                    $true
                }
            }
            else {
                $false
            }
        }
        else {
            $false
        }
    }
}

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
    
    $remediate = @()

    for ($i = 0; $i -lt $data.Length; $i = $i + 4) {
        if ((Test-RegistryValue $data[$i] $data[$i+1] -PassThru).($data[$i+1]) -eq $data[$i+3]) {
            Write-Output "Key '$($data[$i+1])' exists, and is set correctly to $($data[$i+3])."
            $remediate += $false
        }
        else {
            Write-Output "Key '$($data[$i+1])' doesn't exist, or isn't set to $($data[$i+3])."
            $remediate += $true
        }
    }

    if ($remediate -contains $true) {
        Write-Output "Remediation required."
        exit 1
    }
    else {
        Write-Output "Remediation not required."
        exit 0
    }

}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}
