# Document Centric Approval Process using SAP  Workflow Management
## Overview
Document Centric Approval Process enables customers to automate approval or review of documents  involving multiple business users from different organizations. Upon creating a request, user defines multiple approvals steps and specifies step names, Approver, Watcher (optionally), due date and comment for Approver (optionally) for each approval step. Moreover, requestor uploads one or more attachments for further review by approver(s). 

The following steps are included as a part of Document Centric Approval Process:

- Business user (Requester) uploads one or more documents, invites approvers/reviewers and starts a workflow.

- Approvers are notified via email.

- Approvers accesses My Inbox to claim their tasks, review the document and choose one of the following decisions. 

 
 **Approve**:  Upon selecting “Approve” option, Requester and Watcher (if specified) are notified via email about acceptance of the request               by a given Approver on a given step and the next approval step is initialized (if present).
 
 **Reject**:   Upon selecting “Reject” option, Requester is notified via email about rejection of the request and the process is     terminated;
  
 **Rework**: 	Upon selecting “Rework” option, Requester is notified via email that the request needs to be reworked. Requester then accesses the task in My Inbox app, modifies the request in accordance with Approver’s comments and sends request for reapproval by clicking on “Send for Approval” button. Alternatively, Requester can choose “Terminate” option which triggers termination of the process.	

Approver can also get expert opinion by sharing the task with another business user using the “Forward” action. Approver then selects a user from the list, specifies the comment for that user (optionally) and forwards the request. The user to whom the request was forwarded can now access the task in My Inbox applicationp and review the request. This user doesn’t have permissions to edit or complete the request and can only specify a comment (optionally) and send the request back to Approver by clicking on “Update” button.

When the request is accepted by all Approvers, email notification is sent out to Requester informing about full approval and the process is completed.
There are two Mutlitarget Application Projects and one process visibility scenario available in this scenario.
## Pre-Requisites
The following SAP Business Technology Platform services are required for this scenario.
 - SAP  Workflow Management
 - SAP  Business Application Studio
 - SAP  Document Management Service
 - SAP  Identity Authentication 
  
### DocumentApproval
The following modules are available in this multi target application project.
#### Document Approval - Workflow Module
A workflow model enable multiple approval or review steps in a sequencial way and process the decision of task owners.
![Workflow](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-documentcentricapprovalprocess-lp/images/documentWorkflow.jpg?raw=true)
#### Document Centric Start UI - SAP UI5 module
Workflow start ui to create a document review or approval request and attach one or more documents. The start UI integrated with SAP Document Management and Identity Authentication Service.
A requestor can add multiple approvers or reviewers , optionally add watchers and set dead line for each steps. When a taskowner complete the task, watcher will be informed through email notification.
![StartUI](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-documentcentricapprovalprocess-lp/images/startUI.png?raw=true) 
#### Document Centric Task UI - SAP UI5 module
Approval or review taskuis using SAP UI5 and integtrated with SAP Document Management.  Approver or reviewer can forward the task to other business users. 
![TaskUI](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-documentcentricapprovalprocess-lp/images/taskUI.png?raw=true) 

Forward task by inviting other business users who are not task owners but collaborate with experts. The forwarded task owner can share comments and send the task back to the approver.
![TaskForwarding](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-documentcentricapprovalprocess-lp/images/taskforwarding.png?raw=true) 
#### Document Centric Rework UI - SAP UI5 module
Rework of request using SAP UI5 and integrated with SAP  Document Manaagement.
An approver can request for rework and requestor can modify or attach additional documents to the request.
![TaskForwarding](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-documentcentricapprovalprocess-lp/images/reworktask.png?raw=true) 

#### Document Approval - Process Visibility scenario
Real time visibility into document centric approval process with key performance indicators.
![ProcessVisibility](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-documentcentricapprovalprocess-lp/images/processvisibility.png?raw=true)
## Build and Deploy Multi Target Application and Visibility scenario
 ### Document Centric Approval Process
  
1. Unzip Document Centric Approval Process.zip under the folder WorkflowAndUI5Modules     into your local folder
2. Import the project  into SAP Business Application Studio.
3. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your business technology platform account.


