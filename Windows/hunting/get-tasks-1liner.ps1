#find and replace "path\to-output" with your desired path for file output
 param (
    [string]$output="C:\Users\$ENV:USERNAME\Downloads\tasks.csv"
 )
schtasks /query /V /FO csv | convertfrom-csv | where taskname -ne "TaskName" | select hostname,taskname,'next run time',status,'logon mode','last run time', author,'task to run','start in',comment,'scheduled task state','run as user' | export-csv $output -NoTypeInformation
