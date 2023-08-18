  try {
    # Modify/extend this list to remove a printer.
    $printers = @(
        "Brother MFC-J6930DW",
        "Brother MFC-J6930DW (Copy)",
        "Brother MFC-J6930DW (Copy 1)",
        "Brother MFC-J6930DW (Copy 2)"
    )
    
    # Modify/extend this list to remove a printer port. It can be empty, but must match the Remediate.ps1 script.
    $ports = @(
        "Brother MFC-J6930DW port",
        "Brother MFC-J6930DW (Copy) port",
        "Brother MFC-J6930DW (Copy 1) port",
        "Brother MFC-J6930DW (Copy 2) port"
    )
    
    $remediate = @()
    $remediate += Get-Printer -Name $printers[0..$printers.Length] -ErrorAction SilentlyContinue
    $remediate += Get-PrinterPort -Name $printers[0..$ports.Length] -ErrorAction SilentlyContinue

    if ($remediate.Count -gt 0) {
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