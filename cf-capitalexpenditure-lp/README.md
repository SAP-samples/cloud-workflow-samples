# Capital Expenditure Approval Process using SAP Cloud Platform Workflow Management
## Overview
The CAPEX process enables customers to automate capital expenditure request approvals and provide automation across all steps. A request is created by the user and depending on the amount of investment and other related attributes, number of approval steps are determined.  The following steps are included as a part of this CAPEX process:
- Business user creates a Capital Expenditure Approval Process request
- Approvers are determined using decisions
- Approvers are notified via email
- Approvers have three decision options (Approve, Reject, Request Rework), and based on the decision, the next approval step will be created or requested for a rework or the approval request will be terminated.
- Acceptance from all Approvers will send a notification to the requestor and complete the process.
## Pre-Requisites
The following SAP Cloud Platform services are required for this scenario:
  - Application Runtime
  - SAP Cloud Platform Business Application Studio / Web IDE
  - SAP Cloud Platform Workflow management
  - SAP Cloud Platform Portal
  - SAP Cloud Platform Document Management Service, Integration option
  - SAP HANA Cloud
  - SAP Cloud Platform Identity Authentication Service (optional)
  
SAP Cloud Platform Workflow Management provides standard content for automating [Capital Expenditure Approval Process](https://api.sap.com/package/sapcapitalexpenditureapprovalprocess?section=Overview).

## Capital Expenditure Approval
The following modules are available in this multi target application project.
### CustomUIForCapex
This project contains custom HTML5 applications as well as Fiori Launch Pad and Cloud Application Programming model modules which are required for capital expenditure request creation and for the approval process. 

Please note that during deployment of the project those resources will be processed:
  - Destination service with the name *Destination* (will be created, if not existent);
  - Workflow Management service with the name *WorkflowMgmt* (will be created, if not existent);
  - Process Visibility service with the name *ProcessVisibility* (will be created, if not existent);
  - Workflow service with the name *Workflow* (you should have created the service instance with this name);
  - Business Rules service with the name *BusinessRules* (will be created, if not existent);

#### ApproveCapex - SAP UI5 module
User interface to approvel capital expenditure requests.
#### ReWorkCapex  - SAP UI5 module
User interface to rework by a requestor based on approver decision.
#### StartCapex   - SAP UI5 module
User interface to start a new Capital Expenditure Request.
#### FLP          - SAP Cloud Platform Fiori launchpad module
Fiori Launch Pad module to access various applications.
#### DB           - SAP Cloud Platform Cloud Application Programming Module
Cloud Application Programming model to manage data models.
### VisibilityActionsCapex
This project contains the workflows used by SAP Cloud Platform Visibility action workflows. 

#### VisibilityActions  -  SAP Cloud Platform Workflow Module
Workflows to trigger actions from process visibility.

## Build and Deploy Multi Target Applications

### Capital Expenditure Approval Process - Custom UIs
1. Unzip CustomUIForCapex.zip under the folder User Interface into your local folder.
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer .
3. Depending on your SAP Cloud Platform account type described in the [subscription section of help document](https://help.sap.com/viewer/6f55baaf330443bd8132d071581bbae6/Cloud/en-US/c63dffcfd1cd4373bee43490c7d2e4bd.html),please adjust the mta.yaml file as showen in the below picture.

![mtayaml](https://github.com/SAP-samples/cloud-workflow-samples/blob/master/cf-capitalexpenditure-lp/images/mta.yaml.changes.png?raw=true)

4.[Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account.

### Capital Expenditure Approval Process - Visibility Actions
1. Unzip VisibilityActionsCapex.zip under the folder VisibilityActionWorkflow into your local folder
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer.
3. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account

To enable users to manage and/or view data in HANA, please assign **CapexDataModelAdmin** and **CapexDataModelViewer** roles to the relevant users in SAP Cloud Platform Cockpit.

All remaining configurations to setup the scenario are available in [SAP API Business Hub](https://api.sap.com/package/sapcapitalexpenditureapprovalprocess?section=Overview).
