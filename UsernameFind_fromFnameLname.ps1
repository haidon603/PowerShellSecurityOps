$users = Read-Host 'Enter Last name, First name'
$test = Foreach ($user in $users){

$user = "*" + $user + "*"
Get-ADUser -Filter {Name -like $user } | Select-Object name, SamAccountName, Enabled}

$test