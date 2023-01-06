# Enable Credential Guard
## Pre-Requisites
There are no pre-requisites for this PR set.

## Instructions
Modify both the detection and remediation scripts to set the appropriate registry values. Defaults are shown below.

| Registry Key                                          | Registry Value                    | Type  | Script Default    |
| ---                                                   | ---                               | ---   | ---               |
| HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard   | EnableVirtualizationBasedSecurity | DWord | 1                 |
| HKLM:\\SYSTEM\CurrentControlSet\Control\DeviceGuard   | RequirePlatformSecurityFeatures   | DWord | 1                 |
| HKLM:\\SYSTEM\CurrentControlSet\Control\Lsa           | LsaCfgFlags                       | DWord | 1                 |