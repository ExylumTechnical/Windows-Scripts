#find and replace "path\to-output" with your desired path for file output
 param (
    [string]$output="C:\Users\$ENV:USERNAME\Downloads\tcpconnections.csv",
    [string]$duration=1
 )
$timespan = New-TimeSpan -Minutes $duration
$timer = [diagnostics.stopwatch]::startnew()
while ($timer.elapsed -lt $timespan){
$gettcpconnections = Get-NetTCPConnection | Where-Object state -ne "Bound" | Select-Object localaddress,localport,remoteaddress,remoteport,state,owningprocess, @{Name="process";Expression={(Get-Process -id $_.OwningProcess).ProcessName}} | Export-Csv $output -NoTypeInformation -Append
$gettcpconnections
start-sleep -seconds 3
}
