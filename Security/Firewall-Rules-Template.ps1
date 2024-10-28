## Generated by ChatGPT and adjusted by Nicholas Howland

# Define a list of ports and a list of program paths to allow
$tcpPorts = @(443, 80)
$udpPorts = @(53)
$executableFiles = @(
    "C:\path\to\program1.exe",
    "C:\path\to\program2.exe",
)


## Create TCP rules that allow inbound and outbound connections on specified ports
foreach ($port in $tcpPorts) {
    New-NetFirewallRule -DisplayName "TCP allow inbound $port" -Direction Inbound -Protocol TCP -LocalPort $port -Action Allow
}
foreach ($port in $tcpPorts) {
    New-NetFirewallRule -DisplayName "TCP allow outbound $port" -Direction Outbound -Protocol TCP -LocalPort $port -Action Allow
}

## Create UDP rules that allow inbound and outbound connections on specified ports
foreach ($port in $udpPorts) {
    New-NetFirewallRule -DisplayName "UDP allow inbound $port" -Direction Inbound -Protocol UDP -LocalPort $port -Action Allow
}
foreach ($port in $udpPorts) {
    New-NetFirewallRule -DisplayName "UDP allow outbound $port" -Direction Outbound -Protocol UDP -LocalPort $port -Action Allow
}

# Allow inbound and outbound connections 
foreach ($file in $executableFiles) {
    New-NetFirewallRule -DisplayName "Allow file $file" -Direction Inbound -Program $file -Action Allow
}
foreach ($file in $executableFiles) {
    New-NetFirewallRule -DisplayName "Allow file $file" -Direction Outbound -Program $file -Action Allow
}

Write-Host "Firewall rules created successfully!"