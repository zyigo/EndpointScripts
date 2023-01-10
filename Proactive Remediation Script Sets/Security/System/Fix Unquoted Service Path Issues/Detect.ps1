try {
    $FixParameters = @()
    $FixParameters += @{"Path" = "HKLM:\SYSTEM\CurrentControlSet\Services\" ; "ParamName" = "ImagePath" }
    $FixParameters += @{"Path" = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" ; "ParamName" = "UninstallString" }

    # If OS x64 - adding paths for x86 programs
    If (Test-Path "$($env:SystemDrive)\Program Files (x86)\") {
        $FixParameters += @{"Path" = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\" ; "ParamName" = "UninstallString" }
    }

    $PTElements = @()
    ForEach ($FixParameter in $FixParameters) {
        Get-ChildItem $FixParameter.Path -ErrorAction SilentlyContinue | ForEach-Object {
            $SpCharREGEX = '([\[\]])'
            $RegistryPath = $_.name -Replace 'HKEY_LOCAL_MACHINE', 'HKLM:' -replace $SpCharREGEX, '`$1'
            $OriginalPath = (Get-ItemProperty "$RegistryPath")
            $ImagePath = $OriginalPath.$($FixParameter.ParamName)
            If ($($OriginalPath.$($FixParameter.ParamName)) -match '%(?''envVar''[^%]+)%') {
                $EnvVar = $Matches['envVar']
                $FullVar = (Get-ChildItem env: | Where-Object { $_.Name -eq $EnvVar }).value
                $ImagePath = $OriginalPath.$($FixParameter.ParamName) -replace "%$EnvVar%", $FullVar
                Clear-Variable Matches
            } # End If
            # Get all services with vulnerability
            If (($ImagePath -like "* *") -and ($ImagePath -notLike '"*"*') -and ($ImagePath -like '*.exe*')) {
                # Skip MsiExec.exe in uninstall strings
                If ((($FixParameter.ParamName -eq 'UninstallString') -and ($ImagePath -NotMatch 'MsiExec(\.exe)?') -and ($ImagePath -Match '^((\w\:)|(%[-\w_()]+%))\\')) -or ($FixParameter.ParamName -eq 'ImagePath')) {
                    $NewPath = ($ImagePath -split ".exe ")[0]
                    $key = ($ImagePath -split ".exe ")[1]
                    $trigger = ($ImagePath -split ".exe ")[2]
                    $NewValue = ''
                    # Get service with vulnerability with key in ImagePath
                    If (-not ($trigger | Measure-Object).count -ge 1) {
                        If (($NewPath -like "* *") -and ($NewPath -notLike "*.exe")) {
                            $NewValue = "`"$NewPath.exe`" $key"
                        } # End If
                        # Get service with vulnerability with out key in ImagePath
                        ElseIf (($NewPath -like "* *") -and ($NewPath -like "*.exe")) {
                            $NewValue = "`"$NewPath`""
                        } # End ElseIf
                        If ((-not ([string]::IsNullOrEmpty($NewValue))) -and ($NewPath -like "* *")) {
                            try {
                                $soft_service = $(if ($FixParameter.ParamName -Eq 'ImagePath') { 'Service' }Else { 'Software' })
                                $OriginalPSPathOptimized = $OriginalPath.PSPath -replace $SpCharREGEX, '`$1'
                                Write-Debug "$(get-date -format u)  :  Old Value : $soft_service : '$($OriginalPath.PSChildName)' - $($OriginalPath.$($FixParameter.ParamName))"
                                Write-Debug "$(get-date -format u)  :  Expected  : $soft_service : '$($OriginalPath.PSChildName)' - $NewValue"
                            
                                $PTElements += '' | Select-Object `
                                @{n = 'Name'; e = { $OriginalPath.PSChildName } }, `
                                @{n = 'Type'; e = { $soft_service } }, `
                                @{n = 'ParamName'; e = { $FixParameter.ParamName } }, `
                                @{n = 'Path'; e = { $OriginalPSPathOptimized } }, `
                                @{n = 'OriginalValue'; e = { $OriginalPath.$($FixParameter.ParamName) } }, `
                                @{n = 'ExpectedValue'; e = { $NewValue } }
                            
                            }
                            Catch {
                                Write-Debug "$(get-date -format u)  :  ERROR  : Something is going wrong. Value changing failed in service '$($OriginalPath.PSChildName)'."
                                Write-Debug "$(get-date -format u)  :  ERROR  : $_"
                            }
                            Clear-Variable NewValue
                        }
                    }
                }
            }
            If (($trigger | Measure-Object).count -ge 1) {
                Write-Debug "$(get-date -format u)  :  ERROR  : Can't parse  $($OriginalPath.$($FixParameter.ParamName)) in registry  $($OriginalPath.PSPath -replace 'Microsoft\.PowerShell\.Core\\Registry\:\:') "
            }
        }
    }

    If ($($PTElements.count) -gt 0) {
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