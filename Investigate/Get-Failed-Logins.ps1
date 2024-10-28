$events = Get-EventLog -LogName Security -InstanceId 4625 -After (Get-Date).AddDays(-7)
$parsedEvents = $events | ForEach-Object {
    $event = $_
    $properties = @{
        TimeGenerated = $event.TimeGenerated
        TargetUserName = $event.ReplacementStrings[5]
        AccountDomain = $event.ReplacementStrings[2]
        WorkstationName = $event.ReplacementStrings[11]
        LogonType = $event.ReplacementStrings[8]
    }
    New-Object PSObject -Property $properties
}
$parsedEvents | Export-Csv -Path 'C:\login-failed-events.csv' -NoTypeInformation
