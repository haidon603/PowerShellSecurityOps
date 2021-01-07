


#This seeks to identify user information that can be useful when investigating account lockouts
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Server Investigation'
$msg = 'Enter the Servername you wish to investigate'

$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
get-adcomputer $text -Properties * | select Name, Description, OperatingSystem, IPv4Address, whenCreated 

