/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"com/sap/aif/AIFAlertUI/test/integration/AllJourneys"
	], function () {
		QUnit.start();
	});
});