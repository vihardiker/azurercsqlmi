#############################################################
# 1. Register necessary resource providers and add extensions
# 2. Check and Create RG (if necessary)
# 3. Check and Connect to cluster
# 4. Enable Cluster for Azure ARC
# 5. Create Custom Location
# 6. Create Data Controller
#############################################################

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

Write-Output "RESOURCEGROUPNAME: " $RESOURCEGROUPNAME
Write-Output "SQLMINAME: " $SQLMINAME
Write-Output "SQLACCOUNTNAME: " $SQLACCOUNTNAME
Write-Output "PRIMARYDNSNAME: " $PRIMARYDNSNAME
Write-Output "ADCONNECTORNAME: " $ADCONNECTORNAME
Write-Output "PORTNUMBER: " $PORTNUMBER
Write-Output "ISTHISADEVINSTANCE: " $ISTHISADEVINSTANCE
Write-Output "CLNAME: " $CLNAME
Write-Output "NAMESPACE: " $NAMESPACE
Write-Output "SQLMITIER: " $SQLMITIER
