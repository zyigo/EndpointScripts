# Script detects the new Microsoft Teams consumer app on Windows 11.

try {
    ##$ Test if MS Teams is installed
    $test1 = -not($null -eq (Get-AppxPackage -Name MicrosoftTeams))

    ## Test if Work or School Teams Shortcut is named properly
    $path = [Environment]::GetFolderPath([Environment+SpecialFolder]::ApplicationData)
    $path = "$path\Microsoft\Windows\Start Menu\Programs\Microsoft Teams (work or school).lnk"
    $test2 = Test-Path $path -PathType leaf

    if ($test1 -or $test2) {
        Write-Host "Microsoft Teams client found or shortcut not named correctly."
        exit 1
    }
    Else {
        Write-Host "Microsoft Teams client not installed (as expected) & shortcut to Work or School Teams renamed correctly."
        exit 0
    }

}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}