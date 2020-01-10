$appName = "SlalomAnalyticsApp"
$startDate = Get-Date
$endDate = $startDate.AddYears(1)
$password = Read-Host  "Enter the Password for App ::" -AsSecureString 


$app = Get-AzADApplication -DisplayName $appName
if ($null -ne $app) {
New-AzADAppCredential -ObjectId $app.ObjectId -StartDate $startDate -EndDate $endDate -Password $password
write-display-message "Credentials created successfully"
}
else {
    write-error-message "$appName not found in Azure AD"
}