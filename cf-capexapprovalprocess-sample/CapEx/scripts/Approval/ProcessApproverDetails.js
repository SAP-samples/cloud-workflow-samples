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
		"Role": "###role###",
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

    // calculate due date
    var dueDuration = $.context.internal.step.approver.DueDuration;
    var dueDurationReference = $.context.internal.step.approver.DueDurationReference;
    if (isNaN(dueDuration) || dueDuration < 0) {
        throw new Error("Value for DueDuration returned from rule needs to be a positive number, but was " + dueDuration);
    }

    var rel = 0;
    if (dueDurationReference == 'Workflow') {
        rel = new Date() - new Date($.context.createdDate);
    } else if (dueDurationReference == 'Step') {
        rel = new Date() - new Date($.context.internal.step.createdDate);
    } else if (dueDurationReference != 'Task') {
        throw new Error("Value for DueDurationReference returned from rule needs to be one of 'Workflow', 'Step' or 'Task', but was " + dueDurationReference);
    }

    var minutes = Math.max(0, Math.round(dueDuration * 24 * 60));
    rel = Math.max(0, Math.floor(rel / 60 / 1000)); // convert already passed time to minutes (no fractions, and if it's already in the past: zero)
    $.context.rel = rel;
    minutes -= rel;

    if (isNaN(minutes)) {
        throw new Error("Internal error calculating Due Date");
    }
    $.context.internal.step.dueDuration = "PT" + minutes + "M"; // minutes may be >60 according to the standard

    // Prepare User Task
    $.context.comments = "";
    $.context.requireFullReapproval = false;

    // override rule for dev/demo
    if ($.context.isTesting) {
        $.context.internal.step.approver.Email = $.context.internal.testing.overrideApproverEmail;
        $.context.internal.step.approver.UserId = $.context.internal.testing.overrideApproverUserId;
        $.context.internal.step.approver.GroupId = $.context.internal.testing.overrideApproverGroupId;
    }
}