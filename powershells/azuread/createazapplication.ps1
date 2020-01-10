$applicationName = 'SlalomAnalyticsApp'
$homePage = 'https://slalom.com'
$identifierUris = 'http://localhost' 

#$SecureStringPassword = ConvertTo-SecureString -String "password" -AsPlainText -Force
if (-not (Get-AzADApplication -DisplayName $applicationName)){
 New-AzADApplication -DisplayName $applicationName -HomePage $homePage -IdentifierUris $identifierUris #$identifierUris -Password 
}
else {
    write-error-message "$applicationName already exists"
}

