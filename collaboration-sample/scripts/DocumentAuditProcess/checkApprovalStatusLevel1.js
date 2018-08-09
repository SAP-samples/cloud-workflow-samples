$.context.Document.levelOneStatus = $.context.Document.Reviewers.HeadOfBA.ApprovalStatus 
											&& $.context.Document.Reviewers.ExternalAuditors.ApprovalStatus 
											&& $.context.Document.Reviewers.Accounting.ApprovalStatus 
											&& $.context.Document.Reviewers.Tax.ApprovalStatus;
											
if ($.context.Document.levelOneStatus === true){
	$.context.Document.Status = "Functional Review Completed";
}
