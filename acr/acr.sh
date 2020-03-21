#!/bin/bash
#commonly used variables 
rg = "learn-deploy-acr-rg"
acr_name = "acr_demo_101001"

#login to the az
az login 

#create the resource group 
az group create --name rg --location "eastus"

#create the acr
az acr create --resource-group rg --name acr_name --sku basic

#create the docker file -- check Docker file in the folder
#Build the Image in ACR
az acr build --registry acr_name --image helloacrtasks:v1 .

# Verify the build 
az acr repository list --name acr_name --output table

#Enable the rgistry Admin account , this is only for the testing purpose, else need to use the Azure Active Directory indentities
az acr update -n acr_name --admin-enabled true

#Get the Creds of the registered Admin account
az acr credential show --name acr_name

#store the password and use the password for deploying the container. 
az container create --resource-group rg --name acr-tasks --image "$acr_name.azurecr.io/helloacrtasks:v1" --registry-login-server "$acr_name.azurecr.io" --ip-address Public --location eastus --registry-username acrdemo123123 --registry-password Uod7wxnGjJKlr3z8ABfUghG6=Z9p1F74

# Get the ip address of the container for running the service
az container show --resource-group  rg --name acr-tasks --query ipAddress.ip --output table

#incase if you need to replicate its to another region. Its only supported in the premium SKU and not in the standard
# lets change the sku to premium 
az acr update -n acr_name --sku Premium
# now replicate the location japan 
az acr replication create --registry acr_name --location japaneast
#now validate the replication 
az acr replication list --registry acr_name --output table

#clean up .. delete the resource group 
az group delete --name rg
