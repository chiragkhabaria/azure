$storageAccountName = "dp200Storage10"
$resourceGroupName = "az200"

#Now Removing the storage. 
Remove-AzStorageAccount -name $storageAccountName -ResourceGroupName $resourceGroupName