/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"com/sap/aif/AIFAlertUI/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});