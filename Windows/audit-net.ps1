# Define the base IP and range for the ping sweep
$baseIP = "192.168.1."  # Adjust this to match your network
$startRange = 1
$endRange = 254

# Initialize an empty array to store the results
$results = @()

# Perform the ping sweep
for ($i = $startRange; $i -le $endRange; $i++) {
    $ip = $baseIP + $i
    $pingResult = Test-Connection -ComputerName $ip -Count 1 -Quiet

    if ($pingResult) {
        # Get the hostname of the online host
        try {
            $hostname = [System.Net.Dns]::GetHostEntry($ip).HostName
        } catch {
            $hostname = "Hostname Not Found"
        }

        # Get the MAC address from the ARP table
        $arpEntry = arp -a | Select-String $ip
        $macAddress = if ($arpEntry) {
            $arpEntry -replace '.*?(\b[0-9A-Fa-f]{2}(:|-)[0-9A-Fa-f]{2}(:|-)[0-9A-Fa-f]{2}(:|-)[0-9A-Fa-f]{2}(:|-)[0-9A-Fa-f]{2}(:|-)[0-9A-Fa-f]{2}\b).*', '$1'
        } else {
            "MAC Address Not Found"
        }
        # If MAC address is found, store the result
        if ($macAddress) {
            $results += [PSCustomObject]@{
                IPAddress  = $ip
                Hostname   = $hostname
                Status     = "Online"
                MACAddress = $macAddress
            }
        } else {
            $results += [PSCustomObject]@{
                IPAddress  = $ip
                Hostname   = $hostname
                Status     = "Online"
                MACAddress = "MAC Address Not Found"
            }
        }
    } else {
        # Store the offline host result
        $results += [PSCustomObject]@{
            IPAddress  = $ip
            Hostname   = "N/A"
            Status     = "Offline"
            MACAddress = "N/A"
        }
    }
}

# Export the results to a CSV file
$results | Export-Csv -Path "PingSweepResults.csv" -NoTypeInformation

Write-Host "Ping sweep completed. Results saved to PingSweepResults.csv"
