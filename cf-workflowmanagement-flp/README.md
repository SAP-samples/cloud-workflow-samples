# Setup Workflow Management Fiori Launchpad

You will import, build and deploy this multi target project that will create a Fiori Launchpad to access workflow, business rules and process visibility applications.

### Pre-Requisites
To successfully deploy this FLP, you need an account in SAP Cloud Platform Cloud Foundry environment with entitlements to the following services:
1. Portal
2. Workflow
3. Business Rules
4. Process Visibility
5. Application Runtime 
6. HTML5 Applications

### Deploy Fiori Launchpad Application
1. Download the Multi-Target Application (MTA) project **WorkflowManagementFLP.tar.zip** from the **resources** folder and uncompress the file.
2. Use *SAP WebIDE* or *SAP Business Application Studio* to import, build and deploy the MTA project into the SAP Cloud Platform account.
    - SAP Web IDE ([import archive](https://help.sap.com/viewer/825270ffffe74d9f988a0f0066ad59f0/CF/en-US/344e8c91e33b4ae8b4032709c45776a3.html) and then [build and deploy](https://help.sap.com/viewer/825270ffffe74d9f988a0f0066ad59f0/CF/en-US/1b0a7a0938944c7fac978d4b8e23a63f.html))
    - SAP Business Application Studio ([deploy a MTA project](https://help.sap.com/viewer/9d1db9835307451daa8c930fbd9ab264/Cloud/en-US/97ef204c568c4496917139cee61224a6.html))

### Access Fiori Launchpad Application
1. Open your cloud platform cockpit, and goto the **space** where you have deployed the fiori launchpad application.
2. Open **Applications** from left panel, and click to go into the **WorkflowManagementFLP_appRouter** application.
3. From the **Overview** section on left panel, click app-router link to work with workflow, business rules and process visibility applications.

## License
Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file
