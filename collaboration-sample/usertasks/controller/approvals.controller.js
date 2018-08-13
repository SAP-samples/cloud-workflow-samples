sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/m/MessageToast"
], function(Controller, MessageToast) {
	"use strict";

	return Controller.extend("com.sap.cloud.workflow.samples.audit.controller.approvals", {

		onAfterRendering: function() {
			this.initJamWidget();
		},

		initJamWidget: function() {

			this.getJamAccessToken().then(function(token) {

				var contentProperty = this.getOwnerComponent().getModel("prop");
				var contentItemType = contentProperty.getProperty("/ContentItemType");
				var contentId = contentProperty.getProperty("/Id");
				var jamWidgetOptions = {
					type: "content_item",
					avatar: true,
					faces: true,
					live_update: true,
					is_sso: true,
					content_id: contentId,
					content_type: contentItemType,
					max_items: "7",
					mobile_mode: true,
					post_mode: "inline",
					reply_mode: "inline",
					single_use_token: token
				};

				/*globals sapjam:true*/
				this.boostrapJam().then(function() {
					if (sapjam && sapjam.feedWidget) {
						var configModel = new sap.ui.model.json.JSONModel();
						configModel.loadData("/html5apps/samplecollaboration/appstartui/configuration/configuration.json", null, false);
						var jamConfig = configModel.getData().SAPJamConfigurations;

						var containerID = this.getView().createId("jamContainer");
						$("#" + containerID).empty();
						sapjam.feedWidget.init(jamConfig.jamAccountFeedEndpoint, "single_use_token");
						sapjam.feedWidget.create(containerID, jamWidgetOptions);
					} else {
						MessageToast.show("Failed to bootstrap JAM feed.");
					}
				}.bind(this)).fail(function() {
					MessageToast.show("Failed to bootstrap JAM feed.");
				});
			}.bind(this)).fail(function() {
				MessageToast.show("Failed to get Jam access token.");
			});
		},

		getJamAccessToken: function() {
			var oDeferred = $.Deferred();
			$.ajax({
				url: "/html5apps/samplecollaboration/sap_jam_odata/v1/single_use_tokens",
				method: "POST",
				success: function(result) {
					var tokenNode = $(result).find("single_use_token");
					if (tokenNode) {
						var token = tokenNode.attr("id");
						oDeferred.resolve(token);
					} else {
						oDeferred.reject(result);
					}
				},
				error: function(error, e2, e3) {
					oDeferred.reject(e3);
				}
			});

			return oDeferred;
		},

		urlFormater: function(value) {
			// the value is the document ID
			if (value) {
				var configModel = new sap.ui.model.json.JSONModel();
				configModel.loadData("/html5apps/samplecollaboration/appstartui/configuration/configuration.json", null, false);
				var jamConfig = configModel.getData().SAPJamConfigurations;

				return jamConfig.jamBaseURL + "/groups/" + jamConfig.jamGroupID + "/documents/" + value;
			} else {
				return value;
			}
		},

		boostrapJam: function() {
			var oDeferred = $.Deferred();
			var configModel = new sap.ui.model.json.JSONModel();
			configModel.loadData("/html5apps/samplecollaboration/appstartui/configuration/configuration.json", null, false);
			var jamConfig = configModel.getData().SAPJamConfigurations;

			$.ajax({
				url: jamConfig.jamFeedBootstrapUrl,
				dataType: "script",
				async: false,
				success: function(result) {
					oDeferred.resolve(result);
				},
				error: function(error) {
					oDeferred.reject(error);
				}
			});
			return oDeferred;
		}

	});
});
