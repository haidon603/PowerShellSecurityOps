[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Computer Investigation'
$msg = 'Enter the Computer name you wish to investigate'

$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
Get-ADcomputer $text -Properties ManagedBy 