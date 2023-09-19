#Select-Object -First is used to grab the first instance of a 192 ip address since some host computers such as mine have multiple due to VMs.
$IP = (Get-NetIPAddress).IPv4Address | Select-String "192*" | Select-Object -First 1
$currentUser = $env:USERNAME
$myComputer = hostname
$todayDate = Get-Date -UFormat "%A, %B %d, %Y"
$powershellVersion = $HOST.Version.Major
$BODY = "This machine's IP is $IP. User is $currentUser. Hostname is $myComputer. PowerShell Version $powershellVersion. Today's Date is $todayDate."
Send-MailMessage -To "oreskovichjoshuah@gmail.com" -From "joshuahoreskovich@gmail.com" -Subject "IT3038C Windows SysInfo" -Body $BODY -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential) 
