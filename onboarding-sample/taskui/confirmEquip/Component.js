sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"com/sap/cloud/workflow/samples/onbequip/model/models"
], function(UIComponent, Device, models) {
	"use strict";

	return UIComponent.extend("com.sap.cloud.workflow.samples.onbequip.Component", {

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
			// set the device model
			this.setModel(models.createDeviceModel(), "device");
			
			// get task data
			var startupParameters = this.getComponentData().startupParameters;
			var taskModel = startupParameters.taskModel;
			var taskData = taskModel.getData();
			var taskId = taskData.InstanceID;
			
			// read process context & bind it to the view's model 
			var that = this;
			var contextModel = new sap.ui.model.json.JSONModel("/bpmworkflowruntime/rest/v1/task-instances/" + taskId + "/context");
			var contextData = contextModel.getData();
			
			// Load product list from a locally available json model
			//You can replace the static products and call the service to retrive
			// product list from your procurement system
			var prodModel = new sap.ui.model.json.JSONModel();
			prodModel.loadData("/html5apps/onboarding/confirmEquip/model/products.json", null, false);
			var initModel = new sap.ui.model.json.JSONModel();
			initModel.loadData("/html5apps/onboarding/confirmEquip/model/init.json", null, false);
			
			contextModel.setDefaultBindingMode(sap.ui.model.BindingMode.OneWay);
			this.setModel(contextModel);
			
			// update the workflow context with task related information
			// note that this information is not persisted, but is available only when the
			// particular task UI is loaded
			
			// Since the model is loaded asynchronously we add the task related information
			// in the call back function
			contextModel.attachRequestCompleted(function() {
				contextData = contextModel.getData();
				
				// Set product list to the model 
				contextData.newEquipment = initModel.getData();
				contextData.products = prodModel.getData();
				
				// Get task related data to be set in UI ObjectHeader
				contextData.task={};
				contextData.task.Title = taskData.TaskTitle;
				contextData.task.Priority = taskData.Priority;
				contextData.task.Status = taskData.Status;
				
				// Set priority 'state' based on the priority
				if (taskData.Priority === "HIGH") {
					contextData.task.PriorityState = "Warning";
				} else if (taskData.Priority === "VERY HIGH") {
					contextData.task.PriorityState = "Error";
				} else {
					contextData.task.PriorityState = "Success";
				}
				
				// Get date on which task was created 
				contextData.task.CreatedOn = taskData.CreatedOn.toDateString();
				
				// Get task description and add it to the UI model
				startupParameters.inboxAPI.getDescription("NA", taskData.InstanceID).done(function(dataDescr){
					contextData.task.Description = dataDescr.Description;
					contextModel.setData(contextData);
		    	}).fail(function(errorText){
		    		jQuery.sap.require("sap.m.MessageBox");
		    		sap.m.MessageBox.error(errorText, { title: "Error"}); 
		    	});
			});
			
			// Implementation for the confirm action
			var oPositiveAction = {
				sBtnTxt: "Confirm",
				onBtnPressed: function(e) {
					var model = that.getModel();
					model.refresh(true);
					var processContext = model.getData();
					// Get the equipment list as a JSON string
					var equip = JSON.stringify(processContext.equipment);
					// Call a local method to perform further action
					that._triggerComplete(equip, that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, true,
						jQuery.proxy(
							// Call a local method to refresh the task list in My Inbox
							that._refreshTask, that));
				}
			};
			
			// Add 'Confirm' action to the task
			startupParameters.inboxAPI.addAction({
				// confirm is a positive action
				action: oPositiveAction.sBtnTxt,
				label: oPositiveAction.sBtnTxt,
				type: "Accept"
				// Set the onClick function
			}, oPositiveAction.onBtnPressed);

		},
		
		// This method is called when the confirm button is click by the end user
		_triggerComplete: function(equip, taskId, approvalStatus, refreshTask) {
			$.ajax({
				// Call workflow API to get the xsrf token
				url: "/bpmworkflowruntime/rest/v1/xsrf-token",
				method: "GET",
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function(result, xhr, data) {
					// After retrieving the xsrf token successfully
					var token = data.getResponseHeader("X-CSRF-Token");
					var dataText;
					// form the context that will be updated - approval status and the equipment list
					dataText = "{ \"status\":\"COMPLETED\",\"context\": {\"equipAssigned\": \"" + approvalStatus + "\" , \"equipment\" : " + equip + " }}";
					
					$.ajax({
						// Call workflow API to complete the task
						url:"/bpmworkflowruntime/rest/v1/task-instances/" + taskId,
						method: "PATCH",
						contentType: "application/json",
						// pass the updated context to the API
						data: dataText,
						headers: {
							// pass the xsrf token retrieved earlier
							"X-CSRF-Token": token
						},
						// refreshTask needs to be called on successful completion 
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