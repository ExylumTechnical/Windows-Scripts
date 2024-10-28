#use the -output flag to set a custom output csv file
 param (
    [string]$output="C:\Users\$ENV:USERNAME\Downloads\pslist.csv"
 )
Get-Wmiobject win32_process | select name,executablepath,processid,parentprocessid,commandline | export-csv $output -NoTypeInformation
