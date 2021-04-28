# Business Partner Creation Approval Process using SAP Workflow Management
## Overview
Business Partner Creation Approval Process content package for SAP S/4HANA and SAP S/4HANA Cloud enables to automate business partner creation in a flexible and transparent way. It provides flexibility in executing a specific variant of the process depending on attributes like business partner category, etc. When a user submits a request to create a new business partner, a pre-configured process variant is triggered in SAP Workflow Management based on configurable business conditions. On approval, a business partner is created in SAP S/4HANA or SAP S/4HANA Cloud system.

- Plug and Play with SAP S/4HANA or SAP S/4HANA Cloud without any additional development.
- Possible to create business partner of category types Person and Organization.
- Process steps delivered to create a business partner.
- Automatic email notification to parties involved.
- Business Rules provides flexibility in determining process variants and approvers.
- Custom validation on business partner attributes using Business Rules.
- New variant of the process can be created using the pre-delivered process steps in a no-code / low-code approach.
- Out-of-the-box visibility into key process performance indicators.


## Pre-Requisites
The following SAP Business Technology Platform services are required for this scenario:
  - Application Runtime
  - SAP  Business Application Studio
  - SAP Workflow management
  - SAP Cloud  Portal / Launchpad Service
  - SAP Identity Authentication Service (optional)

SAP  Workflow Management provides standard content for automating [Business Partner Creation Approval Process](https://api.sap.com/package/sapbusinesspartnercreationapprovalprocess?section=Overview).

## Business Partner Creation Approval
The following projects are available in this content package.

### BusinessPartnerManagementWorkflow
Workflow Management template and step definitions.

### CustomUIForBusinessPartnerManagement
SAPUI5 modules for
  - Starting a Business Partner Creation Approval request
  - Enriching that request with address and financial data
  - For approving the request
  - For reworking the request if necessary

### VisibilityActionsBPCreation
Workflow module with SAP Workflow Form UIs for
  - Visibility Action: automatic notification of a process administrator
  - Visibility Action: manual work request to a process administrator with approval step

## Build and Deploy Multi Target Applications

### Workflow and UI projects
1. Unzip the respective archives under a folder on your local machine
2. Drag and drop the folder project to the SAP Business Application Studio under the PROJECTS Explorer.
3. Depending on your SAP Business Technology Platform account type described in the [subscription section of help document](https://help.sap.com/viewer/6f55baaf330443bd8132d071581bbae6/Cloud/en-US/c63dffcfd1cd4373bee43490c7d2e4bd.html), please adjust the mta.yaml for the respective service plans of your subscriptions.
4.[Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html) to your cloud platform account.

### Visibility and Rules projects
1. Import the zip file into the respective applications.

### Further setup
All remaining configurations to setup the scenario are available in [SAP API Business Hub](https://api.sap.com/package/businesspartnercreationapprovalprocess?section=Overview).
