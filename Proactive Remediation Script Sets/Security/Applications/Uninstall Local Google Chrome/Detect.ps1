# Based on https://sccmentor.com/2021/01/11/using-proactive-remediations-to-remove-google-chrome/

try {  

    $chromeInstalled = Test-Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe'

    if ($chromeInstalled -eq 'True') {
        Write-Host "Remediation required - Google Chrome is installed locally"
        exit 1
    }
    else {  
        Write-Host "No remediation required - Google Chrome is not installed locally"
        exit 0
    }  
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}