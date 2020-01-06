$location = "eastus"
$resourceGroup = "az200"
# Set the name of the storage account and the SKU name.
$storageAccountName = "dp200storage10"
$skuName = "Standard_LRS"
#accepted values for skuName :: Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS
$kind = "Storage"
#accepted values for Kind :: Storage, StorageV2, BlobStorage, BlockBlobStorage, FileStorage
$AccessTier = "Hot"
#The value of access tier is only applicable when Kind is blobstorage
#accepted values for AccessTier :: Hot, Cool

#check if the storage name is available.. 
$nameAvailable = Get-AzStorageAccountNameAvailability -Name $storageAccountName
if ($nameAvailable.NameAvailable -eq $false){
    write-error-message $nameAvailable.Message
    return
}

# Create the storage account.
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroup `
  -Name $storageAccountName `
  -Location $location `
  -SkuName $skuName `
  -Kind $kind `
 # -AccessTier $AccessTier

 #*** the value of Access Tier is only applicable for the BlobStorage ... *** 
# Retrieve the context.
$ctx = $storageAccount.Context