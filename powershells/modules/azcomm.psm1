function loginAzureAD{
    if([Microsoft.Open.Azure.AD.CommonLibrary.AzureSession]::AccessTokens.Count -gt 0){
        Write-Warning "We already have a session for AzureAD"
    }else{
        Connect-AzureAD
    }
}
function loginAzureAccount{
    if(-Not(Get-AzContext))
    {
        Connect-AzAccount
    }
}
