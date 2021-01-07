########### Nice output options can be added with a pipe and option below ###########

#Make nice table from results
| format-table
#Have a grid window open up
| out-gridview
#File as csv or txt
| out-file'C:\Users\haidon\Desktop\PersonFoundinGroups.txt'
#Auto add a grid output to your clipboard
|Out-GridView-PassThru| Clip


########### To run scripts without a GUI: elimiate the Void line, $title line, $msg line and replace $text with the username, computer, ip, etc.###########
#This seeks to identify user information that can be useful when investigating account lockouts or just general information
#example of script with GUI

[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$title = 'Account Lockout Investigation'
$msg = 'Enter the AD username of the account you wish to investigate'

$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
Get-ADuser $text -Properties * | 
Select-object Name, Department,  PasswordLastSet, LastBadPasswordAttempt, mail,  managedObjects, msRTCSIP-Line, Enabled, Company, LastLogonDate, AccountExpirationDate, Emp-IDType, EMP-Other-Notes, manager, whenCreated 



#example of new script, paste into new ISE tab and compare with the original
#This seeks to identify user information that can be useful when investigating account lockouts or just general information
Get-ADuser haidon -Properties * | 
Select-object Name, Department,  PasswordLastSet, LastBadPasswordAttempt, mail,  managedObjects, msRTCSIP-Line, Enabled, Company, LastLogonDate, AccountExpirationDate, Emp-IDType, EMP-Other-Notes, manager, whenCreated 



########### to use scripts with a list of usernames, ips, computernames etc. ###########


#start with a get-content
Get-Content 'C:\Users\haidon\Documents\FWdisableusernames.txt'| 
#specify user, computer etc. "get-___"
Get-ADUser -properties * |  
#select fields you would like retreived
Select-Object -Property Name,sAMAccountName,Department, Company, Emp-IDType, EMP-Other-Notes, EmailAddress 