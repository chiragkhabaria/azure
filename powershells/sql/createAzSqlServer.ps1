$resourceGroupName = "StockAnalysis"
$sqlServerName = "StockDBServer"

try {
    New-AzSqlServer -ResourceGroupName $resourceGroupName -Location "EastUS" -ServerName $sqlServerName -ServerVersion "12.0" -SqlAdministratorCredentials (Get-Credential)
    write-display-message "Successfully created SQL SERVER"
}
catch {
    write-error-message "Error occurred while creating SQL SERVER ::: "$_.Exception.Message 
}
