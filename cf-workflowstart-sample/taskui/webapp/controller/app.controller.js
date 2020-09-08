sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
	/**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("sap.demo.bpm.taskui.controller.app", {
            onInit: function () {
                var that = this;
                $.ajax({
                    url: "/sapdemobpmtaskui/NorthWind_Dest/V3/Northwind/Northwind.svc/Suppliers?$format=json",
                    method: "GET",
                    async: false,
                    success: function (result, xhr, data) {
                        var supplierData = data.responseJSON.value;
                        var existingData = that.getView().getModel();
                        existingData.oData.Suppliers = {};
                        existingData.oData.Suppliers = supplierData;
                        that.getView().setModel(existingData);
                    }
                });

            }
        });
    });
