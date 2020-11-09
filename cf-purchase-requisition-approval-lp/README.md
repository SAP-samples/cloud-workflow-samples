# Purchase Requisition Approval and Release using SAP Cloud Platform Workflow Management
## Overview
Purchase Requisition Approval and Release Process enable customers to automate approval and release of Line Items in a flexible and transparent way. It provides flexibility in choosing process variants depending on attributes like Request date, Price, Material Group, Document Type, Plant, Purchasing Group and Purchasing Organization etc. When a requestor creates a Purchase Request with line items in SAP ERP, pre-configured Process Variants are triggered in SAP Cloud Platform Workflow Management. 
•	Line Item data validated using Business Rules before approval.
•	Approvers are determined using a Business Rule / external system.
•	Approvers are notified via email.
•	Approvers have two decision options (Approve, Reject), and based on the decision, the next approval step will be created or requested for a rework or delete the line item and terminate the approval process.
•	Line Item released in SAP ERP for Purchase Order creation.

## Pre-Requisites
The following SAP Cloud Platform services are required for this scenario:
  - Application Runtime
  - SAP Cloud Platform Business Application Studio 
  - SAP Cloud Platform Workflow management
   - SAP Cloud Platform Integration (in SAP Cloud Platform Neo landscape)
   - SAP Cloud Platform Portal
   -  SAP Cloud Platform Cloud Connector
   -  SAP Cloud Platform Identity Authentication Service (optional)
   -  This content package requires SAP ERP 6.0 as the back-end application. 

  
SAP Cloud Platform Workflow Management provides standard content for automating [Purchase Request Approval and Release](https://api.sap.com/package/purchaserequesitionapprovalandrelease?section=Overview).

## Purchase Request Approval and Release
The following modules are available in this multi target application project.
### Custom UI for Purchase Request Approval and Release
This project contains custom HTML5 applications as well as Fiori Launch Pad  for Purchase Request Approval and Release process. 

Please note that during deployment of the project those resources will be processed:
  - Destination service with the name *Destination* (will be created, if not existent);
  - Workflow Management service with the name *WorkflowMgmt* (will be created, if not existent);
  - Process Visibility service with the name *ProcessVisibility* (will be created, if not existent);
  - Workflow service with the name *Workflow* (you should have created the service instance with this name);
  - Business Rules service with the name *BusinessRules* (will be created, if not existent);


#### CreatePurchaseRequisition   - SAP UI5 module
User interface to create new Purchase Request Approval and Release process.
#### IntializePurchaseRequisitionApproval   - SAP Cloud Platform Workflow module
Workflow to determine process variant and start approval process.
#### FLP          - SAP Cloud Platform Fiori launchpad module
Fiori Launch Pad module to access various applications.

### Purchase Requisition Visibility Workflows
This project contains the workflows used by SAP Cloud Platform Visibility action workflows. 

#### PurchaseRequisitionAction  -  SAP Cloud Platform Workflow Module
Workflows to trigger actions from process visibility.

## Build and Deploy Multi Target Applications

### Custom UI for Purchase Request Approval and Release
1. Unzip CreatePurchaseRequisitionAndApprovalProcess.zipzip under the folder User Interface into your local folder.
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer .
3. Depending on your SAP Cloud Platform account type described in the [subscription section of help document](https://help.sap.com/viewer/6f55baaf330443bd8132d071581bbae6/Cloud/en-US/c63dffcfd1cd4373bee43490c7d2e4bd.html),please adjust the mta.yaml file as shown in the below picture.

![mtayaml](https://github.com/SAP-samples/cloud-workflow-samples/blob/master/cf-purchase-requisition-approval-lp/images/mta.yaml.changes.png?raw=true)

4.[Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account.

### Purchase Requisition Approval and Release Process - Visibility Actions
1. Unzip Purchase-Requistion-Visibility-Workflows.zip under the folder Visibility Action Workflows into your local folder
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer.
3. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account

All remaining configurations to setup the scenario are available in [SAP API Business Hub](https://api.sap.com/package/purchaserequesitionapprovalandrelease?section=Overview).
