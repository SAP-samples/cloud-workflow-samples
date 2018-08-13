$.context.Document.levelTwoStatus = $.context.Document.Approvers.ExternalAuditHeads.ApprovalStatus 
									&& $.context.Document.Approvers.HeadOfGroupReporting.ApprovalStatus;
												
if ($.context.Document.levelTwoStatus === true) {
	$.context.Document.Status = "Final Sign-Off";
}

// set business rules context
$.context.WorkflowDetails = {};
$.context.WorkflowDetails.__type__ = "WorkflowDetails";
$.context.WorkflowDetails.definitionID = "auditreviewprocess";
$.context.WorkflowDetails.sequenceNumber = "";