sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"sap/demo/bpm/taskui/model/models"
], function (UIComponent, Device, models) {
	"use strict";

	return UIComponent.extend("sap.demo.bpm.taskui.Component", {

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
            
            // 1. Get the Task Properties
            var startupParameters = this.getComponentData().startupParameters;
            var taskModel = startupParameters.taskModel;
            var taskData = taskModel.getData();
            var taskId = taskData.InstanceID;

            // 2. Read the Task Data
            var that = this;
            var contextModel = new sap.ui.model.json.JSONModel("/sapdemobpmtaskui/bpmworkflowruntime/v1/task-instances/" + taskId + "/context");
            var contextData = contextModel.getData();

            // 3. Update UI Context Model with Task Properties Data
             contextModel.attachRequestCompleted(function () {
                contextData = contextModel.getData();

                var processContext = {};
                processContext.context = contextData;
                processContext.context.task = {};
                processContext.context.task.Title = taskData.TaskTitle;
                processContext.context.task.Priority = taskData.Priority;
                processContext.context.task.Status = taskData.Status;

                if (taskData.Priority === "HIGH") {
                    processContext.context.task.PriorityState = "Warning";
                } else if (taskData.Priority === "VERY HIGH") {
                    processContext.context.task.PriorityState = "Error";
                } else {
                    processContext.context.task.PriorityState = "Success";
                }

                processContext.context.task.CreatedOn = taskData.CreatedOn.toDateString();

                // get task description and add it to the model
                startupParameters.inboxAPI.getDescription("NA", taskData.InstanceID).done(function (dataDescr) {
                    processContext.context.task.Description = dataDescr.Description;
                    contextModel.setProperty("/task/Description", dataDescr.Description);
                }).
                    fail(function (errorText) {});

                contextModel.setData(processContext.context);
                that.setModel(contextModel);

            });

            // 4. Create Task Completion Buttons 
            var oNegativeAction = {
                sBtnTxt: "Reject",
                onBtnPressed: function (e) {
                    var viewModel = that.getModel();
                    var contxt = viewModel.getData();
                    that._completeTask(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, "No") 
                }
            };

            var oPositiveAction = {
                sBtnTxt: "Approve",
                onBtnPressed: function (e) {
                    var viewModel = that.getModel();
                    var contxt = viewModel.getData();
                    that._completeTask(that.oComponentData.inboxHandle.attachmentHandle.detailModel.getData().InstanceID, "Yes")
                }
            };

            // 5. Add the task action buttions
             startupParameters.inboxAPI.addAction({
                action: oNegativeAction.sBtnTxt,
                label: oNegativeAction.sBtnTxt,
                type: "Reject"
            }, oNegativeAction.onBtnPressed);

            startupParameters.inboxAPI.addAction({
                action: oPositiveAction.sBtnTxt,
                label: oPositiveAction.sBtnTxt,
                type: "Accept"
            }, oPositiveAction.onBtnPressed);
        },
        
        // 6. Adding Task Completion 
         _completeTask: function (taskId, approvalStatus) {
            var token = this._fetchToken();
            $.ajax({
                url: "/sapdemobpmtaskui/bpmworkflowruntime/v1/task-instances/" + taskId,
                method: "PATCH",
                contentType: "application/json",
                async: false,
                data: "{\"status\": \"COMPLETED\", \"context\": {\"approved\":\"" + approvalStatus + "\"}}",
                headers: {
                    "X-CSRF-Token": token
                }
            });
            this._refreshTask(taskId);
        },

        // 7. Supported Operations
        _fetchToken: function () {
            var token;
            $.ajax({
                url: "/sapdemobpmtaskui/bpmworkflowruntime/v1/xsrf-token",
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
