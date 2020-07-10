# SAPUI5 Application for the Vendor Onboarding Process Content Package

## Overview of the Scenario
The *Vendor Onboarding* [process content package](https://api.sap.com/themes/WorkflowManagement)  enables business experts in organizations to accelerate the automation of their vendor onboarding process in a transparent way and provide flexibility to meet business requirements. It includes processes, decisions and visibility scenario content, enabling customers to flexibly configure process variants in a low-code / no-code approach. The Vendor Onboarding content package provides flexibility in executing a specific variant of the process depending on account group and vendor type. When a request to register a new vendor is received, a pre-configured process variant is triggered in SAP Cloud Platform Workflow Management based on business conditions. Accounting and Purchasing information can be enriched and validated by the respective department. Only after an approval from all the parties involved, the vendor is created in SAP Enterprise Resource Planning (SAP ERP).

There are four SAPUI5 applications required for the vendor onboarding package. It has been split into two multi-target application projects:
- StartUIforVendorOnboarding - One HTML5 module (VendorOboarding) to start the process.

![Request Vendor Onboarding](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-vendoronboarding-lp/images/startUI.png?raw=true)

- TaskUIforVendorOnboarding - used in the My Inbox tasks. There are three HTML5 modules in this project, and each of them is used for different tasks in My Inbox - register new vendor, enrichment of accounting details of vendor (image below) and enrichment of purchasing details of the vendor.

![Enrich Accounting Details of Vendor](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-vendoronboarding-lp/images/enrichAccountingDetails.png?raw=true)


## Setup Guide

The steps below will guide you to import and deploy both the SAPUI5 projects into your SAP Cloud Platform account to use it for the Vendor Onboarding process content. The SAPUI5 app also requires SAP Cloud Platform Integration models for a few of the value helps. The setup of the integration model is out of scope for this document, as it is detailed in the setup guide of the process content package for Vendor Onboarding.

### Pre-Requisites
To import and successfully setup the SAPUI5 applications, you need a SAP Cloud Platform tenant (*Cloud Foundry Environment*) with active subscription to the following services:
1. Portal (to access SAP Fiori Launchpad).
2. Workflow Management (to orchestrate the process).
3. Business Rules (to configure business conditions in the process).
4. Process Visibility (to view the pre-built dashboard to monitor the process in real-time).
5. Entitlement for UAA, html-apps-repo with app-host and app-runtime (for authentication and security).

### Deploy SAPUI5 App
1. Download the Multi-Target Application (MTA) project CustomStartUIForVendorOnboarding.zip and CustomTaskUIForVendorOnboarding.zip from the SAPUI5 Application folder.
2. Use your preferred method to build and deploy the MTA projects individually into the SAP Cloud Platform account. You can also merge them into a single project to use the same apps-repo & uaa instances.


- SAP Web IDE ([import archive](https://help.sap.com/viewer/825270ffffe74d9f988a0f0066ad59f0/CF/en-US/344e8c91e33b4ae8b4032709c45776a3.html) and then [build and deploy](https://help.sap.com/viewer/825270ffffe74d9f988a0f0066ad59f0/CF/en-US/1b0a7a0938944c7fac978d4b8e23a63f.html))
- SAP Business Application Studio ([deploy a MTA project](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html))
- SAP Cloud Foundry Command Line Interface ([deploy a MTA project](https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/65ddb1b51a0642148c6b468a759a8a2e.html#loio65ddb1b51a0642148c6b468a759a8a2e__section_irt_3dc_zs)).

### Add Vendor Onboarding Application to SAP Fiori Launchpad
Once the deployment of VendorOnboarding app (from the StartUI project) is successful, it can be added as a tile in SAP Fiori Launchpad so that the users can access it to submit new vendor creation request. The other apps are accessed from the pre-delivered My Inbox application and hence need not be added as a tile.

#### Assumptions
1. There is an existing SAP Fiori Launchpad *MTA project* for Cloud Foundry Environment.
2. The launchpad also has app router within the project.

#### Update mta.yaml of Fiori Launchpad & App router MTA Project
 - In the mta.yaml of the Fiori Launchpad project, add the repo_host of the SAPUI5 app (for example, *VendorOnboarding_html5_repo_host*) as an existing service under the resources section like shown below.

![Add Resources](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-vendoronboarding-lp/images/addResource.png?raw=true)
 - If not available already, then add Destination, Business Rules, Workflow and Portal as resources.
 - Add the above resources under the requires section for the portal site as shown below

![Portal Site Requires Configuration](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-vendoronboarding-lp/images/portalSiteRequires.png?raw=true) 

- Save the mta.yaml file

#### Add the Tile in SAP Fiori Launchpad
- Open the CommonDataModel.json file of the FLP module.
- Click the add button to add a tile and give the App ID as com.sap.VendorOnboarding and Intent Navigation as vendor-create.

![Add Tile in SAP Fiori Launchpad](https://github.com/SAP/cloud-workflow-samples/blob/master/cf-vendoronboarding-lp/images/addTile.png?raw=true)

- Save.
- Build the MTA project and deploy to your SAP Cloud Platform account (cloud foundry environment).

### [Optional] Import Business Rules for Value Help
The SAPUI5 app has multiple fields (36 value helps like country, region, currency, accounting group, withholding tax code, terms of payment, purchasing group, interest cycle, mode of transport, etc.) that requires value help. Since those value do not change frequently, the values are maintained in a business rule to make the scenario self-sufficient with minimal dependency to other services. To setup the rule, [import the rule project](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/aab7501ef811440c8b419cff02dea43a.html) (./BusinessRules/VendorOnboardingValueHelp.zip) into your [SAP Cloud Platform Business Rules](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/c045b537db3c4743a5e7d21d7984b7ff.html). Once the project is imported, modify the decision tables to add/remove the values as per the values available in your SAP ERP system.
After updating the decision tables, activate the rule project in the following sequence All Data Objects -> All Rules -> All Rule Services -> All Rule Sets -> Project. After successful activation, [deploy each rule service to SAP Cloud Platform](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/0d449b981aad4e19b978d59acaf3f3af.html). 

If there is already a service (any REST or OData service) available in your landscape, then the same can be used instead of business rules. Look for value help methods in the controller.js under each HTML5 module.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file
