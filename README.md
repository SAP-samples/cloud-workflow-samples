
# SAP Cloud Platform Workflow Sample Applications

## Description
[SAP Cloud Platform Workflow](https://cloudplatform.sap.com/capabilities/product-info.SAP-Cloud-Platform-Workflow.df696e5a-d973-4ecd-8d8d-532d60aa1921.html) allows you to build, run, and manage workflows, from simple approvals to end-to-end processes that can span across different organizations and applications. With an inbox application and custom-built user interfaces, you involve end-users into business processes for decision making and data entry.

This *SAP Cloud Platform Workflow samples project* contains a collection of workflow applications to demonstrate the usage of SAP Cloud Platform Workflow in the context of extending the standard processes in SAP SuccessFactors, SAP S/4HANA, SAP Jam, SAP Concur, etc. They are intended to be used as a reference content for the development of workflow-based applications.

### List of sample projects
|Application|Scenario|Scenario Description|
|---|---|---|
|SAP SuccessFactors|[Extend SAP SuccessFactors new hire on-boarding](https://github.com/SAP/cloud-workflow-samples/tree/master/onboarding-sample)|Human resources are still the biggest assets in most industry sectors. Many organizations invest significantly on recruiting the best talent and subsequently on employee on-boarding. Therefore, proper resource utilization becomes imperative for any company’s success. However, employee on-boarding varies across industries and countries and it takes days – or even weeks – for a new employee to become productive. Automating some of these industry specific on-boarding processes will help managers reduce confusion and increase productivity.|
|SAP Jam|[Enable collaboration in SAP Cloud Platform Workflow with SAP Jam](https://github.com/SAP/cloud-workflow-samples/tree/master/collaboration-sample)|See how to Automate a document-centric process (where the documents have a crucial role in creating value for the business) to help business users to avoid lots of manual work and exchange of ideas or feedback through emails or other mediums. You could even start a custom approval process whenever a document is uploaded in SAP Jam.|
|SAP AIF|[Enhance AIF Alert Management using SAP Cloud Platform Workflow](https://github.com/SAP-samples/cloud-workflow-samples/tree/master/cf-aif-workflow-integration-sample)|Use this sample content to understand how S/4HANA message processing error shown in AIF can create an alert to the business users. Each alert triggers a workflow using SAP Cloud Platform Workflow service which is then automatically assigned to specific user group who can monitor the error logs of the AIF messages and restart or cancel the AIF message from workflow.|
|Microsoft Outlook|[Integrate SAP Cloud Platform Workflow with Microsoft Outlook](https://github.com/SAP-samples/cloud-workflow-samples/tree/master/cf-outlook-integration-sample)|Learn how to bring together Microsoft Outlook (Office 365 edition) and SAP Cloud Platform Workflow to directly complete your tasks from within the e-mail client. The basic idea of integration is to send e-mail notifications about new tasks to all entitled recipients and to allow task processing directly via mail.|

## Requirements
For all the sample applications, you would need the following:
1. SAP Cloud Platform Tenant -  If you do not have one, then you could get your hands on to [a free trial account](http://cloudplatform.sap.com/try.html).
2. Active subscription to Portal service and SAP WebIDE Full-Stack in your SAP Cloud Platform tenant.
3. Active subscription to [SAP Cloud Platform Workflow](https://www.sap.com/developer/tutorials/cp-workflow-getting-started.html) in your SAP Cloud Platform tenant.
4. [Enable Workflow feature](https://help.sap.com/viewer/f85276c5069a429fa37d1cd352785c25/Cloud/en-US/07adfa6d819a42e9966e63de1a654de4.html) in SAP WebIDE Full-Stack. 
5. Additional Requirements only for Microsoft Outlook Integration
  - Microsoft Office 365 Business subscription with Microsoft Exchange included. 
    - Get in touch with your IT help desk when in doubt. 
    - [Outlook Actionable Messages](  https://docs.microsoft.com/en-us/outlook/actionable-messages/) with [Adaptive Cards]( https://docs.microsoft.com/en-us/outlook/actionable-messages/adaptive-card)
  - Java 8 and Maven 3
  - User ID on the SAP Cloud Platform needs to be the same as the user in Microsoft Azure Active Directory/ Office 365. 


For the requirements of individual sample applications, you can refer to the respective README files.

## Download and Installation
Refer to the README file of following sample applications:
1. [SAP Cloud Platform Workflow Extension for **SAP SuccessFactors** new hire **Onboarding**](https://github.com/SAP/cloud-workflow-samples/tree/master/onboarding-sample)
2. [Enable **collaboration** in SAP Cloud Platform Workflow with **SAP Jam**](https://github.com/SAP/cloud-workflow-samples/tree/master/collaboration-sample). 
3. [Enhance **AIF Alert Management** using SAP Cloud Platform Workflow](https://github.com/SAP-samples/cloud-workflow-samples/tree/master/cf-aif-workflow-integration-sample)
4. [Integrate SAP Cloud Platform Workflow with **Microsoft Outlook**](https://github.com/SAP-samples/cloud-workflow-samples/tree/master/cf-outlook-integration-sample)

## Configuration
Refer to the README file of following sample applications:
1. [SAP Cloud Platform Workflow Extension for **SAP SuccessFactors** new hire **Onboarding**](https://github.com/SAP/cloud-workflow-samples/tree/master/onboarding-sample)
2. [Enable **collaboration** in SAP Cloud Platform Workflow with **SAP Jam**](https://github.com/SAP/cloud-workflow-samples/tree/master/collaboration-sample). 
3. [Enhance **AIF Alert Management** using SAP Cloud Platform Workflow](https://github.com/SAP-samples/cloud-workflow-samples/tree/master/cf-aif-workflow-integration-sample)
4. [Integrate SAP Cloud Platform Workflow with **Microsoft Outlook**](https://github.com/SAP-samples/cloud-workflow-samples/tree/master/cf-outlook-integration-sample)

## Known Issues
1. No known issues for [SAP Cloud Platform Workflow Extension for **SAP SuccessFactors** new hire **Onboarding**](https://github.com/SAP/cloud-workflow-samples/tree/master/onboarding-sample) and [Enable **collaboration** in SAP Cloud Platform Workflow with **SAP Jam**](https://github.com/SAP/cloud-workflow-samples/tree/master/collaboration-sample)
2. Refer Known Issues section for [Enhance **AIF Alert Management** using SAP Cloud Platform Workflow](https://github.com/SAP-samples/cloud-workflow-samples/tree/master/cf-aif-workflow-integration-sample)

## How to obtain support
The project is provided "as-is", with no expected changes or support.

## License
Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file
