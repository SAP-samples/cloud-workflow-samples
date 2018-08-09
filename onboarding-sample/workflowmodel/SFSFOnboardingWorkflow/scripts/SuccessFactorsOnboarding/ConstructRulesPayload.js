var employee = {};

var empJob = $.context.empData.d.results[0].empInfo.jobInfoNav.results[0];

employee.__type__=  "Employee";
employee.isFulltimeEmployee = empJob.isFulltimeEmployee;
employee.countryOfCompany = empJob.countryOfCompany;
employee.company = empJob.company;
employee.jobTitle = empJob.jobTitle;

$.context.empData.Employee = employee;