
#Prepare HKCU IAW https://call4cloud.nl/2020/03/how-to-deploy-hkcu-changes-while-blocking-powershell/
New-PSDrive HKU Registry HKEY_USERS | out-null
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
    for ($i = 0; $i -lt $data.Length; $i = $i + 4) {
        IF(!(Test-Path $data[$i]))
        {
            New-Item -Path $data[$i] -Force | Out-Null
        }
        Set-ItemProperty -path $data[$i] -name $data[$i+1] -value $data[$i+3] -type $data[$i+2]  -Force | Out-Null
    }
    Remove-PSDrive -Name "HKU"
    exit 0
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}