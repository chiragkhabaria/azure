$resourceGroupName = "StockAnalysis"
$sqlServerName = "StockDBServer"

try {
    $ErrorActionPreference = "Stop"; #Make all errors terminating
    Remove-AzSqlServer  -ResourceGroupName $resourceGroupName  -ServerName $sqlServerName
    write-display-message "Successfully Removed SQL SERVER $sqlServerName"
}
catch {
    $errorMessage = $Error[0].Exception.Message
    write-error-message "Error occurred while remvoing SQL SERVER $sqlServerName ::: $errorMessage" 
    $ErrorActionPreference = "Continue"; #Make all errors terminating
}
