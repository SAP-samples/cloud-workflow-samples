$.context.internal.step.isRequired = false;
var approverUserIDs = [];
var approverGroupIDs = [];
var approverEmailIDs = [];
var ruleResult = $.context.internal.ruleresult.Result;

if (ruleResult.length > 0 && ruleResult[0].ApproversList.length) {
    $.context.internal.step.approver = $.context.internal.ruleresult.Result[0].ApproversList[0];
	$.context.internal.step.isRequired = $.context.internal.step.approver.ApprovalRequired;
    for (var i = 0; i < ruleResult[0].ApproversList.length; i++) { 
        approverUserIDs.push(ruleResult[0].ApproversList[i].UserId);
        approverGroupIDs.push(ruleResult[0].ApproversList[i].GroupId);
        approverEmailIDs.push(ruleResult[0].ApproversList[i].Email);
    }
    $.context.internal.step.approver.UserId = approverUserIDs.toString();
    $.context.internal.step.approver.GroupId = approverGroupIDs.toString();
    $.context.internal.step.approver.Email = approverEmailIDs.toString();

}

// sanitize rule result
if (!$.context.internal.step.isRequired) {
	var decision = {
		"Id": "-",
		"Role": $.context.role,
		"Decision": "Approve",
		"Comments": "Automatic approval by rule"
	};
    $.context.History.push(decision);
    $.context.internal.step.isReapproval = false;
} else {
   if (!$.context.internal.step.isReapproval) {
        $.context.internal.step.createdDate = new Date().toISOString();
    }
    $.context.internal.step.isReapproval = false;

}

// Prepare User Task
$.context.comments = "";
$.context.requireFullReapproval = false;
