# Custom Task UIs for Payment Data Changes Live Process

## Description

SAP UI5 Custom Task UIs for the user tasks in Business Partner Payment Data Changes Approval Live Process are maintained here. The steps below will guide you to import the UIs into your workspace, do the minimal changes and deploy it in your tenant in order to use it with the Live Process Content.

## Requirements

SAP BTP Tenant with active subscription to Launchpad Services, Destination and SAP Business Application Studio. 

## Steps to set up the Custom Task UIs for Business Partner Payment Data Change Approval Process

The custom task UIs used in the process steps of Business Partner Payment Data Change Approval Process make use of the rich capabilities of SAP UI5. 

It retrieves Value Help and Banking data that helps the end user to change the payment details of the Business Partner.

### Steps: 

1. Unzip the contents of 'Modify_BUPA_CustomUIs_S4.zip'
2. Create an MTA with the same name - Modify_BUPA_CustomUIs_S4. 
3. Drag and drop the contents of the Modify_BUPA_CustomUIs_S4 (folders and files) into the MTA project. Make sure the folder structure is maintained.
4. Allow overwriting the mta.yaml

Build the mta and deploy it to your tenant.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file