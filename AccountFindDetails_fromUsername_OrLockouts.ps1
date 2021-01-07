

#This seeks to identify user information that can be useful when investigating account lockouts or just general information
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Account Lockout Investigation'
$msg = 'Enter the AD username of the account you wish to investigate'

$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
Get-ADuser $text -Properties * | 
Select-object Name, Department,  PasswordLastSet, LastBadPasswordAttempt, mail,  managedObjects, msRTCSIP-Line, Enabled, Company, LastLogonDate, AccountExpirationDate, Emp-IDType, EMP-Other-Notes, manager, whenCreated 