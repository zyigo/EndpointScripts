$ServiceName = 'tzautoupdate'
$Action = 'Auto'
$Status = 'Running'
$Service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

try {

    $result1 = $service.StartType -eq $Action
    $result2 = $service.Status -eq $Status
    $result = $result1 -Or $result2
    
    If ($result) {
        Write-Host "$ServiceName is already configured correctly."
        exit 0
    }
    else {
        Write-Warning "$ServiceName is not configured correctly."
        exit 1
    }

}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}
