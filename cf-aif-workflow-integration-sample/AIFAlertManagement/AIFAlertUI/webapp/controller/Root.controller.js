sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("com.sap.aif.AIFAlertUI.controller.Root", {
		onInit: function () {

		},
		getTable: function () {
			return this.byId("tApplog");
		}
	});
});