<# 
The module will have all the common functions in here. 
#>
function IsModuleAvailable {
    param(
        $module_name
    )
    Write-Host "Checking the module $module_name"
    [bool] $module_exists = $false
    if (Get-Module -ListAvailable -Name $module_name) {
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
