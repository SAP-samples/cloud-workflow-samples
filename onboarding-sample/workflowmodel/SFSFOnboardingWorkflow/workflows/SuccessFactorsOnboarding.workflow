{
	"contents": {
		"f713430c-86b0-4600-b5ba-34cd9e9f5734": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "successfactorsonboarding",
			"subject": "Onboard newhire with ID ${context.userId}",
			"businessKey": "${context.userId}",
			"name": "SuccessFactorsOnboarding",
			"lastIds": "2fc67914-13bc-487d-ad50-c62d12bd7ace",
			"events": {
				"6862a179-e8ab-4e3c-907f-f71727fe4763": {
					"name": "New Hire"
				},
				"3c6ab758-55e0-4c9f-a493-9aef2af6c831": {
					"name": "End"
				},
				"c8bb1352-a22c-44cd-a2ad-ddfb28e0fa14": {
					"name": "Confirm Order"
				},
				"cf9b16f4-f199-4390-ab95-780448334ee5": {
					"name": "Escalation Timer"
				},
				"8c00f1ed-d844-4c3f-9692-f09aefded854": {
					"name": "EndEvent2"
				}
			},
			"activities": {
				"093c77d7-65c3-4033-a2f4-952f758e0e5f": {
					"name": "Get Employee Details from SAP SuccessFactors"
				},
				"c3c8d16e-0a78-4c71-b45b-3e080dba6eae": {
					"name": "Get Buddy from SFSF"
				},
				"fcdcd3f3-6704-4404-b7b3-87bf4e68b083": {
					"name": "Construct Rules Payload"
				},
				"a29654a9-81d1-4d88-9456-3b010d95ce10": {
					"name": "Determine Equipment"
				},
				"40cbf0d4-376d-443e-b000-dac5de20a7de": {
					"name": "Update Context"
				},
				"11e09a3c-0243-4aa7-b0e1-48c25b1e3041": {
					"name": "Change or Confirm Equipment"
				},
				"935829ac-6408-4430-a10e-334a3df3ebb9": {
					"name": "Approve Equipment"
				},
				"ae8c4a5f-9c63-4844-9af5-ea5b5afc4670": {
					"name": "Order Equipment"
				},
				"f4cfea4b-bda6-460a-ba86-367bfca1ea2e": {
					"name": "Accept Workplace for New Hire"
				},
				"ec942f2d-4518-4679-9ab4-996be0082459": {
					"name": "Process Buddy List"
				},
				"5b78988a-02c3-4a47-b0b5-ed626127add9": {
					"name": "Send Reminder Mail"
				}
			},
			"gateways": {
				"e3fa98d5-469c-4fee-b6c6-f15e3856d343": {
					"name": "Split Process"
				},
				"77eb5627-a8f2-48b4-ae30-3b8d10031f9c": {
					"name": "Merge Process"
				},
				"e39ebf42-c3e5-413b-9739-81eff090fa6a": {
					"name": "Is Approved?"
				}
			},
			"sequenceFlows": {
				"86d9d69e-1cee-408c-b7f7-6fc2fcd97a24": {
					"name": "SequenceFlow1"
				},
				"863965fb-cbde-41d6-8753-a90544dbe360": {
					"name": "SequenceFlow2"
				},
				"7cf46c49-e4df-472f-ab1d-7a4956fd3fed": {
					"name": "SequenceFlow3"
				},
				"20082615-4e63-4035-90cf-757e75a71d9e": {
					"name": "SequenceFlow6"
				},
				"5edd525b-597b-4822-ae87-3dc5608b25fb": {
					"name": "SequenceFlow7"
				},
				"2758582d-277a-4efe-be65-07d3d40ecb21": {
					"name": "SequenceFlow8"
				},
				"19995e3a-b6ef-417b-b45b-35064d3ae2ba": {
					"name": "SequenceFlow9"
				},
				"034b12fa-b190-4bf1-b74c-5ae996703a50": {
					"name": "SequenceFlow10"
				},
				"e3309d9c-6264-4ff4-aefb-fedcdbf2a2b1": {
					"name": "SequenceFlow12"
				},
				"95e76ff5-5900-40d2-bee5-07bd7d8e4800": {
					"name": "SequenceFlow13"
				},
				"7c12397f-faed-4e81-8464-b3987768aaf2": {
					"name": "SequenceFlow14"
				},
				"071ac756-e052-48d7-a386-774fac37143d": {
					"name": "Approved"
				},
				"81a9f712-e07d-431d-961d-69168bb104b9": {
					"name": "Rejected"
				},
				"445c6882-a4ab-4619-ba01-e7d4d4104258": {
					"name": "SequenceFlow18"
				},
				"63b786dc-c646-456a-9438-0f47d1f048e1": {
					"name": "SequenceFlow19"
				},
				"c5448e13-db28-4be0-89d9-ed2fc1b3e9fc": {
					"name": "SequenceFlow20"
				},
				"ab1047eb-83f0-4c86-bf3f-c17967fa3f16": {
					"name": "SequenceFlow21"
				},
				"21dd7b3d-e0c5-4439-b9be-676045dd32bf": {
					"name": "SequenceFlow22"
				},
				"e2487c87-334a-4933-acf8-76bae6cf3970": {
					"name": "SequenceFlow23"
				}
			},
			"diagrams": {
				"5619f8fc-735b-426f-ab8a-d4d37673f8ab": {}
			}
		},
		"6862a179-e8ab-4e3c-907f-f71727fe4763": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "New Hire",
			"sampleContextRefs": {
				"d8d6cb6b-7a82-45f0-b3c5-6c7b6540b71e": {}
			}
		},
		"3c6ab758-55e0-4c9f-a493-9aef2af6c831": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "End",
			"eventDefinitions": {
				"8619458b-81ab-444f-a4fd-f4759c3d848e": {}
			}
		},
		"c8bb1352-a22c-44cd-a2ad-ddfb28e0fa14": {
			"classDefinition": "com.sap.bpm.wfs.IntermediateCatchEvent",
			"id": "intermediatemessageevent1",
			"name": "Confirm Order",
			"documentation": "SAP S/4HANA sends a message back to SAP Cloud Platform that all the equipment has been received for the particular new hire.",
			"eventDefinitions": {
				"b46ec3c3-75ad-4010-8b86-0e67b38c6b38": {}
			}
		},
		"cf9b16f4-f199-4390-ab95-780448334ee5": {
			"classDefinition": "com.sap.bpm.wfs.BoundaryEvent",
			"isCanceling": false,
			"id": "boundarytimerevent1",
			"name": "Escalation Timer",
			"documentation": "If the buddy did not complete the task within one day, then a reminder email will be sent to the buddy and his manager.",
			"attachedToRef": "11e09a3c-0243-4aa7-b0e1-48c25b1e3041",
			"eventDefinitions": {
				"b3d7833a-192f-4d8e-aea8-ac119335a58e": {}
			}
		},
		"8c00f1ed-d844-4c3f-9692-f09aefded854": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "EndEvent2"
		},
		"093c77d7-65c3-4033-a2f4-952f758e0e5f": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SFSF",
			"path": "/odata/v2/User?$select=location,department,city,title,division,zipCode,userId,firstName,jobTitle,lastName,reloWilling,hireDate,addressLine1,reloLocation,country,keyPosition,jobCode,defaultFullName,empInfo/jobInfoNav/position,empInfo/jobInfoNav/startDate,empInfo/jobInfoNav/isFulltimeEmployee,empInfo/jobInfoNav/department,empInfo/jobInfoNav/division,empInfo/jobInfoNav/jobTitle,empInfo/jobInfoNav/countryOfCompany,empInfo/jobInfoNav/costCenter,empInfo/jobInfoNav/businessUnit,empInfo/jobInfoNav/managerId,empInfo/jobInfoNav/company,empInfo/jobInfoNav/jobCode&$filter=userId eq '${context.userId}'&$expand=empInfo/jobInfoNav&$format=json",
			"httpMethod": "GET",
			"responseVariable": "${context.empData}",
			"id": "servicetask1",
			"name": "Get Employee Details from SAP SuccessFactors",
			"apiReference": "efd71f63-2bee-45a9-9524-54c474c1533b"
		},
		"c3c8d16e-0a78-4c71-b45b-3e080dba6eae": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SFSF",
			"path": "/odata/v2/User('${context.empData.d.results[0].empInfo.jobInfoNav.results[0].managerId}')?$expand=directReports&$select=directReports/userId&$format=json",
			"httpMethod": "GET",
			"responseVariable": "${context.empData.team}",
			"id": "servicetask2",
			"name": "Get Buddy from SFSF",
			"documentation": "Get userId of all team members reporting to the same manager of new hire",
			"apiReference": "897ad61c-fd91-449d-8095-8865246cc20b"
		},
		"fcdcd3f3-6704-4404-b7b3-87bf4e68b083": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SuccessFactorsOnboarding/ConstructRulesPayload.js",
			"id": "scripttask1",
			"name": "Construct Rules Payload"
		},
		"a29654a9-81d1-4d88-9456-3b010d95ce10": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v1/rule-services/java/OnBoarding/DetermineEquipment",
			"httpMethod": "POST",
			"xsrfPath": "/v1/rules/xsrf-token",
			"requestVariable": "${context.empData.Employee}",
			"responseVariable": "${context.equipment.EquipmentInfo}",
			"id": "servicetask4",
			"name": "Determine Equipment",
			"documentation": "Determine the list of equipment to be assigned to the new hire based on its role",
			"apiReference": "a95c6643-e811-487f-8410-3c71f7f9b2c4"
		},
		"40cbf0d4-376d-443e-b000-dac5de20a7de": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SuccessFactorsOnboarding/UpdateContext.js",
			"id": "scripttask2",
			"name": "Update Context",
			"documentation": "Update the workflow context based on the result from Decision Table"
		},
		"11e09a3c-0243-4aa7-b0e1-48c25b1e3041": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Confirm or Change Equipment for ${context.empData.d.results[0].firstName} ${context.empData.d.results[0].lastName}",
			"description": "The buddy assigns appropriate equipment to the new hire based on the need for the job and the availability of equipment within the team",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/onboarding/confirmEquip/com.sap.cloud.workflow.samples.onbequip",
			"recipientUsers": "${context.empData.buddies}",
			"id": "usertask1",
			"name": "Change or Confirm Equipment",
			"documentation": "The buddy identifies the list of equipments which the new hire would need, considering the available inventory and profile of the new hire. ",
			"dueDateRef": "e542984f-9546-4006-95a6-e128a003b4d7"
		},
		"935829ac-6408-4430-a10e-334a3df3ebb9": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve Equipment for ${context.empData.d.results[0].firstName} ${context.empData.d.results[0].lastName}",
			"description": "The manager approves the equipment list proposed by the buddy",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/onboarding/approveEquip/com.sap.cloud.workflow.samples.onbapprove",
			"recipientUsers": "${context.empData.d.results[0].empInfo.jobInfoNav.results[0].managerId}",
			"id": "usertask2",
			"name": "Approve Equipment",
			"documentation": "The manager approves the equipment list proposed by the buddy",
			"dueDateRef": "336435ce-464f-4424-a96c-ab11204a18ac"
		},
		"ae8c4a5f-9c63-4844-9af5-ea5b5afc4670": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "SERVICE",
			"path": "/orderequipment",
			"httpMethod": "POST",
			"requestVariable": "${context.equipment.EquipmentsInfo}",
			"responseVariable": "${context.order.status}",
			"id": "servicetask5",
			"name": "Order Equipment",
			"documentation": "Call the S/4HANA procurement API to order the equipment required for the new hire"
		},
		"f4cfea4b-bda6-460a-ba86-367bfca1ea2e": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Accept Workplace for ${context.empData.d.results[0].firstName} ${context.empData.d.results[0].lastName}",
			"description": "The buddy should confirm that the workplace & equipments are ready before the new hire joins the organization.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/onboarding/acceptWorkplace/com.sap.cloud.workflow.samples.onbaccept",
			"recipientUsers": "${context.empData.buddies}",
			"id": "usertask3",
			"name": "Accept Workplace for New Hire",
			"documentation": "Confirm that all equipment for the new hire is ready and accept the workplace setup",
			"dueDateRef": "d4efe0c0-1c70-439f-ba61-60c10232da30"
		},
		"ec942f2d-4518-4679-9ab4-996be0082459": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/SuccessFactorsOnboarding/ProcessBuddyList.js",
			"id": "scripttask3",
			"name": "Process Buddy List",
			"documentation": "Process the result obtained from SuccessFactors and format it to be used as recipients of the user task "
		},
		"5b78988a-02c3-4a47-b0b5-ed626127add9": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"id": "mailtask1",
			"name": "Send Reminder Mail",
			"mailDefinitionRef": "b3cb7017-167b-4357-b1eb-7c7c07abca11"
		},
		"e3fa98d5-469c-4fee-b6c6-f15e3856d343": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway1",
			"name": "Split Process"
		},
		"77eb5627-a8f2-48b4-ae30-3b8d10031f9c": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway2",
			"name": "Merge Process"
		},
		"e39ebf42-c3e5-413b-9739-81eff090fa6a": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Is Approved?",
			"default": "071ac756-e052-48d7-a386-774fac37143d"
		},
		"86d9d69e-1cee-408c-b7f7-6fc2fcd97a24": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "6862a179-e8ab-4e3c-907f-f71727fe4763",
			"targetRef": "093c77d7-65c3-4033-a2f4-952f758e0e5f"
		},
		"863965fb-cbde-41d6-8753-a90544dbe360": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "093c77d7-65c3-4033-a2f4-952f758e0e5f",
			"targetRef": "e3fa98d5-469c-4fee-b6c6-f15e3856d343"
		},
		"7cf46c49-e4df-472f-ab1d-7a4956fd3fed": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "e3fa98d5-469c-4fee-b6c6-f15e3856d343",
			"targetRef": "fcdcd3f3-6704-4404-b7b3-87bf4e68b083"
		},
		"20082615-4e63-4035-90cf-757e75a71d9e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "e3fa98d5-469c-4fee-b6c6-f15e3856d343",
			"targetRef": "c3c8d16e-0a78-4c71-b45b-3e080dba6eae"
		},
		"5edd525b-597b-4822-ae87-3dc5608b25fb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "c3c8d16e-0a78-4c71-b45b-3e080dba6eae",
			"targetRef": "ec942f2d-4518-4679-9ab4-996be0082459"
		},
		"2758582d-277a-4efe-be65-07d3d40ecb21": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "fcdcd3f3-6704-4404-b7b3-87bf4e68b083",
			"targetRef": "a29654a9-81d1-4d88-9456-3b010d95ce10"
		},
		"19995e3a-b6ef-417b-b45b-35064d3ae2ba": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "a29654a9-81d1-4d88-9456-3b010d95ce10",
			"targetRef": "40cbf0d4-376d-443e-b000-dac5de20a7de"
		},
		"034b12fa-b190-4bf1-b74c-5ae996703a50": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "40cbf0d4-376d-443e-b000-dac5de20a7de",
			"targetRef": "77eb5627-a8f2-48b4-ae30-3b8d10031f9c"
		},
		"e3309d9c-6264-4ff4-aefb-fedcdbf2a2b1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "77eb5627-a8f2-48b4-ae30-3b8d10031f9c",
			"targetRef": "11e09a3c-0243-4aa7-b0e1-48c25b1e3041"
		},
		"95e76ff5-5900-40d2-bee5-07bd7d8e4800": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "11e09a3c-0243-4aa7-b0e1-48c25b1e3041",
			"targetRef": "935829ac-6408-4430-a10e-334a3df3ebb9"
		},
		"7c12397f-faed-4e81-8464-b3987768aaf2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow14",
			"name": "SequenceFlow14",
			"sourceRef": "935829ac-6408-4430-a10e-334a3df3ebb9",
			"targetRef": "e39ebf42-c3e5-413b-9739-81eff090fa6a"
		},
		"071ac756-e052-48d7-a386-774fac37143d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "Approved",
			"documentation": "Manager has accepted the equipment confirmed by the buddy",
			"sourceRef": "e39ebf42-c3e5-413b-9739-81eff090fa6a",
			"targetRef": "ae8c4a5f-9c63-4844-9af5-ea5b5afc4670"
		},
		"81a9f712-e07d-431d-961d-69168bb104b9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.equipApproved==\"false\"}",
			"id": "sequenceflow17",
			"name": "Rejected",
			"documentation": "Manager has rejected the equipment proposed by Buddy. Now the buddy will get the task back in his/her 'myinbox' to revisit the proposed equipment.",
			"sourceRef": "e39ebf42-c3e5-413b-9739-81eff090fa6a",
			"targetRef": "11e09a3c-0243-4aa7-b0e1-48c25b1e3041"
		},
		"445c6882-a4ab-4619-ba01-e7d4d4104258": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow18",
			"name": "SequenceFlow18",
			"sourceRef": "ae8c4a5f-9c63-4844-9af5-ea5b5afc4670",
			"targetRef": "c8bb1352-a22c-44cd-a2ad-ddfb28e0fa14"
		},
		"63b786dc-c646-456a-9438-0f47d1f048e1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow19",
			"name": "SequenceFlow19",
			"sourceRef": "c8bb1352-a22c-44cd-a2ad-ddfb28e0fa14",
			"targetRef": "f4cfea4b-bda6-460a-ba86-367bfca1ea2e"
		},
		"c5448e13-db28-4be0-89d9-ed2fc1b3e9fc": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow20",
			"name": "SequenceFlow20",
			"sourceRef": "f4cfea4b-bda6-460a-ba86-367bfca1ea2e",
			"targetRef": "3c6ab758-55e0-4c9f-a493-9aef2af6c831"
		},
		"ab1047eb-83f0-4c86-bf3f-c17967fa3f16": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow21",
			"name": "SequenceFlow21",
			"sourceRef": "ec942f2d-4518-4679-9ab4-996be0082459",
			"targetRef": "77eb5627-a8f2-48b4-ae30-3b8d10031f9c"
		},
		"21dd7b3d-e0c5-4439-b9be-676045dd32bf": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow22",
			"name": "SequenceFlow22",
			"sourceRef": "cf9b16f4-f199-4390-ab95-780448334ee5",
			"targetRef": "5b78988a-02c3-4a47-b0b5-ed626127add9"
		},
		"e2487c87-334a-4933-acf8-76bae6cf3970": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow23",
			"name": "SequenceFlow23",
			"sourceRef": "5b78988a-02c3-4a47-b0b5-ed626127add9",
			"targetRef": "8c00f1ed-d844-4c3f-9692-f09aefded854"
		},
		"5619f8fc-735b-426f-ab8a-d4d37673f8ab": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"332deb29-f7ee-44ff-a28f-b28e259cdc26": {},
				"32ceef8d-ce59-4f4a-ba21-83199abb704b": {},
				"961154ae-411a-42cb-be46-6e8b63389a63": {},
				"89725677-e240-4fd4-8441-313e48f610f7": {},
				"fd28e4ab-9ded-4205-b88d-ced781e0d526": {},
				"5551b66d-d206-46b6-b3ba-bfaa24aec0a7": {},
				"d4970921-c9e5-4c93-a243-4bd2ea5330d3": {},
				"a8c14c64-70f6-4137-aeaf-d1187a79e7fe": {},
				"07249981-ac44-47c3-8ce1-506d8bba12db": {},
				"5fc45f9d-95ca-465a-bef7-1c9a53b53331": {},
				"835b4167-0eb7-4c1b-8b7e-c89a4f10d2c0": {},
				"a77508d8-fd5c-4b3d-bf81-3d0a1649cc28": {},
				"96c7c7f9-3652-4078-9373-2d668e45bfbd": {},
				"84b1eea3-75b1-45e1-a60c-871985ff9106": {},
				"29a21e22-953d-4936-b233-c75be5102708": {},
				"1ef49941-8349-4d69-aaaa-199120e5fcef": {},
				"0f0c7837-f638-4cf2-9c37-3c7ad6938e15": {},
				"997dabc6-faf5-4cfd-9cbf-00581e30e635": {},
				"aca7cded-7673-4852-ab9e-097b5c0cf981": {},
				"f6f91ca9-d476-4f3d-a14b-e57e06f1d84d": {},
				"85601293-dc03-4c76-9efc-6899234330d9": {},
				"e12f25ee-1031-485b-aa03-79fa31597b0a": {},
				"7c39bff9-1417-4144-b889-54e3b6f7b862": {},
				"fb22f309-9187-4079-9fa7-e69d81571817": {},
				"d6449477-764b-4afc-9609-586bd9ab4a65": {},
				"c315fdc1-db5d-4dea-b22f-3687f3fa3804": {},
				"06caadc4-372f-416e-860c-eb50e89f70e2": {},
				"f90cc258-2151-46ba-8b92-159662d92a29": {},
				"43712246-ef60-49ca-bf5b-802b6ac2ec7c": {},
				"a2b4ebce-7c15-4518-899e-f1628caaf68f": {},
				"03c201fc-f88b-47f0-b476-4083fb88cf57": {},
				"8d54d4ec-d91c-41b7-b4fb-50240cf29bcf": {},
				"c6d7d3a8-237c-4953-9a3e-2f48f78353ea": {},
				"1c484956-ed5b-432f-861d-bc35bf4d8c21": {},
				"244fbf01-8398-4d0a-9508-8a5473ac5f96": {},
				"3bdd3066-375a-4ed0-be8d-6dd11d336327": {},
				"5238d68e-2421-48e9-96bd-a0b89782f24a": {}
			}
		},
		"d8d6cb6b-7a82-45f0-b3c5-6c7b6540b71e": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/SuccessFactorsOnboarding/InputPayload.json",
			"id": "default-start-context"
		},
		"8619458b-81ab-444f-a4fd-f4759c3d848e": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition1"
		},
		"b46ec3c3-75ad-4010-8b86-0e67b38c6b38": {
			"classDefinition": "com.sap.bpm.wfs.MessageEventDefinition",
			"responseVariable": "${context.orderconfirmation}",
			"id": "messageeventdefinition2",
			"messageRef": "8c3ffe2e-a7a4-4c89-bdb4-1d0f49eab95b"
		},
		"332deb29-f7ee-44ff-a28f-b28e259cdc26": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -302,
			"y": 233,
			"width": 32,
			"height": 32,
			"object": "6862a179-e8ab-4e3c-907f-f71727fe4763"
		},
		"32ceef8d-ce59-4f4a-ba21-83199abb704b": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1407,
			"y": 228,
			"width": 32,
			"height": 32,
			"object": "3c6ab758-55e0-4c9f-a493-9aef2af6c831"
		},
		"961154ae-411a-42cb-be46-6e8b63389a63": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-286,248.5 -158.75751940930866,248.5",
			"sourceSymbol": "332deb29-f7ee-44ff-a28f-b28e259cdc26",
			"targetSymbol": "89725677-e240-4fd4-8441-313e48f610f7",
			"object": "86d9d69e-1cee-408c-b7f7-6fc2fcd97a24"
		},
		"89725677-e240-4fd4-8441-313e48f610f7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": -217.00751940930866,
			"y": 220.5,
			"width": 116.5,
			"height": 55,
			"object": "093c77d7-65c3-4033-a2f4-952f758e0e5f"
		},
		"fd28e4ab-9ded-4205-b88d-ced781e0d526": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-158.75751940930866,246 -41.87787937930375,246",
			"sourceSymbol": "89725677-e240-4fd4-8441-313e48f610f7",
			"targetSymbol": "5551b66d-d206-46b6-b3ba-bfaa24aec0a7",
			"object": "863965fb-cbde-41d6-8753-a90544dbe360"
		},
		"5551b66d-d206-46b6-b3ba-bfaa24aec0a7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": -62.87787937930375,
			"y": 223,
			"object": "e3fa98d5-469c-4fee-b6c6-f15e3856d343"
		},
		"d4970921-c9e5-4c93-a243-4bd2ea5330d3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-41.87787937930375,244 25.982723236083984,244 25.982723236083984,308.75 122.84332656860352,308.75",
			"sourceSymbol": "5551b66d-d206-46b6-b3ba-bfaa24aec0a7",
			"targetSymbol": "07249981-ac44-47c3-8ce1-506d8bba12db",
			"object": "7cf46c49-e4df-472f-ab1d-7a4956fd3fed"
		},
		"a8c14c64-70f6-4137-aeaf-d1187a79e7fe": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 146.81453320262483,
			"y": 141,
			"width": 100,
			"height": 55,
			"object": "c3c8d16e-0a78-4c71-b45b-3e080dba6eae"
		},
		"07249981-ac44-47c3-8ce1-506d8bba12db": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 72.84332656860352,
			"y": 281.25,
			"width": 100,
			"height": 55,
			"object": "fcdcd3f3-6704-4404-b7b3-87bf4e68b083"
		},
		"5fc45f9d-95ca-465a-bef7-1c9a53b53331": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-41.87787937930375,244 25,244 25,168.5 196.8145294189453,168.5",
			"sourceSymbol": "5551b66d-d206-46b6-b3ba-bfaa24aec0a7",
			"targetSymbol": "a8c14c64-70f6-4137-aeaf-d1187a79e7fe",
			"object": "20082615-4e63-4035-90cf-757e75a71d9e"
		},
		"835b4167-0eb7-4c1b-8b7e-c89a4f10d2c0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "196.8145294189453,168.25 368,168.25",
			"sourceSymbol": "a8c14c64-70f6-4137-aeaf-d1187a79e7fe",
			"targetSymbol": "8d54d4ec-d91c-41b7-b4fb-50240cf29bcf",
			"object": "5edd525b-597b-4822-ae87-3dc5608b25fb"
		},
		"a77508d8-fd5c-4b3d-bf81-3d0a1649cc28": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 237.84332656860352,
			"y": 281.25,
			"width": 100,
			"height": 55,
			"object": "a29654a9-81d1-4d88-9456-3b010d95ce10"
		},
		"96c7c7f9-3652-4078-9373-2d668e45bfbd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "122.84332656860352,308.75 287.8433265686035,308.75",
			"sourceSymbol": "07249981-ac44-47c3-8ce1-506d8bba12db",
			"targetSymbol": "a77508d8-fd5c-4b3d-bf81-3d0a1649cc28",
			"object": "2758582d-277a-4efe-be65-07d3d40ecb21"
		},
		"84b1eea3-75b1-45e1-a60c-871985ff9106": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 397.8433265686035,
			"y": 281.25,
			"width": 100,
			"height": 55,
			"object": "40cbf0d4-376d-443e-b000-dac5de20a7de"
		},
		"29a21e22-953d-4936-b233-c75be5102708": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "287.8433265686035,308.75 447.8433265686035,308.75",
			"sourceSymbol": "a77508d8-fd5c-4b3d-bf81-3d0a1649cc28",
			"targetSymbol": "84b1eea3-75b1-45e1-a60c-871985ff9106",
			"object": "19995e3a-b6ef-417b-b45b-35064d3ae2ba"
		},
		"1ef49941-8349-4d69-aaaa-199120e5fcef": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 523.8433265686035,
			"y": 222.75,
			"object": "77eb5627-a8f2-48b4-ae30-3b8d10031f9c"
		},
		"0f0c7837-f638-4cf2-9c37-3c7ad6938e15": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "447.8433265686035,308.75 545,308.75 545,243.75",
			"sourceSymbol": "84b1eea3-75b1-45e1-a60c-871985ff9106",
			"targetSymbol": "1ef49941-8349-4d69-aaaa-199120e5fcef",
			"object": "034b12fa-b190-4bf1-b74c-5ae996703a50"
		},
		"997dabc6-faf5-4cfd-9cbf-00581e30e635": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 615.8433265686035,
			"y": 216.25,
			"width": 100,
			"height": 55,
			"object": "11e09a3c-0243-4aa7-b0e1-48c25b1e3041",
			"symbols": {
				"bd8d668c-aeca-4ceb-9848-feec2828d595": {}
			}
		},
		"aca7cded-7673-4852-ab9e-097b5c0cf981": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "544.8433265686035,243.75 665.8433265686035,243.75",
			"sourceSymbol": "1ef49941-8349-4d69-aaaa-199120e5fcef",
			"targetSymbol": "997dabc6-faf5-4cfd-9cbf-00581e30e635",
			"object": "e3309d9c-6264-4ff4-aefb-fedcdbf2a2b1"
		},
		"f6f91ca9-d476-4f3d-a14b-e57e06f1d84d": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 765.8433265686035,
			"y": 216.25,
			"width": 100,
			"height": 55,
			"object": "935829ac-6408-4430-a10e-334a3df3ebb9"
		},
		"85601293-dc03-4c76-9efc-6899234330d9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "665.8433265686035,243.75 815.8433265686035,243.75",
			"sourceSymbol": "997dabc6-faf5-4cfd-9cbf-00581e30e635",
			"targetSymbol": "f6f91ca9-d476-4f3d-a14b-e57e06f1d84d",
			"object": "95e76ff5-5900-40d2-bee5-07bd7d8e4800"
		},
		"e12f25ee-1031-485b-aa03-79fa31597b0a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 914.8433265686035,
			"y": 222.75,
			"object": "e39ebf42-c3e5-413b-9739-81eff090fa6a"
		},
		"7c39bff9-1417-4144-b889-54e3b6f7b862": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "815.8433265686035,243.75 935.8433265686035,243.75",
			"sourceSymbol": "f6f91ca9-d476-4f3d-a14b-e57e06f1d84d",
			"targetSymbol": "e12f25ee-1031-485b-aa03-79fa31597b0a",
			"object": "7c12397f-faed-4e81-8464-b3987768aaf2"
		},
		"fb22f309-9187-4079-9fa7-e69d81571817": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "935.8433227539062,244.625 1068.9216613769531,244.625",
			"sourceSymbol": "e12f25ee-1031-485b-aa03-79fa31597b0a",
			"targetSymbol": "d6449477-764b-4afc-9609-586bd9ab4a65",
			"object": "071ac756-e052-48d7-a386-774fac37143d"
		},
		"d6449477-764b-4afc-9609-586bd9ab4a65": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1018.9216613769531,
			"y": 216.75,
			"width": 100,
			"height": 55,
			"object": "ae8c4a5f-9c63-4844-9af5-ea5b5afc4670"
		},
		"c315fdc1-db5d-4dea-b22f-3687f3fa3804": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "935,243.75 935,322.25 665.9999981861489,322.250000011719 666.0000020008462,271.250000011719",
			"sourceSymbol": "e12f25ee-1031-485b-aa03-79fa31597b0a",
			"targetSymbol": "997dabc6-faf5-4cfd-9cbf-00581e30e635",
			"object": "81a9f712-e07d-431d-961d-69168bb104b9"
		},
		"06caadc4-372f-416e-860c-eb50e89f70e2": {
			"classDefinition": "com.sap.bpm.wfs.ui.IntermediateCatchEventSymbol",
			"x": 1178,
			"y": 228,
			"width": 32,
			"height": 32,
			"object": "c8bb1352-a22c-44cd-a2ad-ddfb28e0fa14"
		},
		"f90cc258-2151-46ba-8b92-159662d92a29": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1068.9216613769531,244.25 1187,244.25",
			"sourceSymbol": "d6449477-764b-4afc-9609-586bd9ab4a65",
			"targetSymbol": "06caadc4-372f-416e-860c-eb50e89f70e2",
			"object": "445c6882-a4ab-4619-ba01-e7d4d4104258"
		},
		"43712246-ef60-49ca-bf5b-802b6ac2ec7c": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1263,
			"y": 216.5,
			"width": 100,
			"height": 55,
			"object": "f4cfea4b-bda6-460a-ba86-367bfca1ea2e"
		},
		"a2b4ebce-7c15-4518-899e-f1628caaf68f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1194,244 1313,244",
			"sourceSymbol": "06caadc4-372f-416e-860c-eb50e89f70e2",
			"targetSymbol": "43712246-ef60-49ca-bf5b-802b6ac2ec7c",
			"object": "63b786dc-c646-456a-9438-0f47d1f048e1"
		},
		"03c201fc-f88b-47f0-b476-4083fb88cf57": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1313,244 1429,244",
			"sourceSymbol": "43712246-ef60-49ca-bf5b-802b6ac2ec7c",
			"targetSymbol": "32ceef8d-ce59-4f4a-ba21-83199abb704b",
			"object": "c5448e13-db28-4be0-89d9-ed2fc1b3e9fc"
		},
		"8d54d4ec-d91c-41b7-b4fb-50240cf29bcf": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 318,
			"y": 140.5,
			"width": 100,
			"height": 55,
			"object": "ec942f2d-4518-4679-9ab4-996be0082459"
		},
		"c6d7d3a8-237c-4953-9a3e-2f48f78353ea": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "368,168 545,168 545,243.75",
			"sourceSymbol": "8d54d4ec-d91c-41b7-b4fb-50240cf29bcf",
			"targetSymbol": "1ef49941-8349-4d69-aaaa-199120e5fcef",
			"object": "ab1047eb-83f0-4c86-bf3f-c17967fa3f16"
		},
		"1c484956-ed5b-432f-861d-bc35bf4d8c21": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 615.8433265686035,
			"y": 69.25,
			"width": 100,
			"height": 60,
			"object": "5b78988a-02c3-4a47-b0b5-ed626127add9"
		},
		"244fbf01-8398-4d0a-9508-8a5473ac5f96": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "665.8433265686035,200.25 665.8433265686035,99.25",
			"sourceSymbol": "bd8d668c-aeca-4ceb-9848-feec2828d595",
			"targetSymbol": "1c484956-ed5b-432f-861d-bc35bf4d8c21",
			"object": "21dd7b3d-e0c5-4439-b9be-676045dd32bf"
		},
		"3bdd3066-375a-4ed0-be8d-6dd11d336327": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 765.8433265686035,
			"y": 83.25,
			"width": 32,
			"height": 32,
			"object": "8c00f1ed-d844-4c3f-9692-f09aefded854"
		},
		"5238d68e-2421-48e9-96bd-a0b89782f24a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "665.8433265686035,99.25 781.8433265686035,99.25",
			"sourceSymbol": "1c484956-ed5b-432f-861d-bc35bf4d8c21",
			"targetSymbol": "3bdd3066-375a-4ed0-be8d-6dd11d336327",
			"object": "e2487c87-334a-4933-acf8-76bae6cf3970"
		},
		"bd8d668c-aeca-4ceb-9848-feec2828d595": {
			"classDefinition": "com.sap.bpm.wfs.ui.BoundaryEventSymbol",
			"x": 649.8433265686035,
			"y": 200.25,
			"object": "cf9b16f4-f199-4390-ab95-780448334ee5"
		},
		"2fc67914-13bc-487d-ad50-c62d12bd7ace": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 1,
			"messageeventdefinition": 2,
			"message": 1,
			"timereventdefinition": 4,
			"maildefinition": 1,
			"hubapireference": 3,
			"sequenceflow": 23,
			"startevent": 1,
			"intermediatemessageevent": 1,
			"boundarytimerevent": 1,
			"endevent": 2,
			"usertask": 3,
			"servicetask": 5,
			"scripttask": 3,
			"mailtask": 1,
			"exclusivegateway": 1,
			"parallelgateway": 2
		},
		"8c3ffe2e-a7a4-4c89-bdb4-1d0f49eab95b": {
			"classDefinition": "com.sap.bpm.wfs.Message",
			"name": "OrderConfirmationmsg",
			"id": "message1"
		},
		"efd71f63-2bee-45a9-9524-54c474c1533b": {
			"classDefinition": "com.sap.bpm.wfs.HubAPIReference",
			"apiPackage": "SuccessFactorsFoundationPlatform",
			"api": "PLTUserManagement",
			"apiName": "User Management",
			"id": "hubapireference1"
		},
		"897ad61c-fd91-449d-8095-8865246cc20b": {
			"classDefinition": "com.sap.bpm.wfs.HubAPIReference",
			"apiPackage": "SuccessFactorsFoundationPlatform",
			"api": "PLTUserManagement",
			"apiName": "User Management",
			"id": "hubapireference2"
		},
		"a95c6643-e811-487f-8410-3c71f7f9b2c4": {
			"classDefinition": "com.sap.bpm.wfs.HubAPIReference",
			"apiPackage": "SAPCPBusinessRulesAPIs",
			"api": "SAP_CP_BusinessRules_Runtime",
			"apiName": "SAP Cloud Platform Business Rules Execution API",
			"id": "hubapireference3"
		},
		"b3d7833a-192f-4d8e-aea8-ac119335a58e": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P1D",
			"id": "timereventdefinition1"
		},
		"b3cb7017-167b-4357-b1eb-7c7c07abca11": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "seshadri.sreenivas.r@sap.com",
			"cc": "manager@saptest.com",
			"subject": "Change or Confirm Task Due Date has reached",
			"reference": "/webcontent/SuccessFactorsOnboarding/ReminderEmailTemplate.html",
			"id": "maildefinition1"
		},
		"e542984f-9546-4006-95a6-e128a003b4d7": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P1D",
			"id": "timereventdefinition2"
		},
		"336435ce-464f-4424-a96c-ab11204a18ac": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P2D",
			"id": "timereventdefinition3"
		},
		"d4efe0c0-1c70-439f-ba61-60c10232da30": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "PT12H",
			"id": "timereventdefinition4"
		}
	}
}