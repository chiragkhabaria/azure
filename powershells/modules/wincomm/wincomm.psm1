<# 
The module will have all the common functions in here. 
#>
function IsModuleAvailable {
    param(
        $module_name
    )
    Write-Host "Checking the module $module_name"
    [bool] $module_exists = $false
    if ((Get-Module -ListAvailable -Name $module_name) -or 
    (Get-Module -Name $module_name)) {
        Write-Host "Module exists"
        $module_exists = $true
    } 
    else {
        Write-Host "Module does not exist"
    }
    return $module_exists
}
function write-display-message{
    param(
        [String] $message
    )
    write-host $message -ForegroundColor green
}

function write-error-message{
    param(
        [String] $message
    )
    Write-Host $message -ForegroundColor Red
}

function ReloadPSModule{
    param(
        [String] $module_name
    )
    if(IsModuleAvailable -module_name $module_name){
        write-display-message "Removing module $module_name"
        Remove-Module $module_name
    }
    #$ScriptPath = split-path -parent $MyInvocation.MyCommand.Path
    #write-display-message "Import Module $ScriptPath\$module_name.psm1"
    Import-Module $module_name
}
