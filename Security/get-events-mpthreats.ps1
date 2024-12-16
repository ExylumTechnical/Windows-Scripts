# Event ID 1116 indicates detected threats
$DefenderEvents = Get-WinEvent -LogName "Microsoft-Windows-Windows Defender/Operational" ` | Where-Object { $_.Id -eq 1117 } 

# Check if there are any events
if (-not $DefenderEvents) {
    Write-Output "No events found for Event ID 1116 in the Defender log."
    return
}

# Loop through each event and display its properties
foreach ($Event in $DefenderEvents) {
    Write-Output "Event Time: $($Event.TimeCreated)"
    Write-Output "Message: $($Event.Message)"
    Write-Output "Event Properties:"
    Write-Output "---------------------"

    # List all properties and their values
    for ($i = 0; $i -lt $Event.Properties.Count; $i++) {
        Write-Output "Property $i $($Event.Properties[$i].Value)"
    }

    Write-Output "====================="
}
