$appDispName = "SlalomAnalyticsApp"
$app = Get-AzADApplication -DisplayName $appDispName
if ($null -ne $app){
Get-AzADAppCredential -ObjectId $app.ObjectId | ForEach-Object {Remove-AzADAppCredential -KeyId  $_.KeyId -ObjectId $app.ObjectId -Force}
write-display-message "Removed Application successfully"
}
else {
    write-error-message "$app not Found"
}