#find and replace "path\to-output" with your desired path for file output
 param (
    [string]$output="C:\Users\$ENV:USERNAME\Downloads\services.csv"
 )

get-wmiobject win32_service | select name,state,displayname,processid,startmode,pathname,startname | export-csv $output -NoTypeInformation
