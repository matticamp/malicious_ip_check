$WebResponse = Invoke-WebRequest "https://lists.blocklist.de/lists/all.txt"
$output=Read-Host -Prompt "Enter your output file path: "
$WebResponse.Content |Out-File $output

$array=Get-Content $output

$ip=Read-Host -Prompt "Enter an IP address: "

if ($array -contains $ip){
'Malicious'
} Else {
'No hit found'
}

