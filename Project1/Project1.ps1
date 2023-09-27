#Read-Host's purpose is to account for different drive names that can occur which can vary depending on device setup.
$driveName = Read-Host "Please enter your drive name (i.e. C): "
$driveSelection = Get-PSDrive $driveName 
$usedStorageSpace = $driveSelection.used
$freeStorageSpace = $driveSelection.free

#Rounding is used to shorten the results due to the numerous decimal numbers the initial calculations contain
$freeStorageSpaceGB = [math]::round(($freeStorageSpace / 1GB), 2)
$freeStorageSpacePercent = [math]::round($freeStorageSpace / ($freeStorageSpace + $usedStorageSpace) * 100, 2)

Write-Host "On Drive $driveName there is currently $freeStorageSpacePercent% or $freeStorageSpaceGB GB of storage left."

#This Read-Host is used to keep the PowerShell window from closing immediately after running the script.
Read-Host "Please hit Enter to exit"
