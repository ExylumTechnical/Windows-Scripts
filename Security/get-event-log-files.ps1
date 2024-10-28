mkdir C:\Windows\Temp\EventLogs
copy C:\windows\system32\winevt\Logs\* C:\Windows\Temp\EventLogs
Compress-Archive C:\Windows\Temp\EventLogs C:\EventLogExport.zip
remove-item -path C:\Windows\Temp\EventLogs -Recurse -Force