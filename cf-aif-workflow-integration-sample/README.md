# SAP Application Interface Framework and SAP Workflow Service Integration Sample
The SAP Application Interface Framework (AIF) SAP Workflow service integration sample project can be used as reference content. Users can download and import the content of this project to their tenant to understand and learn how to integrate SAP Applcation Interface Framework and SAP Workflow service.  

The [SAP Workflow service](https://help.sap.com/viewer/product/WORKFLOW_SERVICE/Cloud/en-US) allows you to build, run, and manage workflows, from simple approvals to end-to-end processes that can span across different organizations and applications. With an inbox application and custom-built user interfaces, you involve end users into business processes for decision making and data entry.

[SAP Application Interface Framework (AIF)](https://www.sap.com/products/application-interface-mgmt.html) allows you to implement, monitor, and manage application interfaces from a central location to simplify interface handling across your system landscape.

This SAP Application Interface Framework SAP Workflow service integration sample project contains a workflow application to demonstrate the usage of SAP Workflow service in the context of integrating SAP Application Interface Framework with SAP Workflow service. **It's only intended to be used as a reference content for the development of SAP Application Interface Framework and SAP Workflow service integration applications, not for production usage directly.**

# Scenario
When an error occurs in SAP Application Interface Framework during message processing in SAP S/4HANA, an alert is created to inform the business user.   
In addition to this alert, a workflow instance in SAP Workflow service can also be created and assigned to a specific user of a group.   
Within the processing in SAP Workflow service, the users are able to see the error logs of the SAP Application Interface Framework message, and restart or cancel it from the workflow.  

# Requirements
To follow this setup guide, you need the following: 
* SAP Business Technology Platform tenant - If you don't have one, you could get your hands on a [free trial account](https://www.sap.com/products/business-technology-platform/trial.html)
* Run this [tutorial](https://developers.sap.com/tutorials/cp-starter-ibpm-employeeonboarding-1-setup.html) in your SAP BTP global account to setup your SAP Workflow Management services.
* [Enable the Workflow Management feature](https://help.sap.com/viewer/e157c391253b4ecd93647bf232d18a83/Cloud/en-US/bbcaf0a8527e4dabadcda317f039c078.html) in SAP Business Application Studio  

* Active subscription to SAP Connectivity service, SAP Destination service in your SAP BTP tenant
* SAP S/4HANA system with SAP Application Interface Framework interface

# Setup Guide
## Setup in SAP Business Technology Platform (SAP BTP)
### Create SAP Workflow Service Instance
Following the [help documentation](https://help.sap.com/viewer/09cc82baadc542a688176dce601398de/Cloud/en-US/fad874a99a434ae58c59d7340a528bdc.html), create a new SAP Workflow service instance with the following parameters:

	Instance Name: AIF_Alert_Management
	Parameters   : 
	{
	    "authorities": [
		"WORKFLOW_INSTANCE_START",
		"WORKFLOW_DEFINITION_GET",
		"WORKFLOW_INSTANCE_GET",
		"WORKFLOW_INSTANCES_UPDATE",
		"WORKFLOW_INSTANCE_CANCEL",
		"WORKFLOW_INSTANCE_GET_ERROR_MESSAGES",
		"WORKFLOW_INSTANCE_GET_CONTEXT",
		"WORKFLOW_INSTANCE_GET_EXECUTION_LOGS",
		"MESSAGE_SEND"
	    ],
	    "defaultCollectionQueryFilter": "own"
	}

<div align=left><img src="./images/Workflow_Instance.png"/></div>  

### Create Role Collection
Following the [help documentation](https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/d5f1612d8230448bb6c02a7d9c8ac0d1.html), create a new role collection with the following parameters:  

	Role Collection Name: AIF_WF_role_collection
	Description         : AIF Message Monitor

After the role collection has been created, select the role name in the role collection list, then select “Add Role” and add the following roles list:

	WorkflowContextViewer
	WorkflowMessageSender
	WorkflowTenantOperator
	WorkflowViewer
	
 
<div align=left><img src="./images/Role_Collection.png"/></div>  


### Setup Cloud Connector
Following the [help documentation](https://help.sap.com/viewer/cca91383641e40ffbe03bdc78f00f681/Cloud/en-US/f16df12fab9f4fe1b8a4122f0fd54b6e.html), set up a new connector to your SAP BTP subaccount.  
Select "Cloud to On-Premise" and add a new “Mapping Virtual to Internal ABAP System”:  

	Example:
	Field 		Value
	Back-end Type:	ABAP System
	Protocol:	HTTPS
	Internal Host:	######.wdf.sap.corp, e.g. ldci###.wdf.sap.corp  
	Internal Port:	443##
	Virtual Host:	######.wdf.sap.corp, e.g. ldci###.wdf.sap.corp 
	Virtual Port:	443##
	Principal Type: 	None
	Host in Request Header:	Use Virtual Host
To add a new resource, select “Add”. When the page “Add Resource” pops up, fill the fields with the following values:  
	
	URL Path:	/
	Active:		true
	Access Policy:	Path and all sub-paths
Save it and check the availability of the connection.

### Create Destination for Email Service
Following the [help documentation](https://help.sap.com/viewer/e157c391253b4ecd93647bf232d18a83/Cloud/en-US/45220d841c704a4c8ac78618207ee103.html), create a new email destination with the following parameters:  

	Destination Name: bpmworkflowruntime_mail
	Parameters      :   
		mail.user=<your email user> 
		mail.password=<your email password>
		mail.smtp.host=<you email provider’s host>
		mail.smtp.port=<your mail server port>
		mail.transport.protocol=smtp
		mail.smtp.starttls.required=true
		mail.smtp.starttls.enable=true
		mail.smtp.auth=true
		mail.smtp.from=<your email address>
		mail.smtp.ssl.checkserveridentity=true
		mail.bpm.send.disabled=false

<div align=left><img src="./images/Mail_Destination.png"/></div>    

### Create Destination for Workfow to Callback to ABAP System

Save the following destination, as it will be used in the workflow definition:  

	Example:
	Name: 		 YI3_000, your real name of destination
	Type:            HTTP
	Url: 	         This the URL from SCC virtual host and port, e.g. https://ldci###.wdf.sap.corp:443##
	Proxy type:      OnPremise
	Authentication:  <BasicAuthentication, according your environment>
	User:            <your test user in abap system>
	Password:        <your test user password>
	Parameters: 
	sap-client:      <your abap system client> example: 000
	WebIDEEnabled:    true
	WebIDESystem:     <you abap system id>, example: YI3
	WebIDEUsage:      odata_gen,odata_abap,dev_abap,ui5_execute_abap,bsp_execute_abap
	

### Download and Deploy Workflow AIFDemoWorkflow
Download or clone the following content from Git repository:  

	aif-scp-workflow-integration-sample --> AIFDemoWorkflow.tar

Following the [help documentation](https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/7a3e39622be14413b2a4df7c02ca1170.html), login to SAP Business Application Studio and import the "AIFDemoWorkflow.tar" into workspace.  
Once the import has finished successfully, expand the “AIFDemoWorkflow” folder, then expand the “Workflows” subfolder and double-click the file “Workflow.workflow”. The workflow definition opens in the editor.  
Select the “Send Error Mail” task and then switch to the “Details” tab in the properties section on the right. In the “To” field, enter the email addresses that should receive the alert email for the workflow instance. Save your changes.  

 <div align=left><img src="./images/Edit_Mail2.png"/></div>    

[Build and deploy to your cloud foundry](https://help.sap.com/viewer/e157c391253b4ecd93647bf232d18a83/Cloud/en-US/9ec17a68d86a463daf0e6448508bea67.html) the project to SAP BTP cloud foundry space.

#### Find the Service Key Data
After the successful deployment, open your SAP BTP cockpit and navigate to the space that you deployed the project to.  
Select the menu item “Services” > “Service Instances”, then select the application “AIF_Alert_Management” from the list of applications. Its details are displayed on a new page.  
In the bottom section, a JSON file is displayed. Find the following information in this JSON:  

	clientid
	clientsecret
	url
	
The following is a sample service key:

 <div align=left><img src="./images/Service_Key.png"/></div>    

## Setup in SAP S/4HANA System
Log on to your SAP S/4HANA system.
### Setup of the RFC Destinations
Open transaction "SM59" and create a new RFC destination with connection type “G”.  
In the “Technical Settings” section, maintain the following parameters:  

	Targ       : api.workflow-sap.cfapps.eu10.hana.ondemand.com (might be different based on your SAP BTP account)
	Path Prefix: /workflow-service
Depending on your system security requirements, in the “Logon & Security” section, activate or deactivate the field “SSL” of “Status of secure Protocol”.	
The following is a sample destination:       

 <div align=left><img src="./images/SM59_Dest.png"/></div>    

Open transaction “SBGRFCCONF” and create a new bgRFC inbound destination “BC_CPWF_INBOUND_DEST” as below:    

 <div align=left><img src="./images/bgRFC_Dest.png"/></div> 

### Setup of the oAuth2 Client Profile Configuration
Open transaction “OA2C_CONFIG”, which opens the Web Dynpro application in your default browser.   
Create a new configuration named “SWF_CPWF_OAUTH_####” with profile “SWF_CPWF_OAUTH_PROFILE”.    
For the profile configuration, enter the following parameters:   

	OAuth 2.0 Client ID           : the client id you got previously
	Client Secret                 : the client secret you got previously
	Authorization Endpoint        : the url you got previously + /oauth/authorize
	Token Endpoint                : the url you got previously + /oauth/token
	Client Authentication         : Basic
	Resource Access Authentication: Header Field
	Selected Grant Type           : Client Credentials 
	
Your setting should look like in the following screenshot:  

<div align=left><img src="./images/oAuth_Client2.png"/></div> 

### Link SAP Application Interface Framework with SAP Workflow Service
Open transaction “SEGW”. Make sure the service “SWF_CPWF_NOTIFICATION_SRV” was registered for testing an ABAP system.  

Open transaction “SM30”. In the input field “Table/View”, enter the value “V_SWF_CPWF_CNSMR” and select “Maintain”.  
If there is no entry for the Consumer Type “AIF_ALERT” in the data maintenance overview screen, create a new entry. Enter the following values:  

	Consumer: AIF_ALERT  
	Consumer text Description:  AIF Testing  
Save your entries.  

Open transaction “SM30”. In the input field “Table/View”, enter the value “V_SWF_CPWF_CNSMA” and selectc “Maintain”.  

	Consumer: AIF_ALERT  
	Active:  X  
Save your entries.  

Open transaction “SM30”. In the input field “Table/View”, enter the value “V_SWF_CPWF_DEST” and select “Maintain”.  
If there is no entry for the Consumer Type “AIF_ALERT” in the data maintenance overview screen, create a new entry. Enter the following values:    

	Destination  : the RFC destination (type “G”) you created previously
	Configuration: the OAuth configuration name you created previously

Your details should look like this:  

<div align=left><img src="./images/WF_AIF_Link.png"/></div> 

### Link SAP Application Interface Framework Interface with Workflow Definition
Open transaction “/AIF/CUST” and go to “SAP Application Interface Framework” -> “System Configuration-> “SAP Workflow Service Integration” -> “Settings for Integration of SAP Workflow Service”.  
In the data maintenance overview screen, create a new entry for your SAP Application Interface Framework interface.     
Enter the following value:    

	Ext Workflow ID: workflow, this name can be found from workflow definition in SAP Business Application Studio.
	
It should look like this:   

<div align=left><img src="./images/Interface_Link.png"/></div> 

# Trigger SAP Application Interface Framework Message and Workflow Instance
## Send Test Data
Log on to your SAP S/4HANA system.
Send the SAP Application Interface Framework message with error logs for the interface you configured previously.

# Monitoring at SAP BTP	
Open your SAP Workflow Management Lauchpad ([as described in tutorial step 2](https://developers.sap.com/tutorials/cp-starter-ibpm-employeeonboarding-1-setup.html)).    
In the Fiori Launchpad, select “My Inbox” to display the user task application.    
Select the list item to display the AIF message information.   
It should look like this:  

<div align=left><img src="./images/User_Task2.png"/></div> 

# Troubleshooting
## SAP Workflow Service Call Logs
If you've triggered the AIF message from your SAP S/4HANA system but can't see any user task in the SAP BTP Monitoring Launchpad inbox, log on to your SAP S/4HANA system and open transaction “SLG1”.  
In the selection screen, enter the following parameters:  

	Object          : /AIF/LOG	
	Subobject       : /AIF/NOTIF
	From (Date/Time): The date you sent message 00:00:00
	To (Date/Time)  : The date you sent message 23:59:59

Selecte “Execute”.   
You can check the SAP Workflow service call logs in the result list:  

<div align=left><img src="./images/SCP_Call_Log.png"/></div> 

# Known Issues
In this sample project, it's only possible to display/restart/cancel the AIF message.  
It's not possible to change AIF message content.

# How to Get Support
The project is provided "as-is", with no expected changes or support.

# License
Copyright (c) 2021 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the SAP SAMPLE CODE LICENSE AGREEMENT.  

