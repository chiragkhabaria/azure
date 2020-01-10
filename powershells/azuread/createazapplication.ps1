$applicationName = 'SlalomAnalyticsApp'
$homePage = 'https://slalom.com'
$identifierUris = 'http://localhost' 
$startdate = Get-Date
$enddate = $startdate.AddYears(1)

#$SecureStringPassword = ConvertTo-SecureString -String "password" -AsPlainText -Force
if (-not (Get-AzADApplication -DisplayName $applicationName)){
 $app = New-AzADApplication -DisplayName $applicationName -HomePage $homePage -IdentifierUris $identifierUris #$identifierUris -Password 
 New-AzADServicePrincipal -ApplicationObject $app -StartDate $startdate -EndDate $enddate
}
else {
    write-error-message "$applicationName already exists"
}


