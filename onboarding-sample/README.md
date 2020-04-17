# SAP Cloud Platform Workflow Extension for SAP SuccessFactors New Hire Onboarding

## Description
This sample project contains the SAPUI5 application used for the user tasks and a workflow model which you can use to extend the SAP SuccessFactors new hire Onboarding scenario readily. The following SCN Blogs explains the scenario in detail:

[Extend SAP SuccessFactors with SAP Cloud Platform Workflow - Part 1/2](https://blogs.sap.com/2017/08/19/extend-successfactors-with-sap-cloud-platform-workflow-part-12/)

[Extend SAP SuccessFactors with SAP Cloud Platform Workflow - Part 2/2](https://blogs.sap.com/2017/08/22/extend-successfactors-with-sap-cloud-platform-workflow-part-22/)

#### Solution Diagram
![Solution Diagram](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/onboardingSolutionDiagram.png?raw=true)

1. As soon as a new hire is recruited, a New Hire event triggered in SAP SuccessFactors. A buddy is assigned as part of the standard process.
2. SuccessFactors intelligent service observes the new hire event and starts the custom extension which is realized by SAP Cloud Platform Workflow service.
3. Technically SAP Cloud Integration service takes care of the X-CSRF token and any needed context mapping. The SuccessFactors Intelligent service maps the context of the new hire to the SAP Cloud service then triggers SAP Cloud Platform Workflow service.
4. SAP Cloud Platform Workflow service runtime makes a call to SAP SuccessFactors system to get the new employee details and a list of potential buddies from the team he will join hire and his buddy data.
5. SAP Cloud Platform Workflow service sends details of the new hire (company location, role, etc…) to SAP Cloud Platform Business Rules service to get back the equipment list for this new hire.
6. Buddy logs onto the Fiori launchpad to access his tasks in the My Inbox application.
7. He sees he has a new task in his inbox for him to process the equipment assignment for the new hire.
8. The buddy’s decision to confirm or change the equipment is submitted to the workflow to be further processed.

#### Workflow Model
![Workflow Model](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/workflow.jpg?raw=true)

## Requirements
1. SAP Cloud Platform Tenant -  If you do not have one, then you could get your hands on to [a free trial account](http://cloudplatform.sap.com/try.html).
2. Active subscription to [SAP Cloud Platform Workflow](https://www.sap.com/developer/tutorials/cp-workflow-getting-started.html) in your SAP Cloud Platform tenant.
3. [Enable Workflow feature](https://help.sap.com/viewer/f85276c5069a429fa37d1cd352785c25/Cloud/en-US/07adfa6d819a42e9966e63de1a654de4.html) in SAP WebIDE Full-Stack.
4. Active subscription to Portal service and SAP WebIDE Full-Stack in your SAP Cloud Platform tenant.
5. Active SAP SuccessFactors subscription with a user who has privileges to call the OData API. You could request for a SAP SuccessFactors demo instance using the [Partner Demo Request Tool](https://hcmcloudops.successfactors.com/DemoInstance/PartnerDemo). If you do not have the authorization to request for an instance, then you could also use an [SAP SuccessFactors OData API test system](https://blogs.sap.com/2017/10/24/successfactors-odata-api-test-system/)

## Download and Installation
Download or clone the following content from Git repository:
1. cloud-workflow-samples --> onboarding-sample --> taskui --> target --> onboarding.zip
2. cloud-workflow-samples --> onboarding-sample --> workflowmodel --> SFSFOnboardingWorkflow.zip

### Import SAPUI5 Application
1. Login to SAP WebIDE Full-Stack and import the onboarding.zip into the workspace (refer to [help document](https://help.hana.ondemand.com/webide/frameset.htm?344e8c91e33b4ae8b4032709c45776a3.html) on how to do this).
2. Once the import is successful, deploy the SAPUI5 application to SAP Cloud Platform. This SAPUI5 application contains three UI components which will be later used in the workflow model for the end users to approve or confirm their respective tasks.

> Note: The products list in the 'confirmEquip' component is based on the *products.json* file available under the *models* folder. To use the product list available from your procurement system, you need to modify the *Component.js* of *confirmEquip*.

### SAP Cloud Platform Business Rules
A business rule is used to determine equipment using SAP Cloud Platform Business Rules based on the employee profile. Follow these steps to import the rule: 
1. Make sure you have [configured the business rules](https://help.sap.com/viewer/9d7cfeaba766433eaea8a29fdb8a688c/Cloud/en-US/3da89523952a4146ab6b05eaad649426.html) and provided required authorization to the users.
2. Go to the [cloud-businessrules-sample GitHub repository](https://github.com/SAP/cloud-businessrules-samples) and download [onboarding.zip](https://github.com/SAP/cloud-businessrules-samples/blob/master/rulesprojects/OnBoarding.zip) from the rulesprojects folder.
3. Open the business rules editor and follow the [help document](https://help.sap.com/viewer/9d7cfeaba766433eaea8a29fdb8a688c/Cloud/en-US/aab7501ef811440c8b419cff02dea43a.html) to import & activate the business rules in your tenant.

### SAP Cloud Platform Workflow Model
1. Log in to SAP WebIDE Full-Stack and import the file *SFSFOnboardingWorkflow.zip* into the workspace.
2. Open the project and navigate to *SuccessFactorsOnboarding.workflow* under the *workflows* folder. 
3. An email is sent to the buddy if he has not completed the 'Confirm or Change Equipment' task within the due date. Modify the To and CC email addresses to receive emails. 

![SAP Cloud Platform Destination](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/emailTask.jpg?raw=true)

4. If you do not have any procurement API to work with, for experiencing workflows, you can remove the *Order Equipment* service task and proceed.
6. After saving the workflow, right-click the *SuccessFactorsOnboarding.workflow* and choose *Deploy* --> *Deploy to SAP Cloud Platform Workflow*.

#### Different Identity Provider
Since the buddy's userId is as available in SAP SuccessFactors, assigning them to the recipient of the approval task will make no sense if the same user id is not available in SAP Cloud Platform as well. If the SAP Cloud Platform and SAP SuccessFactors use different Identity Providers for authentication, then the mapping between the users in SAP Cloud Platform and SAP SuccessFactors needs to be performed for productive usages. For testing purposes, you could modify the *Recipients* property of the following user tasks in Workflow to a user in SAP Cloud Platform. 
1. Change or Confirm equipment.
2. Approve Equipment.
3. Accept Workplace for New Hire.

![Modify Recipients](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/modifyRecipients.jpg?raw=true)

## Configuration
### Create Destinations in SAP Cloud Platform
#### SuccessFactors Destination
Before you import the downloaded .zip files, you have to create the destination for connecting to SAP SuccessFactors from SAP Cloud Platform. Create a destination with the name **SFSF** to connect to SAP SuccessFactors as shown in the image below. This destination will be used in the Workflow model.
![SAP SuccessFactors Destination](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/Destination.jpg?raw=true)
> Note: If you wish to change the destination name, make sure you change the destination name in the workflow model as well (two service tasks to get employee & buddy details)

#### Email Destination
Follow the help documentation to [configure an email destination](https://help.sap.com/viewer/f85276c5069a429fa37d1cd352785c25/Cloud/en-US/5c7a8431ccbd4b83b74b277646987c9d.html), which will b used to send escalation mails as part of workflow model.
#### Business Rules Destination
Create a new destination for executing the business rules with the following information:
Property | Value
-------- | ------
Name | BUSINESS_RULES
Type | HTTP
URL | Copy the URL from the existing destination with the name *bpmrulesruntime* and add **/rules-service** to that URL. For example, in trial landscape, the URL would be https://bpmrulesruntimebpm-<YourUserID>trial.hanatrial.ondemand.com/rules-service. 
Proxy Type | Internet
Authentication | BasicAuthentication
User & Password | User ID and credentials which has the authorization to execute rules. Refer to help document for the [roles required for runtime services of business rules](https://help.sap.com/viewer/9d7cfeaba766433eaea8a29fdb8a688c/Cloud/en-US/d21c818d46af4f8dbb1aa80a5bb12835.html).

![SAP CP Business Rules Destination](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/rulesDestination.jpg?raw=true)

### Executing the SAP SuccessFactors Employee On-boarding Extension Workflow
#### **Starting a workflow instance**
As explained in the [blog](https://blogs.sap.com/2017/08/19/extend-successfactors-with-sap-cloud-platform-workflow-part-12), the workflow should be started via SAP SuccessFactors Integration Center when the new hire is recruited. For experiencing the extension workflow, we can use the *Monitor Workflows* app to create workflow instance.

The procedure is explained in detail in the section *Managing Workflow Definitions* in the [help document](https://help.sap.com/viewer/f85276c5069a429fa37d1cd352785c25/Cloud/en-US/21efd48bbbac4d3ea5096622379e4574.html).
The initial context required by this workflow model is the user id of the new hire in SAP SuccessFactors (userId). The workflowdefinitionId is displayed under property section in the workflow editor.

##### Sample Payload 
Use the following payload when initiating the workflow from SAP Cloud Platform Integration or from any other applications, where cgrant1 is the user ID of the new hire in SAP SuccessFactors.

    {
		"definitionId":"successfactorsonboarding",
		"context":{
			"userId":"cgrant1"
		}
	}

Sample Payload when initiating the workflow from Monitor Workflow Definition app

    {
		"userId":"cgrant1"
	}

> Note: While initiating a workflow from Monitor Workflow Definition app, you do not need to pass the definitionId and the 'context' node elements.

#### **Monitoring the workflow instance**
Once the workflow instance was created successfully, administrators can monitor the progress of the workflow for technical errors in the *Monitor Workflows* App. Refer to the section *Managing Workflow Instances* in the following [help document](https://help.sap.com/viewer/f85276c5069a429fa37d1cd352785c25/Cloud/en-US/e6a48a2fd220472d8299e173ecc266e9.html).  

#### **Working with the approval tasks**
##### Confirm or Change Equipment - Task for Buddy
Once the workflow instance has been started and is running without errors, a task should be available for the buddy of the new hire to confirm or change the equipment needed. The recipients of the task are also displayed in the Monitor Workflow App. 

> Note that the recipient of this task is determined by getting all the employees who report to the manager of the new hire. In case different IdP is used, then refer to the footnote **Different IdP**.

> ![enter image description here](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/Recipients.jpg?raw=true)

The buddy can verify the equipment proposed by the business rule, and can add/remove additional equipment as needed for the new hire.
##### Approve Equipment - Task for Manager
Once the buddy confirms the equipment required for the new hire, a task is created for the new hire's manager to approve or reject the proposed equipment. If the manager accepts the task, then it moves forward. If the manager rejects the task, then the task goes back to the buddy (previous task) to modify the proposed list of equipment.

![Approve Equipment](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/approveEquipment.jpg?raw=true)
#### Confirm Order Fulfilment
Once the manager approves the equipment needed, a service is called to place the order in the procurement system. Until confirmation is received that the order is fulfilled, the workflow will be in a 'waiting' state as per the model definition. This is achieved by the Intermediate Message event. Ideally, the confirmation message should be triggered by the procurement system, but for experiencing the workflow, you can manually trigger the same from a REST client (ex: Postman). To trigger the confirmation message, you need to:
1. Get an XSRF Token.
2. Call the *Messages* API to trigger the order fulfillment.

> Note: You need to pass the workflow definition id, business key, intermediate message event id & any new context information like order id, delivery date, etc. A sample payload for this process model is as follows:

    {
		"definitionId":"OrderConfirmationmsg",
		"businessKey":"cgrant1",
		"workflowDefinitionId":"successfactorsonboarding",
		"context":{
			"orderId":"87632",
			"deliveryDate": "20-Sep-2017"
		}
	}

Refer to the [API documentation](https://help.sap.com/doc/72317aec52144df8bc04798fd232a585/Cloud/en-US/wfs-core-api-docu.html#api-Messages-v1MessagesPost) for further details.

#### Accept Workplace - Task for Buddy
Accept Workplace is the final task in the Onboarding extension process, where the buddy of the new hire will confirm that all the equipment requested are delivered and available.
![Accept Workplace](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/acceptWorkplace.jpg?raw=true)

> Note: Once a workflow instance has been completed, they no more show in the Monitor Workflow Instances app by default. To view the completed workflow instances, modify the filter criteria to show instances with Status as Completed.
> ![Completed Instances](https://github.com/SAP/cloud-workflow-samples/blob/master/onboarding-sample/images/completedInstances.jpg?raw=true)

## Known Issues
No known issues.

## How to obtain support
The project is provided "as-is", with no expected changes or support.

## License
Copyright (c) 20xx SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file
