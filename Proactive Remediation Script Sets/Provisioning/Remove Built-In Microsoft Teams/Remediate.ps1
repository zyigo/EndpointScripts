# Script removes the new Microsoft Teams consumer app on Windows 11.
try {
    if (-not($null -eq (Get-AppxPackage -Name MicrosoftTeams))) {
        Write-Host "Removing Microsoft Teams..."
        Get-AppxPackage -Name MicrosoftTeams | Remove-AppxPackage -ErrorAction stop
        Write-Host "Microsoft Teams removed."
    }

    ## Test if Work or School Teams Shortcut is named properly
    $path = [Environment]::GetFolderPath([Environment+SpecialFolder]::ApplicationData)
    $path = "$path\Microsoft\Windows\Start Menu\Programs"
    $oldpath = "$path\Microsoft Teams (work or school).lnk"
    $newpath = "$path\Microsoft Teams.lnk"

    if (Test-Path $oldpath -PathType leaf) {
        Write-Host "Renaming Microsoft Teams (work or school) shortcut..."
        Rename-Item -Path $oldpath -NewName $newpath
        Write-Host "Microsoft Teams shortcut renamed."
    }

    exit 0
}
catch {
    Write-Error $_.Exception.Message
}