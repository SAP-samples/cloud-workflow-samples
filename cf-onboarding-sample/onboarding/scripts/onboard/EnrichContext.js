  var EquipmentInfo = $.context.equipment.EquipmentsInfo.Result[0].EquipmentList;
  var EquipInfo = [];
  var equip = {};
  if (EquipmentInfo.length > 0) {
  	for (var i = 0; i < EquipmentInfo.length; i++) {
  		equip = EquipmentInfo[i];
  		equip.ProdDesc = equip.ProductDesc;
  		equip.Status = "New";
  		equip.ExpectedDate = "";
  		equip.RequestedLoc = "Building 01";
  		equip.CostCenter = $.context.empData.d.results[0].empInfo.jobInfoNav.results[0].costCenter;
  		EquipInfo.push(equip);
  	}
  }else {
  	equip = EquipmentInfo;
  	equip.ProdDesc = equip.ProductDesc;
  	equip.Status = "New";
  	equip.ExpectedDate = "";
  	equip.RequestedLoc = "Building 01";
  	equip.CostCenter = $.context.empData.d.results[0].empInfo.jobInfoNav.results[0].costCenter;
  	EquipInfo.push(equip);
  }
  $.context.equipment.EquipmentsInfo = EquipInfo;