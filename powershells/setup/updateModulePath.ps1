$customModulePath = (split-path -path (split-path -parent $MyInvocation.MyCommand.Path) -Parent) + "\modules"
write-host "Custom Path :: $customModulePath"
$env:PSModulePath = $env:PSModulePath + "$([System.IO.Path]::PathSeparator)$customModulePath"
write-host $env:PSModulePath