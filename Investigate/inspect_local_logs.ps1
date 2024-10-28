# By: Nicholas Howland / Exylum Technical
# Date: 2023-05-05
# Purplse: To create an easy to use script that will output 
#  logs in a specific timeframe

$TimeVar=$args[0]
$Duration=$args[1]
if($Duration -ne '[0-9]','[0-9][0-9]'){
        $Duration=10
}
if ( $TimeVar -match '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9]'){
    $Begin=(get-date -date $TimeVar) + (new-timespan -minute (-1*$Duration))
        $End=(get-date -date $TimeVar) + (new-timespan -minute $Duration)
        echo "Retrieving logs from $Begin to $End"
        Get-EventLog -LogName "System" -After $Begin -Before $end | format-table -wrap
        Get-EventLog -LogName "Application" -After $Begin -Before $end | format-table -wrap
        Get-EventLog -LogName "Windows Powershell" -After $Begin -Before $end | format-table -wrap
        Get-EventLog -LogName "Security" -After $Begin -Before $end | format-table -wrap

}else{
        echo ""
        echo "    Log Inspection Utility"
        echo "    Useage: inspect_local_logs.ps1 <date> <buffer(optional)>"
        echo ""
        echo "    Supply an exact time you wish to view the logs for useing the format YYYY-MM-DD HH:MM:SS."
        echo "    By default the time range will be 10 minutes before and after the specified date. If no "
        echo "    date is supplied or improperly formatted then the script will not execute and is possibly "
        echo "    why you are seeing this message. If you wish to change the buffer from 10 to another "
        echo "    number then it can be supplied after the date"
        echo ""
        echo "    Examples:"
        echo ""
        echo "        inspect_local_logs.ps1 2023-05-05 02:42:24 "
        echo "    Produces the logs 10 min (20 total minutes of logs) before and after 2023-05-05 02:42:24"
        echo ""
        echo "        inspect_local_logs.ps1 2023-05-05 02:42:24 20 "
        echo "    Produces a total of 40 minutes of logs 20 minutes before and after the date supplied."
        echo ""
}
