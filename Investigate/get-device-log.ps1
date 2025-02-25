# Make sure USB device connections are logged
auditpol /set /subcategory:"Removable Storage" /success:enable /failure:enable
wevtutil sl Microsoft-Windows-DriverFrameworks-UserMode/Operational /e:true
wevtutil sl Microsoft-Windows-DeviceSetupManager/Admin /e:true
## save the logs to the file at USB_Logs.txt and output the most recent 20 events
Get-WinEvent -LogName "Microsoft-Windows-DeviceSetupManager/Admin" | Format-Table TimeCreated, Id, Message -AutoSize | Out-File USB_Logs.txt
(get-content USB_Logs.txt) | Select-String '\d{1,2}/\d{2}/\d{4}' | Sort-Object -Unique | Select-Object -Last 20
