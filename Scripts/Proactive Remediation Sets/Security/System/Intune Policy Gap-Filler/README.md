# Intune Policy Gap-Filler
Configures registry elements not currently available through intune profiles, that are also considered required by Microsoft Defender.
 
## Pre-Requisites
There are no pre-requisites for this PR set.

## Instructions
Modify both the detection and remediation scripts to set the appropriate registry values. Defaults are shown below.

| Registry Key                                                      | Registry Value                | Type  | Script Default    |
| ---                                                               | ---                           | ---   | ---               |
| HKLM:\\SYSTEM\CurrentControlSet\Control\Lsa                       | disabledomaincreds            | Dword | 1                 |
| HKLM:\\SYSTEM\CurrentControlSet\Control\Lsa                       | RunAsPPL                      | Dword | 1                 |
| HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Installer              | AlwaysInstallElevated         | Dword | 0                 |
| HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Network Connections    | NC_ShowSharedAccessUI         | DWord | 0                 |
| HKLM:\\SOFTWARE\Policies\Microsoft\Windows\Network Connections    | NC_StdDomainUserSetLocation   | DWord | 1                 |
| HKLM:\\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services   | UserAuthentication            | DWord | 1                 |
| HKLM:\\SOFTWARE\Policies\Microsoft Services\AdmPwd                | AdmPwdEnabled                 | Dword | 1                 |