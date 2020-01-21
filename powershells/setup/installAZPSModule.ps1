$azModuleName = "Az"
$azADModuleName = "AzureAD"
$Repo_Root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent;

#import module 
Write-host "Importing AZ module if it doesnt exists"
write-host "Repo path is ::$Repo_Root"
& "$Repo_Root\powershells\setup\installCustomModule.ps1"

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