# Enable Collaboration and Document Management in SAP Workflow Management using SAP Jam

## Description
This sample workflow application with a real-world example, helps you to experience collaboration feature in SAP Workflow Management using SAP Jam. You could also use this sample application to start custom approval workflow for all or certain documents uploaded in SAP Jam.

Steve is the head of business accounting in ITeLo (an imaginary company) and is responsible for the audit reports of financial statements. For his job, Steve is in contact with people from all over the world to get things done. But Steve has a problem right now – the audit documents are reviewed manually. The manual processing of documents leads to an inefficient global collaboration due to duplication of data and limits the information on its current status.

Steve now has SAP Workflow Management to orchestrates the entire audit review process and SAP Jam to enable collaboration between the team and to manage the document involved.

The scenario is explained in detailed in the following blog:

[Enable Collaboration and Document Management in SAP Workflow Management using SAP Jam](https://blogs.sap.com/2018/05/03/enable-collaboration-and-document-management-in-sap-cloud-platform-workflow-using-sap-jam/)

### Solution Diagram

![Solution Diagram](https://blogs.sap.com/wp-content/uploads/2018/05/Solution-Diagram.png)

### Workflow Model
![Workflow Model](https://blogs.sap.com/wp-content/uploads/2018/05/WorkflowModel.jpg)

## Requirements
1. SAP BTP Tenant -  If you do not have one, then you could get your hands on to [a free trial account](https://account.hanatrial.ondemand.com/trial/#/home/trial).
2. Active subscription to [SAP Workflow Management](https://www.sap.com/developer/tutorials/cp-workflow-getting-started.html) in your SAP BTP tenant.
3. [Enable Workflow feature](https://help.sap.com/viewer/f85276c5069a429fa37d1cd352785c25/Cloud/en-US/07adfa6d819a42e9966e63de1a654de4.html) in SAP WebIDE Full-Stack.
4. Active subscription to Portal service and SAP WebIDE Full-Stack in your SAP BTP tenant.
5. Active subscription to SAP Jam service. The [SAP Jam Developer Edition](https://help.sap.com/viewer/u_collaboration_dev_help/b0d33e22661a44699b163baafb17c9d7.html) is available for free as part of SAP BTP trial account.
6. The SAP BTP tenant and SAP Jam tenant should have the same identity provider (IdP). In the trial account, SAP ID Service is the default IdP for both the accounts. In your factory account you could use SAP Identify Authentication Service (IAS) as the IdP, but make sure that **User ID** is configured as the *Name ID attribute* for both SAP Jam and cloud applications in SAP IAS.

## Download and Installation
- Download or clone the following content from the Git repository:
cloud-workflow-samples --> collaboration-sample
- Zip the collaboration-sample folder.
- Login to SAP WebIDE Full-Stack and import the collaboration-sample.zip into the workspace (refer to  [help document](https://help.hana.ondemand.com/webide/frameset.htm?344e8c91e33b4ae8b4032709c45776a3.html) on how to do this).

## Configuration
Follow the instructions [mentioned in this blog](https://blogs.sap.com/2018/06/18/pre-requisite-for-sap-cloud-platform-workflow-with-sap-jam-sample-application/) to complete the below pre-requisites.
-  Setup trust between SAP BTP and SAP Jam.
-  Setup SAP Jam Group for uploading the documents.
-  Identify SAP Jam Endpoint URLs & folder IDs.

Once the above pre-requisites are completed, then follow these steps to complete the configuration:
- In SAP WebIDE Full-Stack, expand the project the **sample.collaboration** and open the configuration file located in the folder appstartui -> configuration -> configuration.json
- Under the SAPJamConfigurations node, enter your Jam base URL, feed bootstrap URL, account feed endpoint, group id and the folder IDs copied as part of pre-requisite step.

![Configuration File](https://blogs.sap.com/wp-content/uploads/2018/06/39.jpg)

- In the Requestor and Approvers node, enter the userIDs in *upper case* (your SAP BTP User ID) who should get the tasks in My Inbox application. This user should have access to My Inbox application in SAP BTP, and also part of the ‘Document Approvals’ group created as part of pre-requisite step.

![Configuration File](https://blogs.sap.com/wp-content/uploads/2018/06/40.jpg)

- Save configuration.json file.
- Under the **workflows** folder, right-click **DocumentAuditProcess.workflow** and choose **Deploy --> Deploy to SAP Workflow Management**.
- Right-click the project **sample.collaboration** and choose **Deploy --> Deploy to SAP BTP**.

#### Start Document Audit Workflow
The SAPUI5 application to initiate the workflow is available as part of the sample application which you have deployed. Follow these steps to access it:
- Right-click on the sample application project, and choose **Deploy --> Application Status**.
- In the **Application Status** pop-up, click on the application URL to access the SAPUI5 application, which will be used to start the workflow.
- Enter the details as shown in the screen below. Use the drop-down wherever it is available.

![Start Workflow](https://blogs.sap.com/wp-content/uploads/2018/06/23-1.png)

- Click on **Browse** button to choose a document (with extensions like .doc, .docx, .xls, .xlsx, .pdf, .jpg) from your local file system.
- Enter **Comments for Reviewers** and click the button **Send for Review**.
- A pop-up should give a confirmation that the document should be uploaded in SAP Jam and a workflow instance should be created for the review process. If you are getting any error, please make sure you have completed the pre-requisites.
- Click the hyperlink **Link to Document** to access the document uploaded in SAP Jam.

#### Execute Workflow
- Go to SAP BTP Cockpit, select Services and search **Workflow**  service.
- Click on **Workflow**  tile and navigate to Workflow Service overview page.
- Click the hyperlink **Fiori Launchpad (Default Site)**.
- Once logged in to Fiori Launchpad you should see a Fiori tile called **My Inbox**. If that tile is *not* available, then

	- Click on the user icon and then App Finder icon.
	- Select workflow catalog and pin My Inbox, Monitor Workflows -> Workflow Definitions and Monitor Workflows -> Workflow Instances applications to the group My Home. If you do not see any apps, then assign the TENANT_ADMIN role of Portal ervice to your ID, logout and login again.
	- Once you are out of the edit mode, you should have the three Fiori apps available in your Fiori Launchpad, and you should see four tasks available in My Inbox application.

- Click the **My Inbox** tile.
- Click on the first task in the list, and you should see all the details about the document which is in the review. There are three sections in the custom task UI –
**Information**: This section contains the information which was provided while starting the workflow like document type, project name, etc. You also will find a link to the document available in SAP Jam.
**Reviewers**: This section lists all the reviewers as chosen while starting the workflow and the review status.
**Comments**: This section has an embedded SAP Jam document feed widget. All the comments available for the specific document in SAP Jam will be shown here. You can also add new comments, reply/like to existing comments, bookmark, share or delete your comments, etc.

![Approval Task](https://blogs.sap.com/wp-content/uploads/2018/06/32.png)

- As a reviewer, you can access the document from SAP Jam add your contributions or upload a new version of the document in SAP Jam. You could also provide your comments (either a new comment or reply to an existing comment) in the **Comments** section and Approve the task. You could also invite contributors to the document using the @mentions. Refer to the [SAP Jam collaboration guide](https://help.sap.com/user_guide/sap_jam_user_guide.pdf) to know more about collaboration using the document feed.

![Add contributors](https://blogs.sap.com/wp-content/uploads/2018/05/4-2.png)

- Click **Approve** button to complete the assigned task.
- Similarly, complete all the ‘review’ tasks assigned by clicking the **Approve** button.
- Once all the review tasks have been completed, click on the refresh icon in My Inbox task list and you should see two new approval tasks in your  **Inbox**.
- Click the first task in the list.
- As an approver, you can access the document in SAP Jam through the hyperlink available in the **Information** section. Once you have verified that the document is acceptable, click **Approve** button to accept the document.
- After verifying the document click **Approve** button to complete the approval task.
- Similarly, complete the other approval task as well.
- Once the document is approved by both external auditor head & head of group reporting, another task is created for a final sign-off.
- Click **Confirm** button to complete the final sign-off.
- With this task, the document audit workflow is complete, and the document is marked as ‘final.’ You can observe that the document in SAP Jam is moved from **Documents for Approval** folder to the **Approved Documents** folder.

## Known Issues
No known issues.

## How to obtain support
The project is provided "as-is", with no expected changes or support.

## License

Copyright (c) 2020 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](https://github.com/SAP-samples/fsm-extension-sample/blob/master/LICENSE) file
