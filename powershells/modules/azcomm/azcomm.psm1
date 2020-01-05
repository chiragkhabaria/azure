function loginAzureAD{
    if([Microsoft.Open.Azure.AD.CommonLibrary.AzureSession]::AccessTokens.Count -gt 0){
        Write-Warning "We already have a session for AzureAD"
    }else{
        Connect-AzureAD
    }
}
function logoffAzureAD{
    Disconnect-AzureAD
}
function loginAzureAccount{
    if(-Not(Get-AzContext))
    {
        Connect-AzAccount
    }
}
function logoffAzureAccount{
    Disconnect-AzAccount
}

function listAzLocations{
    loginAzureAccount 
    Get-AzLocation | select location
}

function listAzResourceGroups{
    loginAzureAccount
    Get-AzResourceGroup | select ResourceGroupName
}

function listAzSubscriptions{
    loginAzureAccount
    Get-AzSubscription
}

function set-AzSubscription{
    param(
        [String]$subscription_name 
    )
    loginAzureAccount
    Get-AzSubscription -SubscriptionName $subscription_name | Set-AzContext
}

