# Developed IAW https://www.anoopcnair.com/4-methods-to-enable-credential-guard-on-windows/

# Configure Data
$data = @(
    "HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard",  "EnableVirtualizationBasedSecurity",    "DWord",    "1", # 1 = Enabled, 0 = Disabled
    "HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard",  "RequirePlatformSecurityFeatures",      "DWord",    "1", # 1 = Secure Boot, 3 = Secure Boot + DMA Protection, 0 = OFF
    "HKLM:\\SYSTEM\CurrentControlSet\Control\Lsa",          "LsaCfgFlags",                          "DWord",    "1" # 0 = Disabled, 1 = CG with EUFI Lock, 2 = CG without UEFI Lock
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