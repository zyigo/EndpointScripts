try {
    # Modify/extend this list to remove a printer.
    $printers = @(
        "Brother MFC-J6930DW",,
        "Brother MFC-J6930DW (Copy)",
        "Brother MFC-J6930DW (Copy 1)",
        "Brother MFC-J6930DW (Copy 2)"
    )

    for ($i = 0; $i -lt $data.Length; $i += 1) {
        $PrinterExists = Get-Printer -Name $printers[$i] -ErrorAction SilentlyContinue
        $remediate += $PrinterExists
    }

    if ($remediate -contains $true) {
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