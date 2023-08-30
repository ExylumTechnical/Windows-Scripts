ipconfig > info.txt
arp -a >> info.txt
wmic netuse get LocalName,RemoteName >> info.txt
wmic ComputerSystem get Domain,Username,Manufacturer,Model >> info.txt
wmic bios get serialnumber >> info.txt
