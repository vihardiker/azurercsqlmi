###############
# Create SQL MI
###############

# Parameters
$RESOURCEGROUPNAME = $Env:RESOURCEGROUPNAME
$SQLMINAME = $Env:SQLMINAME
$SQLACCOUNTNAME = $Env:SQLACCOUNTNAME
$PRIMARYDNSNAME = $Env:PRIMARYDNSNAME
$ADCONNECTORNAME = $Env:ADCONNECTORNAME
$PORTNUMBER = $Env:PORTNUMBER
$ISTHISADEVINSTANCE = $Env:ISTHISADEVINSTANCE                #true or false, true means dev instance
$CLNAME = $Env:CLNAME
$NAMESPACE = $Env:NAMESPACE
$SQLMITIER = $Env:SQLMITIER


########################################################################
# Login to Azure using Service Principal credentials from Github Secrets
########################################################################
Write-Output "Logging in to Azure with a service principal..."
az login --service-principal --username $Env:ARC_SP_CLIENT_ID --password $Env:ARC_SP_CLIENT_SECRET --tenant $Env:ARC_SP_TENANT_ID
Write-Output "Done logging into Azure"

###########################
# Select Azure subscription
###########################
Write-Output "Setting Azure Subscription"
az account set --subscription $Env:ARC_AZURE_SUBSCRIPTION_ID
Write-Output "Done Setting Azure Subscription"


#################################
# Create SQL Managed Instance(MI)
#################################
Write-Output "Create SQL MI"
az config set extension.use_dynamic_install=yes_without_prompt
# Is this a dev instance of SQL MI
az config set extension.use_dynamic_install=yes_without_prompt 
if ($ISTHISADEVINSTANCE -eq 'true') {
    az sql mi-arc create --name $SQLMINAME --ad-connector-name $ADCONNECTORNAME --ad-account-name $SQLACCOUNTNAME --primary-port-number $PORTNUMBER --custom-location $CLNAME --resource-group $RESOURCEGROUPNAME --dev #--primary-dns-name $PRIMARYDNSNAME
}
else {
    az sql mi-arc create --name $SQLMINAME --ad-connector-name $ADCONNECTORNAME --ad-account-name $SQLACCOUNTNAME --primary-port-number $PORTNUMBER --custom-location $CLNAME --resource-group $RESOURCEGROUPNAME --tier $SQLMITIER #--primary-dns-name $PRIMARYDNSNAME
}
Write-Output "Done Creating SQL MI"

#######################################
# Update SQL Managed Instance(MI) Agent
#######################################
Write-Output "Update SQL MI Agent"
az config set extension.use_dynamic_install=yes_without_prompt 
az sql mi-arc update -n $SQLMINAME --k8s-namespace $NAMESPACE --use-k8s --agent-enabled true
Write-Output "Done Updating SQL MI Agent"

###################################
# Get details of the created SQL MI
###################################
Write-Output "Details of the newly created SQL MI"
az config set extension.use_dynamic_install=yes_without_prompt 
az sql mi show --name $SQLMINAME --resource-group $RESOURCEGROUPNAME
Write-Output "Done displaying the details of the newly created SQL MI"

