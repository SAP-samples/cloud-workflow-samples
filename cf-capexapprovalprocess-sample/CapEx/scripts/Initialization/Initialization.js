var isRestarted = $.context.isRestarted ? true : false;
$.context.isRestarted = isRestarted;
if (!isRestarted) {
    $.context.createdDate = new Date().toISOString();
    $.context.History = [];
}

$.context.workflowTerminated = false;
$.context.internal = {
    approvalStatus: "Running",
    workflowTerminated: false,
    mail: {},
    step: {
        isReapproval: false,
    }
}

