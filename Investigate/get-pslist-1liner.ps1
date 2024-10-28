#use the -output flag to set a custom output csv file
 param (
    [string]$output="C:\tasks.csv"
 )
Get-Wmiobject win32_process | select name,executablepath,processid,parentprocessid,commandline | export-csv $output -NoTypeInformation
