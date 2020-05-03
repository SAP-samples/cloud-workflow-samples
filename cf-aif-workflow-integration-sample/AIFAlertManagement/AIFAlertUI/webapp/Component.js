sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"com/sap/aif/AIFAlertUI/model/models"
], function (UIComponent, Device, models) {
	"use strict";

	return UIComponent.extend("comsapaifAIFAlertUI.Component", {

		metadata: {
			manifest: "json"
		},

		/**
		 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
		 * @public
		 * @override
		 */
		init: function () {
			// call the base component's init function
			UIComponent.prototype.init.apply(this, arguments);

			// enable routing
			this.getRouter().initialize();

			// set the device model
			this.setModel(models.createDeviceModel(), "device");

			// get task data
			var startupParameters = this.getComponentData().startupParameters;
			var taskModel = startupParameters.taskModel;
			var taskData = taskModel.getData();
			var taskId = taskData.InstanceID;

			// read context & bind UI model 
			var contextModel = new sap.ui.model.json.JSONModel("/comsapaifAIFAlertUI/bpmworkflowruntime/v1/task-instances/" + taskId +
				"/context");

			contextModel.setDefaultBindingMode(sap.ui.model.BindingMode.OneWay);
			this.setModel(contextModel);

			startupParameters.inboxAPI.addAction({
				action: "Restart",
				label: "Restart"
			}, function (button) {
				this._completeTask(taskId, 'R');
			}, this);
			startupParameters.inboxAPI.addAction({
				action: "Cancel",
				label: "Cancel"
			}, function (button) {
				this._completeTask(taskId,  "C");
			}, this);

		},
		_completeTask: function (taskId, approvalStatus) {
			var token = this._fetchToken();
			$.ajax({
				url: "/comsapaifAIFAlertUI/bpmworkflowruntime/v1/task-instances/" + taskId,
				method: "PATCH",
				contentType: "application/json",
				async: false,
				data: "{\"status\": \"COMPLETED\", \"context\": {\"aifAction\":\"" + approvalStatus + "\"}}",
				headers: {
					"X-CSRF-Token": token
				}
			});
			this._refreshTask(taskId);
		},
		_fetchToken: function () {
			var token;
			$.ajax({
				url: "/comsapaifAIFAlertUI/bpmworkflowruntime/v1/xsrf-token",
				method: "GET",
				async: false,
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function (result, xhr, data) {
					token = data.getResponseHeader("X-CSRF-Token");
				}
			});
			return token;
		},
		_refreshTask: function (taskId) {
			this.getComponentData().startupParameters.inboxAPI.updateTask("NA", taskId);
		}
	});
});
