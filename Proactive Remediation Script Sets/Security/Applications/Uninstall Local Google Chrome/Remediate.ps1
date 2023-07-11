$chromeInstalled = (Get-Item (Get-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe' -ErrorAction SilentlyContinue).'(Default)').VersionInfo
$ChromeVersion = $chromeInstalled.ProductVersion

try {
    $Installer = "$env:LOCALAPPDATA\Google\Chrome\Application\$ChromeVersion\Installer\setup.exe"
    $Arguements = "-uninstall -force-uninstall"
    Start-Process $Installer $Arguements -Wait
    exit 0
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}