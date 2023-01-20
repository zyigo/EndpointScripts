$ServiceName = 'tzautoupdate'
$Action = 'Manual'
$Service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

try {
    If ($service.StartType -eq $Action) {
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