#find and replace "path\to-output" with your desired path for file output
 param (
    [string]$output="C:\Users\$ENV:USERNAME\Downloads\pslist.csv"
 )
Get-Wmiobject win32_process | select name,executablepath,processid,parentprocessid,commandline | export-csv $output -NoTypeInformation
