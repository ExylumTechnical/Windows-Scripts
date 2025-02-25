#use the -output flag to set a custom output csv file
 param (
    [string]$output="C:\connections.csv",
    [string]$duration=1
 )
$timespan = New-TimeSpan -Minutes $duration
$timer = [diagnostics.stopwatch]::startnew()
while ($timer.elapsed -lt $timespan){
$gettcpconnections = Get-NetTCPConnection | Where-Object state -ne "Bound" | Select-Object localaddress,localport,remoteaddress,remoteport,state,owningprocess, @{Name="process";Expression={(Get-Process -id $_.OwningProcess).ProcessName}} | Export-Csv $output -NoTypeInformation -Append
$gettcpconnections
start-sleep -seconds 3
}
