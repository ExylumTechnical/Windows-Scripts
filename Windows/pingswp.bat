echo > ping_report.txt
SET NE=%1
FOR /L %%x IN (1,1,255) DO ping -n 1 %NE%%%x | find "Reply" | find /v "Destination host unreachable" >> ping_report.txt & arp -a | find "%NE%%%x" >> ping_report.txt
type ping_report.txt
pause

