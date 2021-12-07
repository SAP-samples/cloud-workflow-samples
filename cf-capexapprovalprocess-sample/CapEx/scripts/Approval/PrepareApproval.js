/************ Initialize the model, if not done ****************/
if($.context.approvalstep == null){
    $.context.approvalstep = "LocalManager",
    $.context.History = [];
    $.context.internal = {};
    $.context.internal.step = {};
}

/************ Prepare Input Payload to Execute Rules ****************/
var details = {
	"ApprovalStep": $.context.approvalstep,
	"BusinessUnit": $.context.Investment.BusinessUnit,
	"Country": $.context.Investment.Country,
	"Type": $.context.Investment.Type,
	"TotalCost": $.context.Investment.TotalCost
};

var rulesPayload = {
	"RuleServiceId": "a37df8246b2048dfba6f07c46e6ed25f",
	"RuleServiceRevision": "Trial",
	"Vocabulary": [ { "Investment": details } ]
};

$.context.internal.rulesPayload = rulesPayload;
