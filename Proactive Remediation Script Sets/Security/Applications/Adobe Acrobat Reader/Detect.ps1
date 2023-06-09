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


#Prepare HKCU IAW https://call4cloud.nl/2020/03/how-to-deploy-hkcu-changes-while-blocking-powershell/
$drive = "HKU"
New-PSDrive -Name $drive -PSProvider "Registry" -Root "HKEY_USERS" | out-null
$user = get-wmiobject -Class Win32_Computersystem | Select-Object Username;
$sid = (New-Object System.Security.Principal.NTAccount($user.UserName)).Translate([System.Security.Principal.SecurityIdentifier]).value;

# Configure Data
$data = @(
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bEnhancedSecurityStandalone",                  "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bEnhancedSecurityInBrowser",                   "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bProtectedMode",                               "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "iProtectedView",                               "DWord",    "2",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "EnableProtectedModeAppContainer",              "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bDisableTrustedSites",                         "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "iFileAttachmentPerms",                         "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bDisablePDFHandlerSwitching",                  "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bEnableFlash",                                 "DWord",    "0",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bEnable3D",                                    "DWord",    "0",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bUpdater",                                     "DWord",    "0",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bToggleFTE",                                   "DWord",    "1", # Disable First Time Experience
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bToggleToDoList",                              "DWord",    "1", # Disable To Do List
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bAcroSuppressUpsell",                          "DWord",    "1", # Disable Acrobat Upsell
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bToggleDCAppCenter",                           "DWord",    "1", # Disable App Center
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bSendMailShareRedirection",                    "DWord",    "1", # Mail Icon Function
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bToggleSendAndTrack",                          "DWord",    "1", # Mail Icon Function
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bShowScanTabInHomeView",                       "DWord",    "0", # Disable Scan App Function
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bToggleToDoTiles",                             "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bToggleSophiaWebInfra",                        "DWord",    "0", 
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bLimitPromptsFeatureKey",                      "DWord",    "1", 
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bEnablePersistentButton",                      "DWord",    "0", 
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown",                          "bDisableJavaScript",                           "DWord",    "1", 
   #"HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cTrustedFolders",          "t1",                                           "String",   "TBA: A PATH",
   #"HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDowncDefaultLaunchURLPerms",    "iUnknownURLPerms",                             "DWord",    "3",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cSharePoint",              "bDisableSharePointFeatures",                   "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cIPM",                     "bDontShowMsgWhenViewingDoc",                   "DWord",    "0",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cWebmailProfiles",         "bDisableWebmail",                              "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices",                "bUpdater",                                     "DWord",    "0",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices",                "bToggleAdobeDocumentServices",                 "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices",                "bToggleAdobeSign",                             "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices",                "bTogglePrefSync",                              "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cServices",                "bToggleWebConnectors",                         "DWord",    "1",
    "HKLM:\\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\cCloud",                   "bAdobeSendPluginToggle",                       "DWord",    "1",
    "HKU:\\$sid\SOFTWARE\Adobe\Acrobat Acrobat\DC\TrustManager",                                "bEnableAlwaysOutlookAttachmentProtectedView",  "DWord",    "0",
    "HKU:\\$sid\SOFTWARE\Adobe\Adobe Acrobat\DC\HomeWelcomeFirstMile",                          "bEnableFirstMile",                             "DWord",    "0",
    "HKU:\\$sid\SOFTWARE\Adobe\Adobe Acrobat\DC\Workflows\cServices\cAcrobatApp",               "bAcrobatAppInstalled",                         "DWord",    "1",
    "HKU:\\$sid\SOFTWARE\Adobe\Adobe Acrobat\DC\Workflows\cServices\cScanApp",                  "bScanAppInstalled",                            "DWord",    "1"
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
        Remove-PSDrive -Name "HKU"
        exit 1
    }
    else {
        Write-Output "Remediation not required."
        Remove-PSDrive -Name "HKU"
        exit 0
    }

}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}
