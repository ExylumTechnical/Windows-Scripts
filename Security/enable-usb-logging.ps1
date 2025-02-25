auditpol /set /subcategory:"Removable Storage" /success:enable /failure:enable
wevtutil sl Microsoft-Windows-DriverFrameworks-UserMode/Operational /e:true
wevtutil sl Microsoft-Windows-DeviceSetupManager/Admin /e:true
