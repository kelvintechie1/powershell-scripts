# PowerShell Script - Create MDT script - Create Initial Task Sequences
Import-Module "C:\Program Files\Microsoft Deployment Toolkit\bin\MicrosoftDeploymentToolkit.psd1"

# Remove DS001 if it already exists
Remove-PSDrive -Name "DS001" -ErrorAction Continue

# Mount K Drive as PXEDUST-SERVER BaseDeploymentShare$
New-PSDrive -Name "DS001" -PSProvider MDTProvider -Root "\\pxedust-server\BaseDeploymentShare$"

# Define operating systems in variable to iterate through

$Server2016DC = @("Windows Server 2016 DC-C", 
"Windows Server 2016 DC-DE")
$Server2016ST = @("Windows Server 2016 ST-C",
"Windows Server 2016 ST-DE")
$Server2016ES = "Windows Server 2016 Essentials"
$Windows7 = @("Windows 7 HomeBasic",
"Windows 7 HomePremium",
"Windows 7 Professional",
"Windows 7 Ultimate")
$Server2008R2 = @("Windows Server 2008 R2 DC-C",
"Windows Server 2008 R2 DC-DE",
"Windows Server 2008 R2 EN-C",
"Windows Server 2008 R2 EN-DE",
"Windows Server 2008 R2 ST-C",
"Windows Server 2008 R2 ST-DE",
"Windows Server 2008 R2 WB-C",
"Windows Server 2008 R2 WB-DE")
$Server2012R2DC = @("Windows Server 2012 R2 DC-C",
"Windows Server 2012 R2 DC-DE")
$Server2012R2ST = @("Windows Server 2012 R2 ST-C",
"Windows Server 2012 R2 ST-DE")
$Windows8 = @("Windows 8.1 Home",
"Windows 8.1 Pro",
"Windows Embedded Industry 8.1")
$Windows10 = @("Windows 10 Edu",
"Windows 10 Home",
"Windows 10 Pro",
"Windows 10 Pro Edu",
"Windows 10 Pro WS")
$Server2019DC = @("Windows Server 2019 DC-C",
"Windows Server 2019 DC-DE")
$Server2019ST = @("Windows Server 2019 ST-C",
"Windows Server 2019 ST-DE")
$Server2019ES = "Windows Server 2019 Essentials"
$IPR = @("Windows Server IPR DC-C",
"Windows Server IPR ST-C",
"Windows 10 IPR Edu",
"Windows 10 IPR Home",
"Windows 10 IPR Pro Edu",
"Windows 10 IPR Pro WS",
"Windows 10 IPR Pro")

$KServer2019DC = "H3RNG-8C32Q-Q8FRX-6TDXV-WMBMW"
$KServer2019ST = "TNK62-RXVTB-4P47B-2D623-4GF74"
$KServer2019ES = "2CTP7-NHT64-BP62M-FV6GG-HFV28"
$KServer2016DC = "TMJ3Y-NTRTM-FJYXT-T22BY-CWG3J"
$KServer2016ST = "C3RCX-M6NRP-6CXC9-TW2F2-4RHYD"
$KServer2016ES = "B4YNW-62DX9-W8V6M-82649-MHBKQ"
$KServer2012R2DC = "Y4TGP-NPTV9-HTC2H-7MGQ3-DV4TW"
$KServer2012R2ST = "DBGBW-NPF86-BJVTX-K3WKJ-MTB6V"
$KServer2012R2ES = "K2XGM-NMBT3-2R6Q8-WF2FK-P36R2"

$counter = 0

foreach ($element in $Server2019DC) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2019" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2019-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2019\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2019" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2019-AVMA-" + $counter) -Comments $element -ProductKey $KServer2019DC -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2019\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

foreach ($element in $Server2019ST) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2019" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2019-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2019\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2019" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2019-AVMA-" + $counter) -Comments $element -ProductKey $KServer2019ST -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2019\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

foreach ($element in $Server2019ES) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2019" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2019-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2019\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2019" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2019-AVMA-" + $counter) -Comments $element -ProductKey $KServer2019DC -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2019\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

$counter = 0

foreach ($element in $Server2016DC) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2016" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2016-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2016\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2016" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2016-AVMA-" + $counter) -Comments $element -ProductKey $KServer2016DC -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2016\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

foreach ($element in $Server2016ST) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2016" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2016-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2016\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2016" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2016-AVMA-" + $counter) -Comments $element -ProductKey $KServer2016ST -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2016\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

foreach ($element in $Server2016ES) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2016" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2016-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2016\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2016" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2016-AVMA-" + $counter) -Comments $element -ProductKey $KServer2016ES -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2016\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

$counter = 0

foreach ($element in $Server2012R2DC) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2012 R2" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2012R2-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2012 R2\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2012 R2" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2012R2-AVMA-" + $counter) -Comments $element -ProductKey $KServer2012R2DC -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2012 R2\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

foreach ($element in $Server2012R2ST) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2012 R2" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2012R2-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2012 R2\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2012 R2" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2012R2-AVMA-" + $counter) -Comments $element -ProductKey $KServer2012R2ST -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2012 R2\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

foreach ($element in $Server2012R2ES) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2012 R2" -Template Client.xml -Name ($element + " Regular Deployment") -ID ("WS2012R2-RD-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2012 R2\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2012 R2" -Template Client.xml -Name ($element + " AVMA Deployment") -ID ("WS2012R2-AVMA-" + $counter) -Comments $element -ProductKey $KServer2012R2ES -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2012 R2\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

$counter = 0

foreach ($element in $Windows7) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows 7" -Template Client.xml -Name $element -ID ("W7-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows 7\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

$counter = 0

foreach ($element in $Server2008R2) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows Server 2008 R2" -Template Client.xml -Name $element -ID ("WS2008R2-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows Server 2008 R2\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

$counter = 0

foreach ($element in $Windows8) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows 8.1" -Template Client.xml -Name $element -ID ("W8-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows 8.1\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

$counter = 0

foreach ($element in $Windows10) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Windows 10" -Template Client.xml -Name $element -ID ("W10-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Windows 10\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}

$counter = 0

foreach ($element in $IPR) {
    Import-MDTTaskSequence -Path "DS001:\Task Sequences\Insider Previews" -Template Client.xml -Name $element -ID ("IPR-" + $counter) -Comments $element -OperatingSystemPath ("DS001:\Operating Systems\Insider Previews\" + $element) -FullName "Administrator" -OrgName "n/a"` -AdminPassword "DefaultAdminAccount!"

    $counter += 1
}
