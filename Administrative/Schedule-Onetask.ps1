# unregister scheduled tasks with the same name
Unregister-ScheduledTask -TaskName "Name of Task" -confirm:$false

# Define the task name and description
$TaskName = "Name of Task"
$TaskDescription = "Description of the task"
# set the user principle to be system
$principal = New-ScheduledTaskPrincipal -UserId "LOCALSERVICE" -LogonType ServiceAccount
# Define the action
$Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument 'write-host "Do some stuff in powershell"'
# Define the trigger (daily at the specified time)
$Trigger = New-ScheduledTaskTrigger -Once -At 12:00am
# Register the scheduled task
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Description $TaskDescription -Principal $principal