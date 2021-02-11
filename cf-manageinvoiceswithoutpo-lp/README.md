# Custom Task UIs and Header Workflow for Manage Invoices without Purchase Order Live Process

## Description

SAP UI5 Custom Task UIs for the user tasks in Manage Invoices without Purchase Order Live Process are maintained here. The steps below will guide you to import the UIs into your workspace, do the minimal changes and deploy it in your tenant in order to use it with the Live Process Content.

## Requirements

SAP Business Technology Platform Tenant with active subscription to Launchpad Service, Destination and SAP Business Application Studio. 

In SAP Business Application Studio, ensure that a dev space is available for SAP Fiori applications and Workflow Management.

## Build and Deploy Multi Target Applications

### NonPOVendorInvoiceUI - Custom UIs
1. Unzip NonPOVendorInvoiceUI.zip.
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer .
3. Depending on your SAP Business Technology Platform account type described in the [subscription section of help document](https://help.sap.com/viewer/6f55baaf330443bd8132d071581bbae6/Cloud/en-US/c63dffcfd1cd4373bee43490c7d2e4bd.html) , please adjust the mta.yaml appropriately.
4. In case you are using the Document Information Extraction service, replace the url within the DocumentExtractionApplicationURL property in config.properties file in the StartUI application with your DocX application url.
5. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account.

### NonPOVendorInvoiceHeaderProcess - Header Workflow
1. Unzip NonPOVendorInvoiceHeaderProcess.zip.
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer .
3. Depending on your SAP Business Technology Platform account type described in the [subscription section of help document](https://help.sap.com/viewer/6f55baaf330443bd8132d071581bbae6/Cloud/en-US/c63dffcfd1cd4373bee43490c7d2e4bd.html) , please adjust the mta.yaml appropriately.
4. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account.

### NonPOVendorInvoiceSearchHelpPolicy - Value Help Policy
1. Import the NonPOVendorInvoiceSearchHelpPolicy.zip business rules project by following the instructions [here](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/aab7501ef811440c8b419cff02dea43a.html)
2. Activate and deploy the rule services within the project. Refer to the following [help doc instructions](https://help.sap.com/viewer/0e4dd38c4e204f47b1ffd09e5684537b/Cloud/en-US/0d449b981aad4e19b978d59acaf3f3af.html)

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file
