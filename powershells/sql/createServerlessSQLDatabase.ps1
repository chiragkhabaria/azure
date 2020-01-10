$resourceGroupName = "StockAnalysis"
$sqlServerName = "StockDBServer"
$sqlDatabaseName = "StockDB"

try {
    $ErrorActionPreference = "Stop"
    New-AzSqlDatabase -ResourceGroupName $resourceGroupName `
                  -ServerName $sqlServerName `
                  -DatabaseName $sqlDatabaseName `
                  -Edition "GeneralPurpose" `
                  -Vcore 1 `
                  -ComputeGeneration "Gen5" `
                  -ComputeModel Serverless
    write-display-message "Created Database $sqlDatabaseName Successfully"
}
catch {
    $errorMessage = $Error[0].Exception.Message
    write-error-message "Error occurred while creating database  $sqlDatabaseName ::: $errorMessage" 
    $ErrorActionPreference = "Continue"; 
}

