# SAPUI5 Application for the Maintain Purchase Info Record Live Process

## Overview of the Scenario
The *Maintain Purchase Info Record* [live process content package](https://api.sap.com/themes/WorkflowManagement) enable customers to automate the creation, change and approval of Purchase Info Record in a flexible and transparent way. It provides flexibility in choosing process variants depending on attributes like Material, Vendor, Price, Material Group, Plant, Purchasing Group and Purchasing Organization etc. When a requestor creates a new purchase info record or updates the pricing conditions of an existing purchase info record, a pre-configured process variant is triggered using SAP Workflow Management.

The SAPUI5 application (Manage Purchase Info Record) makes the create or change request easy by providing a pre-built UI application that can be customized as per any specific requirement.

![Manage Purchase Info Record Application](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-maintainpurchaseinforecord-lp/images/managePurchaseInfoRecordApp.png?raw=true)

## Setup Guide

The steps below will guide you to import and deploy the SAPUI5 app into your SAP BTP account to use it with the live process content. The SAPUI5 also requires SAP Cloud Integration models for value helps and validation. The setup of the integration model is out of scope for this document, as it is detailed in the setup guide of the live process package Manage Purchase Info Record.

### Pre-Requisites
To import and successfully setup the SAPUI5 , you need a SAP BTP tenant (*Cloud Foundry Environment*) with active subscription to the following services:
1. SAP Cloud Portal service or SAP Launchpad service (to access the UI5 apps via Fiori Launchpad).
2. SAP Workflow Management (to orchestrate the process).
3. SAP Business Rules service (to configure business conditions in the process).
4. SAP Process Visibility service (to view the pre-built dashboard to monitor the process in real-time).
5. SAP HTML5 Application Repository Service for SAP BTP to deploy the UI5 apps.

### Deploy SAPUI5 App
1. Download the Multi-Target Application (MTA) project CustomUIForPurchaseInfoRecord.zip.
2. Use your preferred method to build and deploy the MTA project into the SAP BTP account:

- SAP Web IDE ([import archive](https://help.sap.com/viewer/825270ffffe74d9f988a0f0066ad59f0/CF/en-US/344e8c91e33b4ae8b4032709c45776a3.html) and then [build and deploy](https://help.sap.com/viewer/825270ffffe74d9f988a0f0066ad59f0/CF/en-US/1b0a7a0938944c7fac978d4b8e23a63f.html))
- SAP Business Application Studio ([deploy a MTA project](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html))
- SAP Cloud Foundry Command Line Interface ([deploy a MTA project](https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/65ddb1b51a0642148c6b468a759a8a2e.html#loio65ddb1b51a0642148c6b468a759a8a2e__section_irt_3dc_zs)).

### Add the App to SAP Fiori Launchpad
Once the SAPUI5 application deployment is successful, the same needs to be added as a tile in SAP Fiori Launchpad so that the users can access it. Depending on whether you have subscription to SAP Launchpad service or SAP Cloud Portal service, the procedure might vary.

#### Using SAP Launchpad service
* Open SAP Launchpad site manager application.
* Select Content Manager.
* Go to Content Explorer tab.
* Under the HTML5 apps, search for com.sap.cp.dpa.ManagePurchaseInfoRecord
* Select the app from the result and click ‘Add to My Content’ button to include the UI5 component.
* Go to My Content tab, and search for the role to which you want to add the app (for example, the default role called everyone).
* Click the role from the result table and navigate into it.
* Click the Edit button.
* Search for the app ‘Manage Purchase Info Record’ and click the + button to assign the app to the role.
* Save the changes to enable the app permission based on user role.
* You can either create a new group and add the Manage Purchase Info Record app to that group or you can add the Manage Purchase Info Record app to an existing group.

#### Using SAP Cloud Portal service

##### Assumptions
1. There is an existing SAP Fiori Launchpad *MTA project* for Cloud Foundry Environment.
2. The launchpad also has app router within the project.

##### Update mta.yaml of Fiori Launchpad & App router MTA Project
 - In the mta.yaml of the Fiori Launchpad project, add the repo_host of the SAPUI5 app (*Purchaseinforecord_manage_html5_repo_host*) as an existing service under the resources section like shown below.

![Add Resources](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-maintainpurchaseinforecord-lp/images/addResource.png?raw=true)
 - If not available already, then add Destination, Business Rules, Workflow and Portal as resources.
 - Add the above resources under the requires section for the portal site as shown below.

![Portal Site Requires Configuration](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-maintainpurchaseinforecord-lp/images/portalSiteRequires.png?raw=true)

- Save the mta.yaml file

##### Add the Tile in SAP Fiori Launchpad
- Open the CommonDataModel.json file of the FLP module.
- Click the add button to add a tile and give the App ID as com.sap.cp.dpa.ManagePurchaseInfoRecord and Intent Navigation as inforecord-create.

![Add Tile in SAP Fiori Launchpad](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-maintainpurchaseinforecord-lp/images/addTile.png?raw=true)

- Save.
- Build the MTA project and deploy to your SAP BTP account (cloud foundry environment).

### [Optional] Import Business Rules for Value Help
The SAPUI5 app has two fields (Currency and Unit) that requires value help. Since the value do not change frequently, the values are maintained in a business rule to make the scenario self-sufficient with minimal dependency to other services. To setup the rule, [import the rule project](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/aab7501ef811440c8b419cff02dea43a.html) (./BusinessRules/PurchaseInfoRecordSearchHelpRule.zip) into your [Business Rules service](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/c045b537db3c4743a5e7d21d7984b7ff.html). Once the project is imported, modify the decision tables to add/remove any unit or currency as per the values available in your SAP ERP system.
After updating the decision tables, activate the rule project in the following sequence Data Objects -> Rule -> Rule Service -> Rule Set -> Project. After successful activation [release the rule as a version](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/67e1ee13cfcb4835bc16ae6aece21355.html) 1.0.0 and revision 2006 and [deploy both the rule service from the released version](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/0d449b981aad4e19b978d59acaf3f3af.html).

If there is already a service (any REST or OData service) available in your landscape, then the same can be used instead of business rules. Look for getCurrency and getOrderUnit methods in the controller.js for create and change operations.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file
