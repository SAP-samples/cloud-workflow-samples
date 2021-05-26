$.context.internal.step.isReapproval = true;

var decision = {
	"Id": $.usertasks.usertask2.last.processor,
	"Role": "Requester",
	"Decision": "Reworked",
	"Comments": $.context.comments
};

$.context.History.push(decision);
$.context.comments = "";