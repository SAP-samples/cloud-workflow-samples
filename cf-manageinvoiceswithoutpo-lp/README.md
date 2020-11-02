# Custom Task UIs and Header Workflow for Manage Invoices without Purchase Order Live Process

## Description

SAP UI5 Custom Task UIs for the user tasks in Manage Invoices without Purchase Order Live Process are maintained here. The steps below will guide you to import the UIs into your workspace, do the minimal changes and deploy it in your tenant in order to use it with the Live Process Content.

## Requirements

SAP Cloud Platform Tenant with active subscription to Portal Services, Destination and SAP Business Application Studio. 

In SAP Business Application Studio, ensure that a dev space is available for SAP Fiori applications and Workflow Management.

## Build and Deploy Multi Target Applications

### NonPOVendorInvoiceUI - Custom UIs
1. Unzip NonPOVendorInvoiceUI.zip.
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer .
3. Depending on your SAP Cloud Platform account type described in the [subscription section of help document](https://help.sap.com/viewer/6f55baaf330443bd8132d071581bbae6/Cloud/en-US/c63dffcfd1cd4373bee43490c7d2e4bd.html) , please adjust the mta.yaml appropriately.
4. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account.

### NonPOVendorInvoiceHeaderProcess - Header Workflow
1. Unzip NonPOVendorInvoiceHeaderProcess.zip.
2. Drag and drop the project to the SAP Business Application Studio under the PROJECTS Explorer .
3. Depending on your SAP Cloud Platform account type described in the [subscription section of help document](https://help.sap.com/viewer/6f55baaf330443bd8132d071581bbae6/Cloud/en-US/c63dffcfd1cd4373bee43490c7d2e4bd.html) , please adjust the mta.yaml appropriately.
4. [Build the project and deploy the archive](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html)  to your cloud platform account.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file