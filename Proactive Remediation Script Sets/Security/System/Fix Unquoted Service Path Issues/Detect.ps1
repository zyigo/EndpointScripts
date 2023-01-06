
# Get all services
$FixParameters = @()
$FixParameters += @{"Path" = "HKLM:\SYSTEM\CurrentControlSet\Services\" ; "ParamName" = "ImagePath" }
$FixParameters += @{"Path" = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" ; "ParamName" = "UninstallString" }

# If OS x64 - adding paths for x86 programs
If (Test-Path "$($env:SystemDrive)\Program Files (x86)\") {
    $FixParameters += @{"Path" = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\" ; "ParamName" = "UninstallString" }
}

Write-Host $FixParameters

# If ($Backup) {
#     If (! (Test-Path $BackupFolder)) {
#         New-Item $BackupFolder -Force -ItemType Directory | Out-Null
#     }
# }
# $PTElements = @()
# ForEach ($FixParameter in $FixParameters) {
#     Get-ChildItem $FixParameter.Path -ErrorAction SilentlyContinue | ForEach-Object {
#         $SpCharREGEX = '([\[\]])'
#         $RegistryPath = $_.name -Replace 'HKEY_LOCAL_MACHINE', 'HKLM:' -replace $SpCharREGEX, '`$1'
#         $OriginalPath = (Get-ItemProperty "$RegistryPath")
#         $ImagePath = $OriginalPath.$($FixParameter.ParamName)
#         If ($FixEnv) {
#             If ($($OriginalPath.$($FixParameter.ParamName)) -match '%(?''envVar''[^%]+)%') {
#                 $EnvVar = $Matches['envVar']
#                 $FullVar = (Get-ChildItem env: | Where-Object { $_.Name -eq $EnvVar }).value
#                 $ImagePath = $OriginalPath.$($FixParameter.ParamName) -replace "%$EnvVar%", $FullVar
#                 Clear-Variable Matches
#             } # End If
#         } # End If $fixEnv

#         # Get all services with vulnerability
#         If (($ImagePath -like "* *") -and ($ImagePath -notLike '"*"*') -and ($ImagePath -like '*.exe*')) {
#             # Skip MsiExec.exe in uninstall strings
#             If ((($FixParameter.ParamName -eq 'UninstallString') -and ($ImagePath -NotMatch 'MsiExec(\.exe)?') -and ($ImagePath -Match '^((\w\:)|(%[-\w_()]+%))\\')) -or ($FixParameter.ParamName -eq 'ImagePath')) {
#                 $NewPath = ($ImagePath -split ".exe ")[0]
#                 $key = ($ImagePath -split ".exe ")[1]
#                 $trigger = ($ImagePath -split ".exe ")[2]
#                 $NewValue = ''
#                 # Get service with vulnerability with key in ImagePath
#                 If (-not ($trigger | Measure-Object).count -ge 1) {
#                     If (($NewPath -like "* *") -and ($NewPath -notLike "*.exe")) {
#                         $NewValue = "`"$NewPath.exe`" $key"
#                     } # End If
#                     # Get service with vulnerability with out key in ImagePath
#                     ElseIf (($NewPath -like "* *") -and ($NewPath -like "*.exe")) {
#                         $NewValue = "`"$NewPath`""
#                     }
#                     If ((-not ([string]::IsNullOrEmpty($NewValue))) -and ($NewPath -like "* *")) {
#                         try {
#                             $soft_service = $(if ($FixParameter.ParamName -Eq 'ImagePath') { 'Service' }Else { 'Software' })
#                             $OriginalPSPathOptimized = $OriginalPath.PSPath -replace $SpCharREGEX, '`$1'
#                             Write-Output "$(get-date -format u)  :  Old Value : $soft_service : '$($OriginalPath.PSChildName)' - $($OriginalPath.$($FixParameter.ParamName))"
#                             Write-Output "$(get-date -format u)  :  Expected  : $soft_service : '$($OriginalPath.PSChildName)' - $NewValue"
#                             if ($Passthru) {
#                                 $PTElements += '' | Select-Object `
#                                 @{n = 'Name'; e = { $OriginalPath.PSChildName } }, `
#                                 @{n = 'Type'; e = { $soft_service } }, `
#                                 @{n = 'ParamName'; e = { $FixParameter.ParamName } }, `
#                                 @{n = 'Path'; e = { $OriginalPSPathOptimized } }, `
#                                 @{n = 'OriginalValue'; e = { $OriginalPath.$($FixParameter.ParamName) } }, `
#                                 @{n = 'ExpectedValue'; e = { $NewValue } }
#                             }
#                             If ($Backup) {
#                                 $BcpFileName = "$BackupFolder\$soft_service`_$($OriginalPath.PSChildName)`_$(get-date -uFormat "%Y-%m-%d_%H%M%S").reg"
#                                 $BcpTmpFileName = "$BackupFolder\$soft_service`_$($OriginalPath.PSChildName)`_$(get-date -uFormat "%Y-%m-%d_%H%M%S").tmp"
#                                 $BcpRegistryPath = $RegistryPath -replace '\:'
#                                 Write-Output "$(get-date -format u)  :  Creating registry backup : $BcpFileName"
#                                 $ExportResult = REG EXPORT $BcpRegistryPath $BcpTmpFileName | Out-String
#                                 Get-Content $BcpTmpFileName | Out-File $BcpFileName -Append
#                                 Remove-Item $BcpTmpFileName -Force -ErrorAction "SilentlyContinue"
#                                 Write-Output "$(get-date -format u)  :  Backup Result : $($ExportResult -split '\r\n' | Where-Object {$_ -NotMatch '^$'})"
#                             }
#                             If (! $WhatIf) {
#                                 Set-ItemProperty -Path $OriginalPSPathOptimized -Name $($FixParameter.ParamName) -Value $NewValue -ErrorAction Stop
#                                 $DisplayName = ''
#                                 $keyTmp = (Get-ItemProperty -Path $OriginalPSPathOptimized)
#                                 If ($soft_service -match 'Software') {
#                                     $DisplayName = $keyTmp.DisplayName
#                                 }
#                                 If ($keyTmp.$($FixParameter.ParamName) -eq $NewValue) {
#                                     Write-Output "$(get-date -format u)  :  SUCCESS  : Path value was changed for $soft_service '$($OriginalPath.PSChildName)' $(if($DisplayName){"($DisplayName)"})"
#                                 }
#                                 Else {
#                                     Write-Output "$(get-date -format u)  :  ERROR  : Something is going wrong. Path was not changed for $soft_service '$(if($DisplayName){$DisplayName}else{$OriginalPath.PSChildName})'."
#                                 }
#                             }
#                         }
#                         Catch {
#                             Write-Output "$(get-date -format u)  :  ERROR  : Something is going wrong. Value changing failed in service '$($OriginalPath.PSChildName)'."
#                             Write-Output "$(get-date -format u)  :  ERROR  : $_"
#                         }
#                         Clear-Variable NewValue
#                     }
#                 }
#             }
#         }
#         If (($trigger | Measure-Object).count -ge 1) {
#             Write-Output "$(get-date -format u)  :  ERROR  : Can't parse  $($OriginalPath.$($FixParameter.ParamName)) in registry  $($OriginalPath.PSPath -replace 'Microsoft\.PowerShell\.Core\\Registry\:\:') "
#         }
#     }
# }

# if ($Passthru) {
#     return $PTElements
# }