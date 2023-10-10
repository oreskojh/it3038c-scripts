Import-Module ImportExcel

#Variable for the path of the file.
$outputExcelService = "$HOME\Downloads\oreskojhL7DemService.xlsx"

#Used to delete the previous version of this file if the script has been run multiple times.
Remove-Item $outputExcelService -ErrorAction Ignore


#Creates the actual Excel file and opens it up after creation with auto sized columns and filter arrows already created.
$excelService = Get-Service | Select-Object Name,DisplayName,Status,ServiceType,StartType | Export-Excel $outputExcelService -Show -AutoSize -AutoFilter

#Opens the Excel file so that it can be revised further.
$openedFileService = Open-ExcelPackage -Path $outputExcelService

#Creates a duplicate sheet from the original sheet with all the same data.
Add-Worksheet -ExcelPackage $openedFileService -WorksheetName "Services" -CopySource $openedFileService.Workbook.Worksheets["Sheet1"]

$excelServiceWS = $openedFileService.Workbook.Worksheets["Services"]

#Adds conditional formatting to the Status column for services based on if they are running or stopped.
Add-ConditionalFormatting -Worksheet $excelServiceWS -Address "C2:C100000" -RuleType ContainsText -ConditionValue "Running" -BackgroundColor "LightGreen"
Add-ConditionalFormatting -Worksheet $excelServiceWS -Address "C2:C100000" -RuleType ContainsText -ConditionValue "Stopped" -BackgroundColor "Red"

#Commits the changes to the Excel file
$openedFileService.Save() 

#This Read-Host is used to keep the PowerShell window from closing immediately after running the script.
Read-Host "Please hit Enter to exit"