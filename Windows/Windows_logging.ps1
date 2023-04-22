wevtutil epl Application Application.evtx
wevtutil epl Security Security.evtx
wevtutil epl Setup Setup.evtx
wevtutil epl System System.evtx
wevtutil epl "Windows PowerShell" PowerShell.evtx

get-winevent -path .\PowerShell.evtx | Format-table -wrap > PowerShell.txt
get-winevent -path .\Application.evtx | Format-table -wrap > Application.txt
get-winevent -path .\Security.evtx| Format-table -wrap > Security.txt
get-winevent -path .\System.evtx | Format-table -wrap > System.txt
get-winevent -path .\Setup.evtx | Format-table -wrap > Setup.txt



$Begin = Get-Date -Date '1/1/2023 01:00:00'
$End = Get-Date -Date '1/1/2023 02:00:00'
Get-EventLog -LogName "Windows Powershell" -After $Begin -Before $
