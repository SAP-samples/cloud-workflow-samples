sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/m/MessageBox"
], function(Controller) {
	"use strict";

	var thisController;
	var workflowDefnID = "documentauditprocess";
	var jamDocDataModel;
	var docProps;
	var reviewersList;
	var oBusyDialog;

	return Controller.extend("com.sap.cloud.workflow.samples.DocumentAuditProcess.controller.startApproval", {
		onInit: function() {
			thisController = this;
			oBusyDialog = new sap.m.BusyDialog();

			docProps = {
				"Reviewers": {
					"Tax": {},
					"Accounting": {},
					"HeadOfBA": {},
					"ExternalAuditors": {}
				},
				"Approvers": {
					"ExternalAuditHeads": {},
					"HeadOfGroupReporting": {}
				}
			};

			reviewersList = {
				"Departments": {
					"Tax": [],
					"Accounting": [],
					"HeadOfBA": [],
					"ExternalAuditors": [],
					"ExternalAuditHeads": [],
					"HeadOfGroupReporting": []
				}
			};

			// get requestor information
			var configModel = new sap.ui.model.json.JSONModel();
			configModel.loadData("./configuration/configuration.json", null, false);

			var requestor = configModel.getData().Requestor;

			jamDocDataModel = new sap.ui.model.json.JSONModel({
				"Document": docProps,
				"Reviewers": reviewersList,
				"Requestor": requestor
			});

			var gUUID = this.generateDocGUID();
			docProps.DocumentNumber = gUUID;

			var currentDateInFormat = this.getCurrentDate();
			docProps.PublishingDeadline = currentDateInFormat;

			this.getView().setModel(jamDocDataModel);
		},

		onAfterRendering: function() {
			var oTaxComboBox = this.byId("Tax");
			this.bindReviewersComboBox(oTaxComboBox, "Tax");

			var oAccoutingComboBox = this.byId("Accounting");
			this.bindReviewersComboBox(oAccoutingComboBox, "Accounting");

			var oHeadOfBAComboBox = this.byId("HeadOfBA");
			this.bindReviewersComboBox(oHeadOfBAComboBox, "HeadOfBA");

			var oFinanceComboBox = this.byId("ExternalAuditors");
			this.bindReviewersComboBox(oFinanceComboBox, "ExternalAuditors");

			var oManagersComboBox = this.byId("ExternalAuditHeads");
			this.bindReviewersComboBox(oManagersComboBox, "ExternalAuditHeads");

			var oGrpHeadsComboBox = this.byId("HeadOfGroupReporting");
			this.bindReviewersComboBox(oGrpHeadsComboBox, "HeadOfGroupReporting");
		},

		bindReviewersComboBox: function(oComboBox, Department) {
			var oItemTemplate = new sap.ui.core.ListItem();
			oItemTemplate.bindProperty("key", "UserID");
			oItemTemplate.bindProperty("text", "Name");
			oItemTemplate.bindProperty("additionalText", "Email");

			oComboBox.bindItems("/Reviewers/Departments/" + Department, oItemTemplate);
			oComboBox.attachBrowserEvent("click", function(oEvent) {
				thisController.fetchReviewersListFromLocalModel(oEvent);
			});
		},

		onApproverNameChange: function(oEvent) {
			this.setDocumentPropForReviewerModel(oEvent, "Approver");
		},

		onReviewerNameChange: function(oEvent) {
			this.setDocumentPropForReviewerModel(oEvent, "Reviewer");
		},

		setDocumentPropForReviewerModel: function(oEvent, role) {
			var sourceId = oEvent.getSource().getId();
			// to get the department
			sourceId = sourceId.slice((sourceId.indexOf("--")) + 2);
			var oContext = oEvent.getSource().getSelectedItem().getBindingContext();
			var oPath = oContext.getPath();
			var splitArr = oPath.split("/");
			if (splitArr.length === 5) {
				var index = splitArr[4];
				var oComboModel = oContext.getModel().getData().Reviewers.Departments;
				var oItemModel = oComboModel[sourceId][index];
				if (role === "Approver") {
					docProps.Approvers[sourceId] = oItemModel;
				} else {
					docProps.Reviewers[sourceId] = oItemModel;
				}
			}
		},

		constructWorkflowInputPayload: function() {
			// Construct workflow payload
			var workflowPayload = {};
			workflowPayload.definitionId = workflowDefnID;
			delete jamDocDataModel.getData().Reviewers; // remove the extra JSON node
			workflowPayload.context = jamDocDataModel.getData();
			return workflowPayload;
		},

		startApprovalWorkflow: function(inputPayload) {
			// Create control for MessageBox with link to JAM document
			var txtBox = new sap.m.Text();
			txtBox.setText("Your document is successfuly uploaded in SAP Jam and send for review");

			var configModel = new sap.ui.model.json.JSONModel();
			configModel.loadData("./configuration/configuration.json", null, false);
			var jamConfig = configModel.getData().SAPJamConfigurations;

			var linkToJam = jamConfig.jamBaseURL + "/groups/" + jamConfig.jamGroupID + "/documents/" + docProps.JAMProperties.Id +
				"/slide_viewer";

			/*eslint-env browser*/
			var link = new sap.m.Link({
				text: "Link to Document",
				press: function() {
					window.open(linkToJam);
				}
			});
			inputPayload.context.Document.LinkToJam = linkToJam;

			var oVBox = new sap.m.VBox();
			oVBox.addItem(txtBox);
			oVBox.addItem(link);

			$.ajax({
				url: "/bpmworkflowruntime/workflow-service/rest/v1/xsrf-token",
				method: "GET",
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function(result, xhr, data) {
					if (data.responseText.indexOf("Unauthorized") > 0) {
						sap.m.MessageBox.show(
							"This request requires HTTP authentication. No valid session found. \nRestart the application or login again", {
								icon: sap.m.MessageBox.Icon.ERROR,
								title: "Session Time Out",
								actions: [sap.m.MessageBox.Action.OK]
							}
						);
					}
					var token = data.getResponseHeader("X-CSRF-Token");
					if (token === null) {
						return;
					}

					$.ajax({
						url: "/bpmworkflowruntime/workflow-service/rest/v1/workflow-instances",
						method: "POST",
						data: JSON.stringify(inputPayload),
						headers: {
							"X-CSRF-Token": token,
							"Content-Type": "application/json"
						},
						success: function() {
							oBusyDialog.close();
							sap.m.MessageBox.show(
								oVBox, {
									icon: sap.m.MessageBox.Icon.INFORMATION,
									title: "Review Workflow Initiated Successfuly",
									actions: [sap.m.MessageBox.Action.OK]
								}
							);
							thisController.resetData();
						},
						error: function(jqXHR, status, error) {
							oBusyDialog.close();
							sap.m.MessageBox.show(
								error, {
									icon: sap.m.MessageBox.Icon.ERROR,
									title: "Workflow Initiation Error",
									actions: [sap.m.MessageBox.Action.OK]
								}
							);
						}
					});
				}
			});
		},

		uploadDocumentToJAM: function() {
			oBusyDialog.open();

			var canProceed = this.allMandatoryFieldsCompleted();
			if (!canProceed) { // check of all the mandatory fields are filled. If not then return
				oBusyDialog.close();
				sap.m.MessageBox.show(
					"Fill all the mandatory fields in the form to proceed", {
						icon: sap.m.MessageBox.Icon.ERROR,
						title: "Complete the Form",
						actions: [sap.m.MessageBox.Action.OK]
					}
				);

				return;
			}

			var fileSelect = document.getElementsByName("JAMFileUpload");
			var files = fileSelect[0].files;
			var file = files[0];

			thisController.uploadToJAM(file);

		},

		uploadToJAM: function(file) {
			var configModel = new sap.ui.model.json.JSONModel();
			configModel.loadData("./configuration/configuration.json", null, false);
			var jamConfig = configModel.getData().SAPJamConfigurations;

			$.ajax({
				url: "/sap_jam_odata/api/v1/OData/Folders(Id='" + jamConfig.jamApprovalFolderID + "',FolderType='Folder')/ContentItems",
				method: "POST",
				processData: false,
				headers: {
					"Slug": file.name,
					"Content-Type": file.type,
					"Accept": "application/json"
				},
				data: file,
				success: function(result) {
					if (result.d == undefined) {
						return;
					}
					docProps.JAMProperties = result.d.results;
					// Update the feed entry of Jam Document with the comments from the requester
					thisController.updateReviewersCommentAsJamFeedEntry(docProps.JAMProperties.Id, docProps.JAMProperties.ContentItemType);

					var workflowPayload = thisController.constructWorkflowInputPayload();
					thisController.startApprovalWorkflow(workflowPayload);
				},
				error: function(jqXHR, status, error) {
					oBusyDialog.close();
					sap.m.MessageBox.show(
						error, {
							icon: sap.m.MessageBox.Icon.ERROR,
							title: "Jam Upload Error",
							actions: [sap.m.MessageBox.Action.OK]
						}
					);
				}
			});
		},

		getCurrentDate: function() {
			var currentDate = new Date().toJSON();
			return currentDate.slice(0, 10);
		},

		generateDocGUID: function() {
			function s4() {
				return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
			}

			var today = new Date();
			var quarter = Math.floor((today.getMonth() + 3) / 3);
			return today.getFullYear() + "-" + quarter + "-" + s4() + s4() + "-" + s4() + s4();
		},

		fetchReviewersListFromLocalModel: function(oEvent) {
			var sourceId = oEvent.currentTarget.id;
			// to get the department
			sourceId = sourceId.slice((sourceId.indexOf("--")) + 2);
			docProps.__type__ = "Document";
			docProps.ReviewerDepartment = sourceId;

			var department = {};
			department.__type__ = "Department";
			department.Name = sourceId;

			var configModel = new sap.ui.model.json.JSONModel();
			configModel.loadData("./configuration/configuration.json", null, false);
			reviewersList.Departments[department.Name] = configModel.getData().Approvers[department.Name];
			jamDocDataModel.refresh(true);

		},

		updateReviewersCommentAsJamFeedEntry: function(contentItemID, contentItemType) {
			if (docProps.RequesterComments !== undefined && docProps.RequesterComments !== "") {
				var feedText = {};
				feedText.Text = docProps.RequesterComments;

				thisController.addCommentToJAM(contentItemID, contentItemType, feedText);
			}
		},

		addCommentToJAM: function(contentItemID, contentItemType, feedText) {
			$.ajax({
				url: "/sap_jam_odata/api/v1/OData/ContentItems(Id='" + contentItemID + "',ContentItemType='" + contentItemType +
					"')/FeedEntries",
				method: "POST",
				processData: false,
				headers: {
					"Content-Type": "application/json",
					"Accept": "application/json"
				},
				data: JSON.stringify(feedText),
				success: function() {
					// do nothing
				}
			});
		},

		resetAllContent: function(oControl) {
			var allContents = oControl.getContent();
			for (var index = 0; index <= allContents.length - 1; index++) {
				var oContent = allContents[index];
				if (oContent instanceof sap.m.ComboBox) {
					oContent.setSelectedItem(null);
				} else if (oContent instanceof sap.m.Input) {
					oContent.setValue(null);
				} else if (oContent instanceof Array) {
					this.resetAllContent(oContent);
				}
			}
		},

		resetData: function() {
			// Reset Document Properties
			var docNumberInput = this.byId("_docNumberInput");
			docNumberInput.setValue(this.generateDocGUID());

			var docTypeCombo = this.byId("_docTypeCombo");
			docTypeCombo.setSelectedItem(null);

			var quarterCombo = this.byId("_quarterCombo");
			quarterCombo.setSelectedItem(null);

			var classificationCombo = this.byId("_classicficationCombo");
			classificationCombo.setSelectedItem(null);

			var businessUnitCombo = this.byId("_businessTypeCombo");
			businessUnitCombo.setSelectedItem(null);

			var yearCombo = this.byId("_yearCombo");
			yearCombo.setSelectedItem(null);

			var deadlineDatePicker = this.byId("_deadlineDatePicker");
			deadlineDatePicker.setValue(this.getCurrentDate());

			var projNameInput = this.byId("_projNameInput");
			projNameInput.setValue(null);

			var projDescInput = this.byId("_projDescInput");
			projDescInput.setValue(null);

			var jamFileUploader = this.byId("_JamFileUploader");
			jamFileUploader.setValue(null);

			// Reset Reviewers
			jamDocDataModel.getData().Reviewers = reviewersList;
			var taxReviewerCombo = this.byId("Tax");
			taxReviewerCombo.setSelectedItem(null);

			var baReviewerCombo = this.byId("HeadOfBA");
			baReviewerCombo.setSelectedItem(null);

			var accountingCombo = this.byId("Accounting");
			accountingCombo.setSelectedItem(null);

			var financeCombo = this.byId("ExternalAuditors");
			financeCombo.setSelectedItem(null);

			// Reset Approvers
			var auditApproversCombo = this.byId("ExternalAuditHeads");
			auditApproversCombo.setSelectedItem(null);

			var reportingHeadsCombo = this.byId("HeadOfGroupReporting");
			reportingHeadsCombo.setSelectedItem(null);

			// Reset Comments
			var commentsTxtArea = this.byId("_commentsTextArea");
			commentsTxtArea.setValue(null);

		},

		allMandatoryFieldsCompleted: function() {
			var docType = docProps.Type;
			var classification = docProps.Classification;
			var deadlineDate = docProps.PublishingDeadline;
			var fileName = docProps.FileName;

			var oReviewers = docProps.Reviewers;
			var taxReviewer = oReviewers.Tax.Name;
			var baReviewer = oReviewers.HeadOfBA.Name;
			var accountingReviewer = oReviewers.Accounting.Name;
			var externalAuditor = oReviewers.ExternalAuditors.Name;

			var oApprovers = docProps.Approvers;
			var externalAuditHeads = oApprovers.ExternalAuditHeads.Name;
			var grpReportingHead = oApprovers.HeadOfGroupReporting.Name;

			if (docType === undefined || classification === undefined ||
				deadlineDate === undefined || fileName === undefined ||
				taxReviewer === undefined || baReviewer === undefined ||
				accountingReviewer === undefined || externalAuditor === undefined ||
				externalAuditHeads === undefined || grpReportingHead === undefined) {
				return false;
			}
			return true;
		}
	});
});
