#use the -output flag to set a custom output csv file
 param (
    [string]$output="C:\tasks.csv"
 )

get-wmiobject win32_service | select name,state,displayname,processid,startmode,pathname,startname | export-csv $output -NoTypeInformation
