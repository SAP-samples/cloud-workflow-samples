  var empJob = $.context.empData.d.results[0].empInfo.jobInfoNav.results[0];
  var empData = $.context.empData.d.results[0];

  /************ Prepare Input Payload to Execute Rules ****************/
  var employee = {};
  employee.countryOfCompany = "USA";
  employee.isFullTimeEmployee = empJob.isFulltimeEmployee;
  employee.company = empJob.company;
  employee.jobTitle = empJob.jobTitle;

  var Vocabulary = [{
  	"Employee": employee
  }];
  var rulesPayload = {
  	"RuleServiceId": "6bbd196d50c14b918d04c181e78d3a5b",
  	"RuleServiceVersion": "000001000000000000",
  	"Vocabulary": Vocabulary
  };
  $.context.rulesPayload = rulesPayload;

  /************ Enhance Workflow Context for additional attributes ****************/
  var attributes = {
  	username: empData.firstName + " " + empData.lastName,
  	division: empData.division,
  	city: empData.city,
  	country: empData.country,
  	jobCode: empData.jobCode,
  	jobTitle: empJob.jobTitle
  };
  $.context.empData.personalInfo = attributes;