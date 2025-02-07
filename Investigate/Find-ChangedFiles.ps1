# set the paramiters
param (
    [string]$baseDirectory = "D:\",
    [int]$hoursAgo = 0
)

# Set the directory to the user-defined one
$targetDir = $baseDirectory

# Get the current date and time
$now = Get-Date

if ($hoursAgo -gt 0) {
    $timeThreshold = $now.AddHours(-$hoursAgo)
    Write-Host "Files modified in the last $hoursAgo hours in $targetDir"
    Write-Host "------------------------------------------"

    # Find and list files modified within the specified hours
    Get-ChildItem -Path $targetDir -Recurse | Where-Object { $_.LastWriteTime -ge $timeThreshold } | ForEach-Object {
        Write-Output $_.FullName
    }
} else {
    $today = $now.Date
    Write-Host "Files modified on $today in $targetDir"
    Write-Host "------------------------------------------"

    # Find and list files modified today
    Get-ChildItem -Path $targetDir -Recurse | Where-Object { $_.LastWriteTime.Date -eq $today } | ForEach-Object {
        Write-Output $_.FullName
    }
} 
