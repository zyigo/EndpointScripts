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
    "HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard",  "EnableVirtualizationBasedSecurity",    "DWord",    "1", # 1 = Enabled, 0 = Disabled
    "HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard",  "RequirePlatformSecurityFeatures",      "DWord",    "1", # 1 = Secure Boot, 3 = Secure Boot + DMA Protection, 0 = OFF
    "HKLM:\\SYSTEM\CurrentControlSet\Control\Lsa",          "LsaCfgFlags",                          "DWord",    "1" # 0 = Disabled, 1 = CG with EUFI Lock, 2 = CG without UEFI Lock
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
