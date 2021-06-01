# Insight to Action Workflows using SAP  Workflow Management
## Overview
SAP Workflow Management has Process Visibility capability, enable Process Owners / Process Operators to gain real time insights into processes and insight to actions. This enalbe business to be notified by the system as and when exceptions occur in processes or SLAs are violated. Process Visiblity enable customers to define user centric and system centric actions based on certain conditions.  Please read more about Process visibility insight to action capabilties in [SAP Help Portal](https://help.sap.com/viewer/62fd39fa3eae4046b23dba285e84bfd4/Cloud/en-US/55c6601f37f7499a9e9adba8ee845bdc.html).

Process visibility enable customers to define process status and sub status based various life cylce statuses ,  custom status based on events or application attributes. Please read more about Proecss Status in [SAP Help Portal](https://help.sap.com/viewer/62fd39fa3eae4046b23dba285e84bfd4/Cloud/en-US/5466b3cc7bdd49c5a7e45c6fc8b9a285.html)

This project contains two workflows which can be used in a Processs Visibility scenario as user centric and system centric actions.
![SolutionArch](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-insight-to-action-workflows-lp/images/solutionarchDiagram.png?raw=true) 

## System Centric Action Workflow - Notify Process Administrator
A system centric aciton in process visibility is triggered as and when a process / workflow instance has reached certain status or sub status configured by the customer.Customers can configure the various statuses where they need to be notified. 
![systemCentricVisibilityConfiguration](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-insight-to-action-workflows-lp/images/systemCentricVisibilityConfiguration.png?raw=true)

The notificaiton could also include tasks or creating tickets etc. The preconfigured workflow delviered with this package create a workflow task to a Process owner or Process Administartor depending on the Process status change.
![systemCentricWorkflow](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-insight-to-action-workflows-lp/images/systemCentricWorkflow.png?raw=true)

## User Centric Action Workflow - Restart Workflow
A user centric action in process visibility enable a process operator with an action when the process / workflow instance has reached certain status or sub status configured by the customer. Restart Workflow action enalbe a process operator to restart a workflow instance which is in a critical status (for eg: failed or suspended).
![useractionvisibilityconfiguration](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-insight-to-action-workflows-lp/images/useractionvisibilityconfiguration.png?raw=true)

Restart Workflow retrieve the existing workflow details and context data. Customers can enhance the script task to map the start payload to trigger a new workflow. The existing workflow will be cancelled using Workflow APIs.

![userCentricWorkflow](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-insight-to-action-workflows-lp/images/userCentricWorkflow.png?raw=true)

## Build and Deploy the Workflow Project
1. Unzip InsightToActionWorkflow.zip under the folder Workflow Modules  into your local folder
2. Import the project  into SAP Business Application Studio.
3. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your business technology platform account.

Please refer the setup and configuration guide of the content in SAP API Business Hub

