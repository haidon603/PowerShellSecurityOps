#handy ps script for retrieving indicator info, risk factors, etc.
#get your FREE api key here https://pulsedive.com/api/
#replace "YOURAPIKEYHERE" with newly generated API
$text = Read-Host -Prompt "Enter indicator you'd like to examine"
$dest = http://pulsedive.com/api/info.php?indicator=$text&pretty=1&key=YOURAPIKEYHERE
$proxy = ([System.Net.WebRequest]::GetSystemWebproxy()).GetProxy($dest)
$I = Invoke-RestMethod -Uri http://pulsedive.com/api/info.php?indicator=$text -Proxy $proxy -ProxyUseDefaultCredentials
write-host "-----Per Pulsedive Threat Intel API-----"
$I
write-host "-----IoC Weighted Threat Risk Factors-----"
$I.riskfactors
$I.risk_recommended
$I.risk
$I.manualrisk
$I.redirects
 
 
