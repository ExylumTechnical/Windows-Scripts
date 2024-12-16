# Define Syslog Server details
$SyslogServer = "SYSLOGIPADDRESS"
$SyslogPort = 514

# Get Threat Detections from Windows Defender Event Logs
$DefenderEvents = Get-WinEvent -LogName "Microsoft-Windows-Windows Defender/Operational" `
    | Where-Object { $_.Id -eq 1117 } 
# Event ID 1116 indicates detected threats as well but I used 1117 because it has more info


foreach ($Event in $DefenderEvents) {
    # Parse event details based on all events found
    $DetectionTime = $Event.TimeCreated
    $ThreatID = $Event.Properties[6].Value
    $ThreatName = $Event.Properties[7].Value
    $Severity = $Event.Properties[9].Value
    $AffectedFile = $Event.Properties[21].Value
    $ActionTaken = $Event.Properties[30].Value

    # Format as Syslog message
    $SyslogMessage = "<134>$($DetectionTime) $(hostname) Defender: ThreatName='$ThreatName', ThreatID='$ThreatID', Severity='$Severity', File='$AffectedFile', Action='$ActionTaken'"
    $UdpClient = New-Object System.Net.Sockets.UdpClient
    $SyslogBytes = [System.Text.Encoding]::UTF8.GetBytes($SyslogMessage)
    $UdpClient.Send($SyslogBytes, $SyslogBytes.Length, $SyslogServer, $SyslogPort)
    $UdpClient.Close()
}
