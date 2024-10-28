# use -Output for the output directory and -ZipDestination for a custom .zip compressed file destination such as a flashdrive
 param (
    [string]$Output="C:\Logs\",
    [string]$ZipDestination="C:\"
 )
 $timestamp=Get-Date -format "yyyy-MM-dd_Hms"
 $ZipDestination=$ZipDestination+"logs-$timestamp.zip"

 try{
 mkdir $Output
 } catch{
 write-output "Directory already exists or has other issues writing to C:\Logs"
 $Output="C:\Logs\"
 $ZipDestination="C:logs-$timestamp.zip"
 }

 $taskfile=$Output+"tasks.csv"
 $servicefile=$Output+"services.csv"
 $processfile=$Output+"processes.csv"
 
schtasks /query /V /FO csv | convertfrom-csv | where taskname -ne "TaskName" | select hostname,taskname,'next run time',status,'logon mode','last run time', author,'task to run','start in',comment,'scheduled task state','run as user' | export-csv $taskfile -NoTypeInformation

get-wmiobject win32_service | select name,state,displayname,processid,startmode,pathname,startname | export-csv $servicefile -NoTypeInformation

Get-Wmiobject win32_process | select name,executablepath,processid,parentprocessid,commandline | export-csv $processfile -NoTypeInformation

compress-archive -path $Output -destinationpath $ZipDestination
