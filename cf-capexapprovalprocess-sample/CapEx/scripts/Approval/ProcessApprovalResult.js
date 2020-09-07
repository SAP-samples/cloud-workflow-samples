var task = $.usertasks['###activity.id:usertask1###'].last;

$.context.internal.step.lastDecision = task.decision;


var decision = {
	"Id": task.processor,
	"Role": "###role###",
	"Decision": task.decision,
	"Comments": $.context.comments
};
$.context.lastComment = $.context.comments;
$.context.lastApprover = task.processor;

$.context.History.push(decision);
$.context.comments = "";


if (task.decision == "rework") {
    $.context.internal.step.isReapproval = true;
} else if (task.decision !== "approve") {
	$.context.internal.approvalStatus = "Rejected";
	$.context.internal.workflowTerminated = true;
}