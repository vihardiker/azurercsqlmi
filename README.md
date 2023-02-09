# AZURESQLMI Repository


# <u>Codebase in this repository will deploy an Azure Arc Enable SQL MI </u>


## <u>Parameters or Arguments</u>

|Parameter Name|Description|Typical Values|
|:--|:--|:--|
|`RESOURCEGROUPNAME`|`Name of the Resource Group`|`rg-vh-akslab2, or other values`|
|`SQLMINAME`|`The name of the SQL managed instance`|`myvhsqlmi, or other values`|
|`SQLACCOUNTNAME`|`The Active Directory account name for this Arc-enabled SQL Managed Instance. This account needs to be created prior to the deployment of this instance`|`'azsde90sql02-1, or other values`|
|`PRIMARYDNSNAME`|`The primary service DNS name exposed to the end-users to connect to this Arc-enabled SQL Managed Instance`|`myvhsqlmi.jdnet.deere.com, or other possible values`|
|`ADCONNECTORNAME`|`The name of the Active Directory Connector. This parameter indicates an intent to deploy with AD support.`|`myvhadconnectorname, or other possible values`|
|`PORTNUMBER`|`The port number on which the primary service is exposed to the end-users`|`1433, 31433, or other possoible values`|
|`ISTHISADEVINSTANCE`|`A flage to deteremine if this is a dev instnace or not`|`true or false`|
|`CLNAME`|`Custom Location name`|`labcusloc, or other possible values`|
|`NAMESPACE`|`Specify the namespace to install the extension release`|`myarcns, or other possible values`|
|`SQLMITIER`|`The pricing tier for the SQL MI instance`|`BusinessCritical (bc for short) or GeneralPurpose (gp for short). Default is GeneralPurpose`|


## <u>Important Note</u>

In the current codebase, the parameters related to primary-dns-name, ad-connector-name, and ad-account-name are commented out. Please uncomment these in the commands before you run the pipeline.


## <u>Additional resources</u>

- [az sql mi-arc](https://learn.microsoft.com/en-us/cli/azure/sql/mi-arc?view=azure-cli-latest#az-sql-mi-arc-create)
