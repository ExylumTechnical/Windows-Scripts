# Dump log files
wevtutil epl Application Application.evtx
wevtutil epl Security Security.evtx
wevtutil epl Setup Setup.evtx
wevtutil epl System System.evtx
wevtutil epl "Windows PowerShell" PowerShell.evtx

# Transfer them to a text file
get-winevent -path .\PowerShell.evtx | Format-table -wrap > PowerShell.txt
get-winevent -path .\Application.evtx | Format-table -wrap > Application.txt
get-winevent -path .\Security.evtx| Format-table -wrap > Security.txt
get-winevent -path .\System.evtx | Format-table -wrap > System.txt
get-winevent -path .\Setup.evtx | Format-table -wrap > Setup.txt


# Look at logs from a specific date.
$Begin = Get-Date -Date '1/1/2023 01:00:00'
$End = Get-Date -Date '1/1/2023 02:00:00'
Get-EventLog -LogName "Windows Powershell" -After $Begin -Before $End

# setting variubles
$a=1
$b=2
$c=1
# conditional statements
if($a -ne $b){
  echo "a and b are not equal"
}else{
  echo "a and b are equal"
}
# the or statement is funny, it is formatted as seen below
if($a -ne $b,$c){
  echo "a is not equal to b or c"
}else{
  echo "a and is equal to b or c"
}



