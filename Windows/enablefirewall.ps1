# created by Nicholas Howland on 7/6/2024
# set a logfile path
$logFilePath = "C:\Windows\FirewallLogs\pfirewall.log"
# make sure the log directory exists
try{
  mkdir C:\Windows\FirewallLogs\ -erroraction 'silentlycontinue'
} catch {
  write-host "File already exists"
}


# tell all profiles to log files, increase the maximum log file size, and only log blocked connections
# append "-LogAllowed True" to the end of this line in order to enable logging accepted connections
Set-NetFirewallProfile -Profile Domain,Public,Private -LogFileName $logFilePath -LogMaxSizeKilobytes 32767  -LogBlocked True
# enable the firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
# dump the current configuration of all the profiles for verification.
Get-NetFirewallProfile -Profile Domain,Public,Private
