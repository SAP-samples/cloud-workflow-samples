/************ Prepare Input Payload to Execute Rules ****************/
var details = {
	"ApprovalStep": "###approvalstep###",
	"BusinessUnit": $.context.Investment.BusinessUnit,
	"Country": $.context.Investment.Country,
	"Type": $.context.Investment.Type,
	"TotalCost": $.context.Investment.TotalCost
};

var rulesPayload = {
	"RuleServiceId": "c814bc4040ac4d27aee4b69e3ca63568",
	"RuleServiceRevision": "2006",
	"Vocabulary": [ { "Investment": details } ]
};

$.context.internal.rulesPayload = rulesPayload;
