<#
        .SYNOPSIS
        Cleans up old printers and printer ports.

        .DESCRIPTION
        Cleans up old printers and printer ports.
        Proactive Remediation Set - Remediation Scripte (Microsoft Endpoint Manager).

        .INPUTS
        None. This file should be modified before being uploaded to Microsoft Endpoint Manager.

        .OUTPUTS
        Exit Code 0. Remediation complete.
        Exit Code 1. Error occured whilst attempting remediation.

        .LINK
        https://github.com/ALARP-Solutions/EndpointScripts/tree/main/Proactive%20Remediation%20Script%20Sets/Cleanup/Cleanup%20Printers%20and%20Ports
    #>

 try {
    # Modify/extend this list to remove a printer.
    $printers = @(
        "Brother MFC-J6930DW",
        "Brother MFC-J6930DW (Copy)",
        "Brother MFC-J6930DW (Copy 1)",
        "Brother MFC-J6930DW (Copy 2)"
    )
    
    # Modify/extend this list to remove a printer port. It can be empty, but must match the Detect.ps1 script.
    $ports = @(
        "Brother MFC-J6930DW port",
        "Brother MFC-J6930DW (Copy) port",
        "Brother MFC-J6930DW (Copy 1) port",
        "Brother MFC-J6930DW (Copy 2) port"
    )

    Remove-Printer -Name $printers[0..$printers.Length] -Confirm:$false -ErrorAction SilentlyContinue
    Remove-PrinterPort -Name $ports[0..$ports.Length] -Confirm:$false -ErrorAction SilentlyContinue
    exit 0
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}