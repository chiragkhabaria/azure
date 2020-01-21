$Repo_Root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent;
Import-Module -name $Repo_Root\powershells\modules\azcomm
Import-Module -Name $Repo_Root\powershells\modules\wincomm