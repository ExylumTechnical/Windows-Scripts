# set a logfile path
$logFilePath = "C:\Windows\Logs\firewall.log" # Default location for the firewall logs
# make sure the log directory exists
try{
  mkdir C:\Windows\Logs\ -erroraction 'silentlycontinue'
} catch {
  write-host "File already exists"
}

# tell all profiles to log files, increase the maximum log file size, and only log blocked connections
# append "-LogAllowed True" to the end of this line in order to enable logging accepted connections
Set-NetFirewallProfile -Profile Domain,Public,Private -LogFileName $logFilePath -LogMaxSizeKilobytes 20480 -LogAllowed True -LogBlocked True

# enable the firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Fairly Permissive 
Set-NetFirewallProfile -DefaultInboundAction Block -DefaultOutboundAction Allow -AllowUnicastResponseToMulticast True

# Restricting outbound connections without an explicit allow rule and no multicast replys
Set-NetFirewallProfile -DefaultInboundAction Block -DefaultOutboundAction Deny

# dump the current configuration of all the profiles for verification.
Get-NetFirewallProfile -Profile Domain,Public,Private
