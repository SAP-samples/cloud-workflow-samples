sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"com/sap/cloud/workflow/samples/audit/model/models",
	"sap/m/MessageToast"
], function(UIComponent, Device, models, MessageToast) {
	"use strict";

	return UIComponent.extend("com.sap.cloud.workflow.samples.audit.Component", {

		metadata: {
			manifest: "json"
		},

		/**
		 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
		 * @public
		 * @override
		 */
		init: function() {
			// call the base component's init function
			UIComponent.prototype.init.apply(this, arguments);

			// enable routing
			this.getRouter().initialize();

			// set the device model
			this.setModel(models.createDeviceModel(), "device");

			// get task data
			var startupParameters = this.getComponentData().startupParameters;
			var queryParameters = startupParameters.oParameters.oQueryParameters;
			var taskType = queryParameters.task[0];
			var taskModel = startupParameters.taskModel;
			var taskData = taskModel.getData();
			var taskId = taskData.InstanceID;

			// read process context & bind it to the view's model 
			var that = this;
			var jsonModel = new sap.ui.model.json.JSONModel();

			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/task-instances/" + taskId + "/context",
				method: "GET",
				async: false,
				contentType: "application/json",
				dataType: "json",
				success: function(result, xhr, data) {

					var processContext = new sap.ui.model.json.JSONModel();
					processContext.context = data.responseJSON;

					processContext.context.task = {};
					processContext.context.task.Title = taskData.TaskTitle;
					processContext.context.task.Priority = taskData.PriorityText;
					processContext.context.task.Status = taskData.StatusText;
					processContext.context.task.CreatedBy = taskData.CreatedBy;

					if (taskData.Priority === "HIGH") {
						processContext.context.task.PriorityState = "Warning";
					} else if (taskData.Priority === "VERY_HIGH") {
						processContext.context.task.PriorityState = "Error";
					} else {
						processContext.context.task.PriorityState = "Success";
					}

					processContext.context.task.CreatedOn = taskData.CreatedOn.toDateString();

					// get task description and add it to the model
					startupParameters.inboxAPI.getDescription("NA", taskData.InstanceID).done(function(dataDescr) {
						processContext.context.task.Description = dataDescr.Description;
						jsonModel.setProperty("/context/task/Description", dataDescr.Description);
					}).
					fail(function(errorText) {
						jQuery.sap.require("sap.m.MessageBox");
						sap.m.MessageBox.error(errorText, {
							title: "Error"
						});
					});

					var propertyJsonModel = new sap.ui.model.json.JSONModel();
					propertyJsonModel.setData(processContext.context.Document.JAMProperties);
					that.setModel(propertyJsonModel, "prop");
					jsonModel.setData(processContext);
					that.setModel(jsonModel);
				}
			});

			// Reject
			var oNegativeAction = {
				sBtnTxt: "Reject",
				onBtnPressed: function() {
					that._triggerComplete(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, false,
						jQuery.proxy(
							that._refreshTask, that));
				}
			};

			// Accept
			var oPositiveAction = {
				sBtnTxt: "Approve",
				sBtnType: "Accept",
				onBtnPressed: function() {
					that._triggerComplete(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, true,
						jQuery.proxy(
							that._refreshTask, that));
				}
			};

			if (taskType === "Rework") {
				// Add Submit button
				startupParameters.inboxAPI.addAction({
					action: oPositiveAction.sBtnTxt,
					label: "Submit",
					type: oPositiveAction.sBtnType
				}, oPositiveAction.onBtnPressed);
			} else if (taskType === "SignOff") {
				startupParameters.inboxAPI.addAction({
					action: oPositiveAction.sBtnTxt,
					label: "Confirm",
					type: oPositiveAction.sBtnType
				}, oPositiveAction.onBtnPressed);
			} else {
				// Add the Accept & Reject buttons
				startupParameters.inboxAPI.addAction({
					action: oPositiveAction.sBtnTxt,
					label: oPositiveAction.sBtnTxt,
					type: oPositiveAction.sBtnType
				}, oPositiveAction.onBtnPressed);

				startupParameters.inboxAPI.addAction({
					action: oNegativeAction.sBtnTxt,
					label: oNegativeAction.sBtnTxt,
					type: oNegativeAction.sBtnTxt
				}, oNegativeAction.onBtnPressed);
			}
		},

		_triggerComplete: function(taskId, approvalStatus, refreshTask) {
			var that = this;
			var startupParameters = this.getComponentData().startupParameters;
			var queryParameters = startupParameters.oParameters.oQueryParameters;
			var taskType = queryParameters.task[0];
			var overallContext = this.getModel().getData().context;
			var contextJson = {
				"status": "COMPLETED",
				"context": overallContext
			};
			var statusText = "";
			if (approvalStatus === true) {
				statusText = "Review Completed";
			} else {
				statusText = "Rejected with Comments";
			}
			if (taskType === "Tax") {
				contextJson.context.Document.Reviewers.Tax.ApprovalStatus = approvalStatus;
				contextJson.context.Document.Reviewers.Tax.ApprovalStatusText = statusText;
			} else if (taskType === "Accounting") {
				contextJson.context.Document.Reviewers.Accounting.ApprovalStatus = approvalStatus;
				contextJson.context.Document.Reviewers.Accounting.ApprovalStatusText = statusText;
			} else if (taskType === "HeadOfBA") {
				contextJson.context.Document.Reviewers.HeadOfBA.ApprovalStatus = approvalStatus;
				contextJson.context.Document.Reviewers.HeadOfBA.ApprovalStatusText = statusText;
			} else if (taskType === "ExternalAuditors") {
				contextJson.context.Document.Reviewers.ExternalAuditors.ApprovalStatus = approvalStatus;
				contextJson.context.Document.Reviewers.ExternalAuditors.ApprovalStatusText = statusText;
			} else if (taskType === "ExternalAuditHeads") {
				contextJson.context.Document.Approvers.ExternalAuditHeads.ApprovalStatus = approvalStatus;
				contextJson.context.Document.Approvers.ExternalAuditHeads.ApprovalStatusText = statusText;
			} else if (taskType === "HeadOfGroupReporting") {
				contextJson.context.Document.Approvers.HeadOfGroupReporting.ApprovalStatus = approvalStatus;
				contextJson.context.Document.Approvers.HeadOfGroupReporting.ApprovalStatusText = statusText;
			}

			if (taskType === "SignOff") {
				var configModel = new sap.ui.model.json.JSONModel();
				configModel.loadData("/html5apps/samplecollaboration/appstartui/configuration/configuration.json", null, false);
				var jamConfig = configModel.getData().SAPJamConfigurations;

				// Move document to the approved documents folder
				var serviceURL = "/html5apps/samplecollaboration/sap_jam_odata/api/v1/OData" +
					"/ContentListItems_MoveMultiple?TargetFolderId='Folder%3B" + jamConfig.jamFinalFolderID + "'" +
					"&Ids='Document%3B" + contextJson.context.Document.JAMProperties.Id + "'";
				$.ajax({
					url: serviceURL,
					method: "POST",
					async: false,
					success: function() {
						that._completeWorkflowTask(taskId, contextJson, refreshTask);
					},
					error: function() {
						MessageToast.show("Failed to move the document to the target folder");
					}
				});

			} else {
				this._completeWorkflowTask(taskId, contextJson, refreshTask);
			}

		},

		_completeWorkflowTask: function(taskId, contextJson, refreshTask) {
			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/xsrf-token",
				method: "GET",
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function(result, xhr, data) {
					var token = data.getResponseHeader("X-CSRF-Token");
					$.ajax({
						url: "/bpmworkflowruntime/rest/v1/task-instances/" + taskId,
						method: "PATCH",
						contentType: "application/json",
						data: JSON.stringify(contextJson),
						headers: {
							"X-CSRF-Token": token
						},
						success: refreshTask
					});
				}

			});
		},

		// Request Inbox to refresh the control once the task is completed
		_refreshTask: function() {
			var taskId = this.getComponentData().startupParameters.taskModel.getData().InstanceID;
			this.getComponentData().startupParameters.inboxAPI.updateTask("NA", taskId);
		}
	});
});
