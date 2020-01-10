$appName = "SlalomAnalyticsApp"
$startDate = Get-Date
$endDate = $startDate.AddYears(1)
$password = "Slalom"

$app = Get-AzADApplication -DisplayName $appName
if ($null -ne $app) {
$clientSecret = New-AzADAppCredential -ObjectId $userADApp.ObjectId -StartDate $startDate -EndDate $endDate -Password $password
$clientSecret 
}
else {
    write-error-message "$appName not found in Azure AD"
}