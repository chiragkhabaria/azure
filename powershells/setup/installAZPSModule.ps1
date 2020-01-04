$azModuleName = "Az"
#import module 
Write-host "Importing AZ module if it doesnt exists"
Import-module ..\modules\*.psm1
if (-Not (IsModuleAvailable -module_name $azModuleName)){
    Install-Module -Name $azModuleName -AllowClobber -Scope CurrentUser -Force
    write-display-message "Successfully Installed the Module $azModuleName"
    Import-Module $azModuleName
    write-display-message "Successfully Imported Module $azmoduleName "
}
