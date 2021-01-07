

[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Find Managed Objects'
$msg = 'Enter the Lname to find objects'

$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)

Get-ADcomputer -filter * -Properties  CN, ManagedBy, Description,  CanonicalName | 
Where-Object {($_.ManagedBy -like "*$text*")} | 
Select-Object CN, ManagedBy, Description,  CanonicalName | Format-Table