#Read-Host's purpose is to account for different drive names that can occur which can vary depending on device setup.
$driveName = Read-Host "Please enter your drive name (i.e. C) "

#Creates the full root file path to be added in $fileSizeCheck
$filePath = $driveName + ":\"

#A variable is used to create a hash table from the Get-Child results so that the file length can be adjusted to a more appropriate format.
$fileSizeCheck = Get-ChildItem -Path $filePath -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.length -gt 200MB} | Select-Object FullName, length | Sort-Object length

#Goes through the hash table and converts the length value from bytes to MB and outputs the results of the Get-ChildItem.
foreach ($file in $fileSizeCheck)
{
    $fileSize = [math]::round(($file.Length/1MB),2)
    Write-Host "File Name: "$file.FullName
    Write-Host "File Size: $fileSize MB"
}

Write-Host "`nThe script has concluded."

#This Read-Host is used to keep the PowerShell window from closing immediately after running the script.
Read-Host "Please hit Enter to exit"
