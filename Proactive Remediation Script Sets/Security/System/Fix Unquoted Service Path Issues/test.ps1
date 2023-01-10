#Requires -RunAsAdministrator


# SETUP
"--------------- SETTING UP ---------------"
$testparams = @{
    "directory"      = "C:\Program Files\A Subfolder";
    "directory_full" = "C:\Program Files\A Subfolder\B Subfolder\C Subfolder";
    "rule"           = '"BUILTIN\Users":W';
}

$exampleservice = @{
    Name           = "Some Vulnerable Service"
    BinaryPathName = "$($testparams.directory_full)\SomeExecutable.exe"
    DisplayName    = "Vuln Service DP"
    Description    = "This is a test service."
}

New-Service @exampleservice | Out-Null

if (Get-Service "Some Vulnerable Service" -ErrorAction SilentlyContinue) {
    "Example Service created......"
}

New-Item "$($testparams.directory_full)" -ItemType Directory | Out-Null
cmd /c icacls "$($testparams.directory)" | Out-Null
cmd /c icacls $testparams.directory /grant $testparams.rule | Out-Null


# RUN TESTS
""
"--------------- TESTING ---------------"
"Testing Detection......"
$detect1 = & "./Detect.ps1"
Write-Output "Detection Script returned: $detect1"

"Testing Remediation......"
& "./Remediate.ps1"

"Testing Detection again......"
$detect2 = & "./Detect.ps1"
Write-Output "Detection Script returned: $detect2"

""
"~~~ RESULT ~~~"
if ($detect1 -eq "Remediation required." -and $detect2 -eq "Remediation not required.") {
    "PR Set works successfully!"
} else {
    "PR Set does not work."
}

# CLEAN UP
""
"--------------- CLEANING UP ---------------"
if (Get-Service $exampleservice.name -ErrorAction SilentlyContinue) {
    "Example Service Exists... Removing now..."
    if ($PSVersionTable.PSVersion.Major -ge 6) {
        Remove-Service $exampleservice.name
    }
    else {
        $service = Get-WmiObject -Class Win32_Service -Filter "Name='$($exampleservice.name)'"
        $service.delete() | Out-Null
    }
}

if (!(Get-Service "$($exampleservice.name)" -ErrorAction SilentlyContinue)) {
    "Example Service deleted......"
}

Remove-Item "$($testparams.directory_full)"
"Temporary folder deleted......"
exit