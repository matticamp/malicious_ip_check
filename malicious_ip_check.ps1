#Created by Mattia Campagnano on Sat Apr 28, 2018 at 12:00 PM EST

#LOAD WEBPAGE CONTAINING A DATABASE OF KNOWN MALICIOUS IP ADDRESSES
$WebResponse = Invoke-WebRequest "https://lists.blocklist.de/lists/all.txt"

#PROMPT THE USER FOR A PATH TO AN OUTPUT FILE
$output=Read-Host -Prompt "Enter your output file path "

#GRAB THE CONTENTS OF THE WEBPAGE AND OUTPUT THEM TO THE DESTINATION FILE DEFINED BY THE USER

$WebResponse.Content |Out-File $output

#CONVERT THE CONTENTS OF THE OUTPUT FILE INTO AN ARRAY OF IP ADDRESSES

$array=Get-Content $output

#PROMPT USER FOR AN IP ADDRESS TO BE CHECKED AGAINST THE DATABASE

$ip=Read-Host -Prompt "Enter an IP address "

#IF THE ENTERED IP IS LISTED IN THE DATABASE, RETURN 'MALICIOUS', OTHERWISE 'NO HIT FOUND'

if ($array -contains $ip){
'Malicious!'
} Else {
'No hit found'
}

