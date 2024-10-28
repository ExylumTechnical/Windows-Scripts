
$RestorePointName = "Weekly Restore Point"
Checkpoint-Computer -Description $RestorePointName
Write-Host "Weekly restore point created."