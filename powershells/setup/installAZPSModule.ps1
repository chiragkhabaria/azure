$azModuleName = "Az"
$azADModuleName = "AzureAD"
#import module 
Write-host "Importing AZ module if it doesnt exists"
Import-module ..\modules\wincomm.psm1
if (-Not (IsModuleAvailable -module_name $azModuleName)){
    Install-Module -Name $azModuleName -AllowClobber -Scope CurrentUser -Force
    write-display-message "Successfully Installed the Module $azModuleName"
    Import-Module $azModuleName
    write-display-message "Successfully Imported Module $azmoduleName "
}

write-display-message "Trying to Install Azure AD"

 if (-Not (IsModuleAvailable -module_name $azADModuleName)){
    Install-Module -Name $azADModuleName -AllowClobber -Scope CurrentUser -Force
    write-display-message "Successfully Installed the Module $azADModuleName"
    Import-Module $azADModuleName
    write-display-message "Successfully Imported Module $azADModuleName "
 }