### Document Approval Process - Visibility Scenario
1. Download the file DocumentCentricApproval.zip folder under Process visibility folder
2. [Import and activate  the scenario](https://help.sap.com/viewer/62fd39fa3eae4046b23dba285e84bfd4/Cloud/en-US/879735a2cbc244578767d32610c8c141.html) using Configure Scenario application in your Workflow Management Fiori Launch Pad.

## Destinations
The following desintations required in the same SAP Business Technology Platform Subaccount where Workflow Management is subscribed.

### 1. Document Managment

| Name | Value |
| --- | --- |
| Name | bpmworkflowruntime_attachments |
| Type | HTTP |
| Authentication | OAuth2UserTokenExchange |
| URL | <"endpoints":"ecmservice":"url">/browser/<Repository_ID>/root/ 
| Token Service URL | <"uaa":"url">/oauth/token |
| Token Service URL Type | Dedicated |

### 2. Identity and Authentication
Configure [ Identity Authentication Service](https://help.sap.com/viewer/6d6d63354d1242d185ab4830fc04feb1/Cloud/en-US/d17a116432d24470930ebea41977a888.html) destination with the following parameters to call [SCIM REST APIs](https://help.sap.com/viewer/6d6d63354d1242d185ab4830fc04feb1/Cloud/en-US/2f215687fcf34170b0bbc8b36b60f2e9.html)
| Name | Value |
| --- | --- |
| Name | SCIM |
| Type | HTTP |
| Authentication | Basic Authentication |
| URL | https://<IAS tenant ID>.accounts.ondemand.com | 
|User |  |
| Password |  |
To obtain User and Password values please follow how to add [system administrator](https://help.sap.com/viewer/6d6d63354d1242d185ab4830fc04feb1/Cloud/en-US/bbbdbdd3899942ce874f3aae9ba9e21d.html#loiocefb742a36754b18bbe5c3503ac6d87c) . 

### 3. Workflow OAuth Destination
Configure bpmworkflowruntimeoauth destination. For more information on configuring destination, see [configure oauth destination](https://help.sap.com/viewer/e157c391253b4ecd93647bf232d18a83/Cloud/en-US/e8b9b990bf69416d910ed7d26512b207.html).                                            
### 4. Workflow Email Destination
Configureworkflow   email   destination. For   more   information   on   configuringdestination, see [configure workflow email destination](https://help.sap.com/viewer/e157c391253b4ecd93647bf232d18a83/Cloud/en-US/45220d841c704a4c8ac78618207ee103.html).

## Configure SAP Cloud Portal / Launchpad Service Site
Configure SAP Cloud Portal / Launchpad service site to access Workfow Managment applications.

Please refer [Configure Workflow Monitor applications and My Inbox application](https://help.sap.com/viewer/e157c391253b4ecd93647bf232d18a83/Cloud/en-US/97c079f9317c42bba31cc9ca9d4cc7c3.html).

Please refer [Configure Process Visibility applications](https://help.sap.com/viewer/62fd39fa3eae4046b23dba285e84bfd4/Cloud/en-US/1d7f29c27b084fe986508b1f0dd3d240.html).

## Configure a Workflow Start tile in Lauchpad site
1. Open SAP Portal / Launchpad site manager application.
2. Select **Content Manager** and **Content Explorer**.
3. Search **com.sap.bpm.DocumentCentricStartUI** and select the sAP UI5 component.
4. Click **Add to My Content** button to include the UI5 component.
5. Add  UI5 component to **Everyone** role and include in appropriate groups

## Using Document Centric Approval Process

To start the document centric approval process Requester accesses Document Centric Request application using configured Launch Pad site. 
Application automatically populate First Name, Last Name, Email Address and User ID fields in the “Requester” section with the data from Identity and Authentication service (Requester can edit these values, if necessary). 
In the “Request Details” section Requester provides relevant Title for the request. 
In the ‘Approval Steps” section Requester defines at least one approval step by specifying Step ID, selecting Approver from the list of users from Identity and Authentication service and specifying Due Date. Optionally Requester can select Watcher for the approval step (this user will be included in the cc of the approval notification email) and specify Comment for Approver of the step. To add new approval step Requester clicks on “plus” icon in right top corner of the table (1). To delete an approval step Requester clicks on “delete” icon (2).

Please refer the user guide documentation in [SAP API BusinesssHub](https://api.sap.com/package/documentcentricapprovalprocess?section=Overview) for more details.
