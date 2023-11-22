#Declares initial $userContinue variable for the while loop to function at the beginning of the script
$userContinue = "yes"

#Establishes the file path for the outputting to CSV
$outputCsv = "$HOME\Downloads\DriveFileSizeCheck.csv"

#While Loop allows for user to continuously run the script as long as they want
while ($userContinue -ieq 'yes' -OR $userContinue -ieq 'y') {
    #$inputValidation creates a block that is used to force the script to run continuously until the user inputs a valid drive name utilizing the call (.) dot source operator
    $inputValidation= {
        #Try Catch block catches if user inputs a drive that doesn't exist or not and forces the script to run through again
        try {
            $driveName = Read-Host "Please enter the desired drive name (i.e. C)"

            #-ErrorAction Stop creates a terminating exception so the catch actually catches the error
            $driveSelection = Get-PSDrive $driveName -ErrorAction Stop
            }
        catch {
            Write-Host "Your input has be to be a valid storage drive."
            . $inputValidation
        }
    }
    $userInput = . $inputValidation

    #Pulls the driveSelection's used and free storage space for further calculation
    $usedStorageSpace = $driveSelection.used
    $freeStorageSpace = $driveSelection.free

    #Rounding is used to shorten the results due to the numerous decimal numbers the initial calculations contain
    $freeStorageSpaceGB = [math]::round(($freeStorageSpace / 1GB), 2)
    $freeStorageSpacePercent = [math]::round($freeStorageSpace / ($freeStorageSpace + $usedStorageSpace) * 100, 2)

    #Creates the full root file path to be added in $fileSizeCheck
    $filePath = $driveName + ":\"

    #A variable is used to create a hash table from the Get-Child results so that the file length can be adjusted to a more appropriate format.
    $fileSizeCheck = Get-ChildItem -Path $filePath -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.length -gt 200MB} | Select-Object FullName, length | Sort-Object length

    #$fileCount counts the number of hash values and is used for the if statement to determine if to list the files and sizes to the terminal or export to a csv 
    $fileCount = $fileSizeCheck.Count
    
    if ($fileCount -gt 10) {
        Write-Host "On Drive $driveName there is currently $freeStorageSpacePercent% or $freeStorageSpaceGB GB of storage left."
        $fileSizeCheck | Export-Csv -Path $outputCsv
        Write-Host "Your file has been saved to $outputCsv"
    }
    elseif ($fileCount -eq 0) {
        Write-Host "There were no files greater than 200 MB."
        Write-Host "On Drive $driveName there is currently $freeStorageSpacePercent% or $freeStorageSpaceGB GB of storage left."
    }
    else {
        #Goes through the hash table and converts the length value from bytes to MB and outputs the results of $fileSizeCheck
        foreach ($file in $fileSizeCheck) {
            $fileSize = [math]::round(($file.Length/1MB),2)
            Write-Host "File Name: "$file.FullName
            Write-Host "File Size: $fileSize MB"
        }
        Write-Host "`n On Drive $driveName there is currently $freeStorageSpacePercent% or $freeStorageSpaceGB GB of storage left."
    }

    #Has the user input whether or not to continue their script which determines if it breaks the while loop or not
    $userContinue = Read-Host "Please input 'y' or 'yes' if you would like to run the script again"

}
Write-Host "Script Concluded"