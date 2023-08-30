# Create a new Domain in powershell
install-windowsFeature -Name AD-Domain-Services -IncludeManagementTools

Install-ADDSForest -DomainName "example.com" -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "7" -DomainNetbiosName "example" -ForestMode "7" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$True -SysvolPath "C:\Windows\SYSVOL" -Force:$True

# Create a random admin user
$FirstName = "Bob"
$LastName = "Admin"
$DisplayName = "Bob Admin"
$Username = "badmin"
$Password = "L0!Password"
$Identity = "CN=badmin,CN=Users,DC=example,DC=com"
$SecureString = ConvertTo-SecureString $Password -AsPlainText -Force

New-AdUser -Name $Username -GivenName $FirstName -Surname $LastName -DisplayName $DisplayName -AccountPassword $SecureString
Set-ADUser -Identity $Identity -Enabled $True

# set example titles
$title = @(
'SalesPerson',
'Engineer',
'Marketer',
'Technician'
)

# Create a new OU just for these Test users
New-ADOrganizationalUnit -Name TestOU -Path 'dc=example,dc=com' -ProtectedFromAccidentalDeletion $false

# Generate a bunch of random users with just first and last names as well as a username
1..100 | foreach-object {
$r = Get-Random -Minimum 0  -Maximum 3
New-ADUser -Name "TestUser$_" -OtherAttributes @{title=$title[$r];Description=$title[$r]} -Path "dc=example,dc=com"
}

get-aduser -searchbase 'ou=TestOU,dc=example,dc=com' -Filter * | Foreach-object {
     Set-aduser -identity $_ -EmailAddress("{0}@{1}" -f $_.name, "exylum.tech") -GivenName Test -Surname $_.name
     }

Get-ADUser -filter * -Properties mail | select-object GivenName,Surname,UserPrincipalName,mail | ConvertTo-Csv -delimiter "|" > userreport.csv
