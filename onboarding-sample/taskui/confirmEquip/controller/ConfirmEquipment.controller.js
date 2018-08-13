sap.ui.define(["sap/m/MessageToast",
	"sap/ui/core/mvc/Controller"
], function(MessageToast, Controller) {
	"use strict";

	return Controller.extend("com.sap.cloud.workflow.samples.onbequip.controller.ConfirmEquipment", {
		
		onAddEquipment: function(oEvent) {
			if (!this.oDialog) {
				this.oDialog = sap.ui.xmlfragment("com.sap.cloud.workflow.samples.onbequip.view.NewEquipment", this);
				this.getView().addDependent(this.oDialog);
			}

			// toggle compact style for the dialog
			jQuery.sap.syncStyleClass("sapUiSizeCompact", this.getView(), this.oDialog);

			var oModel = oEvent.getSource().getModel();
			var data = oModel.getData();

			if (data.newEquipment.EquipmentType === "") {
				data.newEquipment.EquipmentType = data.products.equipmentTypes[0].text;
				data.newEquipment.ProdDesc = data.products.equipmentForTypeNot[0].text;
				data.newEquipment.RequestedLoc = data.products.deliveryLocations[0].text;
			}

			oModel.setData(data);
			this.oDialog.open();
		},
		onTypeSelChange: function(oevt) {
			var selItem = oevt.getParameters().selectedItem.getText();
			var data = oevt.getSource().getModel().getData();

			data.newEquipment.EquipmentType = selItem;

			if (selItem === "Notebook") {
				data.products.equipmentForType = data.products.equipmentForTypeNot;
				data.newEquipment.ProdDesc = data.products.equipmentForTypeNot[0].text;
			} else if (selItem === "Cables and Accessories") {
				data.products.equipmentForType = data.products.equipmentForTypeCbl;
				data.newEquipment.ProdDesc = data.products.equipmentForTypeCbl[0].text;
			} else if (selItem === "Monitor") {
				data.products.equipmentForType = data.products.equipmentForTypeMon;
				data.newEquipment.ProdDesc = data.products.equipmentForTypeMon[0].text;
			} else if (selItem === "Audio and Video") {
				data.products.equipmentForType = data.products.equipmentForTypeAaV;
				data.newEquipment.ProdDesc = data.products.equipmentForTypeAaV[0].text;
			} else if (selItem === "Smartphone") {
				data.products.equipmentForType = data.products.equipmentForTypeMob;
				data.newEquipment.ProdDesc = data.products.equipmentForTypeMob[0].text;
			} else {
				data.products.equipmentForType = data.products.equipmentForTypeOth;
				data.newEquipment.ProdDesc = data.products.equipmentForTypeOth[0].text;
			}

			data.newEquipment.EquipmentType = selItem;
			oevt.getSource().getModel().setData(data);
		},
		onLocSelChange: function(oevt) {
			var data = oevt.getSource().getModel().getData();
			data.newEquipment.RequestedLoc = oevt.getParameters().selectedItem.getText();
		},
		onEquipSelChange: function(oevt) {
			var data = oevt.getSource().getModel().getData();
			data.newEquipment.ProdDesc = oevt.getParameters().selectedItem.getText();
		},
		onCancelEquipment: function(oEvt) {
			this.oDialog.close();
		},
		deleteRow: function(oEvt) {
			var path = oEvt.getParameter("listItem").getBindingContext().getPath();
			// radix paramter to parseint into decimal and not octal :)
			var indexToRemove = parseInt(path.substring(path.lastIndexOf("/") + 1 ), 10);
			var oModel = oEvt.getSource().getModel();
			var data = oModel.getData();
			data.equipment.EquipmentsInfo.splice(indexToRemove, 1);
			oModel.setData(data);

			MessageToast.show("Item Removed");
		},
		onSaveEquipment: function(oEvent) {
			var oModel = oEvent.getSource().getModel();
			var data = oModel.getData();

			var ProdDesc = data.newEquipment.ProdDesc;
			var RequestedLoc = data.newEquipment.RequestedLoc;
			var EquipmentType;
			var Price;
			var Currency = data.newEquipment.Currency;
			var ProductID;
			var equipList = data.products.equipmentList;

			for (var i in equipList) {
				if (equipList[i].ProdDesc === ProdDesc) {
					EquipmentType = equipList[i].EquipmentType;
					Price = equipList[i].Price;
					ProductID = equipList[i].ProductID;
				}
			}
			var newItem = {
				Status: "New",
				RequestedLoc: RequestedLoc,
				Price: Price,
				ProdDesc: ProdDesc,
				Currency: Currency,
				ProductID: ProductID,
				EquipmentType: EquipmentType,
				ExpectedDate:""
			};

			if (typeof(data.equipment.EquipmentsInfo) === "undefined") {
				data.equipment.EquipmentsInfo = [];
			}
			data.equipment.EquipmentsInfo.push(newItem);
			oModel.setData(data);
			oModel.refresh(true);
			this.oDialog.close();
		}

	});
});




