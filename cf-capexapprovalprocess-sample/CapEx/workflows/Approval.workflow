{
	"contents": {
		"7baf2a05-8c00-49dd-98c9-bd2ed936963f": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "approval",
			"subject": "Approval",
			"name": "Approval",
			"documentation": "Approval",
			"lastIds": "d959b42d-4043-442a-8f94-53ca9dcf6629",
			"events": {
				"1d2cd879-15b6-4d4a-9d21-516a5d7622ec": {
					"name": "Start Approval Step"
				},
				"7492ee08-9d0c-4c71-98bd-c0051cb7a87d": {
					"name": "End Approval Step"
				},
				"bf410f97-3b06-40b2-b784-c60ece7dd59b": {
					"name": "Terminate Approval"
				}
			},
			"activities": {
				"dd2a022d-a850-4e4f-bb68-ff18e429de9c": {
					"name": "Prepare Approval"
				},
				"8940263f-1349-44e3-84e2-6a33dac30152": {
					"name": "Get Approvers"
				},
				"bdc7de35-306a-4af5-a618-b4f8786e6a1e": {
					"name": "Process Approver Details"
				},
				"9d451043-0faa-468a-b136-f7f17cb5431d": {
					"name": "Approval Needed?"
				},
				"56a8ecd6-09b4-4e52-b025-3e0168119934": {
					"name": "Approval Task"
				},
				"c4a3a624-ae8b-4479-970f-d1d66d019289": {
					"name": "Process Approval Result"
				},
				"b4b4c653-cc9d-4ce5-be6c-466c4f127380": {
					"name": "Approval Decision"
				},
				"d811805c-8fa4-4bf2-83ae-651417bf3094": {
					"name": "Rework Approval Request "
				},
				"de2f9152-8b21-407b-a8e5-d19ce38aa5b6": {
					"name": "Handle Rework "
				}
			},
			"sequenceFlows": {
				"f995d165-b5f6-4b24-9366-0e0c58526ee6": {
					"name": "SequenceFlow1"
				},
				"a30e1a30-7530-479d-9930-dbff948ea105": {
					"name": "SequenceFlow2"
				},
				"5c105fea-2916-4f66-99a6-aaea610dfc5b": {
					"name": "SequenceFlow3"
				},
				"6d686eea-8b69-4340-8057-01415f3c4a22": {
					"name": "SequenceFlow4"
				},
				"61bfc56e-70a9-45d6-ae86-3015a15ad128": {
					"name": "Yes"
				},
				"41af9af9-921c-45f8-b1db-12499edc5845": {
					"name": "SequenceFlow8"
				},
				"70818827-e517-495c-a334-2a196afa5b61": {
					"name": "No"
				},
				"8e287fd7-0873-4b8a-83cd-ac97c3c3340a": {
					"name": "SequenceFlow13"
				},
				"d8caac43-aed6-47c7-9969-2c1bbf710898": {
					"name": "Accepted"
				},
				"a8728199-44a2-40a9-8a98-47faa88cb511": {
					"name": "Rejected"
				},
				"5fe5f5af-f9e3-48cb-8f04-16a120f88cb3": {
					"name": "Rework"
				},
				"5a984f1e-fc1d-4cdb-aee5-6c52f2157832": {
					"name": "SequenceFlow17"
				},
				"586aab06-933c-4d01-aede-590424e1bfd8": {
					"name": "SequenceFlow18"
				}
			},
			"diagrams": {
				"ef06f96c-ae3a-4b66-9383-f490a6ddadbb": {}
			}
		},
		"1d2cd879-15b6-4d4a-9d21-516a5d7622ec": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Start Approval Step"
		},
		"7492ee08-9d0c-4c71-98bd-c0051cb7a87d": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "End Approval Step"
		},
		"bf410f97-3b06-40b2-b784-c60ece7dd59b": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "Terminate Approval",
			"eventDefinitions": {
				"40e1a1d7-db4a-40bd-ae4d-c7f7427ba698": {}
			}
		},
		"dd2a022d-a850-4e4f-bb68-ff18e429de9c": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Approval/PrepareApproval.js",
			"id": "scripttask1",
			"name": "Prepare Approval"
		},
		"8940263f-1349-44e3-84e2-6a33dac30152": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"path": "/rest/v2/rule-services ",
			"httpMethod": "POST",
			"requestVariable": "${context.internal.rulesPayload}",
			"responseVariable": "${context.internal.ruleresult}",
			"id": "servicetask1",
			"name": "Get Approvers"
		},
		"bdc7de35-306a-4af5-a618-b4f8786e6a1e": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Approval/ProcessApproverDetails.js",
			"id": "scripttask2",
			"name": "Process Approver Details"
		},
		"9d451043-0faa-468a-b136-f7f17cb5431d": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Approval Needed?",
			"default": "70818827-e517-495c-a334-2a196afa5b61"
		},
		"56a8ecd6-09b4-4e52-b025-3e0168119934": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approval for Capital Expenditure Request \"${context.Title}\" in your role as ${context.role}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.internal.step.approver.UserId}, ${info.startedBy}, ${context.Requester.UserId}",
			"recipientGroups": "${context.internal.step.approver.GroupId}",
			"formReference": "/forms/Approval/ApprovalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Approval Task"
		},
		"c4a3a624-ae8b-4479-970f-d1d66d019289": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Approval/ProcessApprovalResult.js",
			"id": "scripttask3",
			"name": "Process Approval Result"
		},
		"b4b4c653-cc9d-4ce5-be6c-466c4f127380": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "Approval Decision",
			"default": "a8728199-44a2-40a9-8a98-47faa88cb511"
		},
		"d811805c-8fa4-4bf2-83ae-651417bf3094": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Rework required for CapEx Request ${context.Title}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.Requester.UserId}, ${info.startedBy}, ${context.Requester.UserId}",
			"formReference": "/forms/Approval/ReworkApprovalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "reworkapprovalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask2",
			"name": "Rework Approval Request "
		},
		"de2f9152-8b21-407b-a8e5-d19ce38aa5b6": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Approval/HandleRework.js",
			"id": "scripttask4",
			"name": "Handle Rework "
		},
		"f995d165-b5f6-4b24-9366-0e0c58526ee6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "1d2cd879-15b6-4d4a-9d21-516a5d7622ec",
			"targetRef": "dd2a022d-a850-4e4f-bb68-ff18e429de9c"
		},
		"a30e1a30-7530-479d-9930-dbff948ea105": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "dd2a022d-a850-4e4f-bb68-ff18e429de9c",
			"targetRef": "8940263f-1349-44e3-84e2-6a33dac30152"
		},
		"5c105fea-2916-4f66-99a6-aaea610dfc5b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "8940263f-1349-44e3-84e2-6a33dac30152",
			"targetRef": "bdc7de35-306a-4af5-a618-b4f8786e6a1e"
		},
		"6d686eea-8b69-4340-8057-01415f3c4a22": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "bdc7de35-306a-4af5-a618-b4f8786e6a1e",
			"targetRef": "9d451043-0faa-468a-b136-f7f17cb5431d"
		},
		"61bfc56e-70a9-45d6-ae86-3015a15ad128": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.internal.step.isRequired}",
			"id": "sequenceflow6",
			"name": "Yes",
			"sourceRef": "9d451043-0faa-468a-b136-f7f17cb5431d",
			"targetRef": "56a8ecd6-09b4-4e52-b025-3e0168119934"
		},
		"41af9af9-921c-45f8-b1db-12499edc5845": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "56a8ecd6-09b4-4e52-b025-3e0168119934",
			"targetRef": "c4a3a624-ae8b-4479-970f-d1d66d019289"
		},
		"70818827-e517-495c-a334-2a196afa5b61": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "No",
			"sourceRef": "9d451043-0faa-468a-b136-f7f17cb5431d",
			"targetRef": "7492ee08-9d0c-4c71-98bd-c0051cb7a87d"
		},
		"8e287fd7-0873-4b8a-83cd-ac97c3c3340a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "c4a3a624-ae8b-4479-970f-d1d66d019289",
			"targetRef": "b4b4c653-cc9d-4ce5-be6c-466c4f127380"
		},
		"d8caac43-aed6-47c7-9969-2c1bbf710898": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"approve\"}",
			"id": "sequenceflow14",
			"name": "Accepted",
			"sourceRef": "b4b4c653-cc9d-4ce5-be6c-466c4f127380",
			"targetRef": "7492ee08-9d0c-4c71-98bd-c0051cb7a87d"
		},
		"a8728199-44a2-40a9-8a98-47faa88cb511": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "Rejected",
			"sourceRef": "b4b4c653-cc9d-4ce5-be6c-466c4f127380",
			"targetRef": "bf410f97-3b06-40b2-b784-c60ece7dd59b"
		},
		"5fe5f5af-f9e3-48cb-8f04-16a120f88cb3": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"rework\"}",
			"id": "sequenceflow16",
			"name": "Rework",
			"sourceRef": "b4b4c653-cc9d-4ce5-be6c-466c4f127380",
			"targetRef": "d811805c-8fa4-4bf2-83ae-651417bf3094"
		},
		"5a984f1e-fc1d-4cdb-aee5-6c52f2157832": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "d811805c-8fa4-4bf2-83ae-651417bf3094",
			"targetRef": "de2f9152-8b21-407b-a8e5-d19ce38aa5b6"
		},
		"586aab06-933c-4d01-aede-590424e1bfd8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow18",
			"name": "SequenceFlow18",
			"sourceRef": "de2f9152-8b21-407b-a8e5-d19ce38aa5b6",
			"targetRef": "dd2a022d-a850-4e4f-bb68-ff18e429de9c"
		},
		"ef06f96c-ae3a-4b66-9383-f490a6ddadbb": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"cccb47ec-bc79-4d8d-9bd9-6cc442517842": {},
				"957febb4-7169-4b8f-8c17-c4cf0a027c8d": {},
				"f146a28d-95f4-4dbc-9b8f-2ac2cafd0c7a": {},
				"ba75d9d3-8f77-4c2e-9797-9b6651c9acc8": {},
				"09371379-0f59-427f-a9bd-e1f5b4f02f14": {},
				"8c4599cf-c688-471c-9c7e-2999279ad37c": {},
				"94ed6dde-01b9-46d9-98d2-4e8a155606d6": {},
				"80897fbe-b4cf-45d1-bfd2-181484465b37": {},
				"2d5ee76e-ea7b-463d-b2bd-559f563b5b43": {},
				"5f988906-13f5-4902-8199-df102849ea5c": {},
				"af7ef0fd-316a-4cbc-a847-e0409e6c9dfd": {},
				"ae529575-ccdb-44dd-aa0b-c045b8a17093": {},
				"e758eca7-429a-4588-b761-a5e58f56aa30": {},
				"475580ca-45c6-46b2-ac77-70caefe69343": {},
				"f61f39ba-a1de-4a3e-bd9b-e7a258fb2814": {},
				"dfdbc1da-0ac6-45c6-b780-8a2e22f31b47": {},
				"16603c62-9d15-4844-a53e-ac03d1eacd1d": {},
				"b5f36e1c-bdfb-44bf-a378-16f2ee40f958": {},
				"3d854c78-3a2a-4921-be5c-b886ed1adff7": {},
				"710e2378-c94c-4aaf-a3c1-0b11f87c6702": {},
				"1d64ab6d-01d2-43c4-a93a-1c580008ccd8": {},
				"566af2ef-1873-4cb1-8326-d1bd3382b6e7": {},
				"5ecdeba9-ebe6-4715-b8d1-1004276b204c": {},
				"d7de9a34-6012-4bb4-9819-eb32373f6ba3": {},
				"7315273d-dd94-46d4-8952-8a0a3086a065": {}
			}
		},
		"40e1a1d7-db4a-40bd-ae4d-c7f7427ba698": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition1"
		},
		"cccb47ec-bc79-4d8d-9bd9-6cc442517842": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 21,
			"y": 102,
			"width": 32,
			"height": 32,
			"object": "1d2cd879-15b6-4d4a-9d21-516a5d7622ec"
		},
		"957febb4-7169-4b8f-8c17-c4cf0a027c8d": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1033,
			"y": 96,
			"width": 35,
			"height": 35,
			"object": "7492ee08-9d0c-4c71-98bd-c0051cb7a87d"
		},
		"f146a28d-95f4-4dbc-9b8f-2ac2cafd0c7a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "37,117.375 144.24147286593848,117.375",
			"sourceSymbol": "cccb47ec-bc79-4d8d-9bd9-6cc442517842",
			"targetSymbol": "ba75d9d3-8f77-4c2e-9797-9b6651c9acc8",
			"object": "f995d165-b5f6-4b24-9366-0e0c58526ee6"
		},
		"ba75d9d3-8f77-4c2e-9797-9b6651c9acc8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94.24147286593848,
			"y": 86.75,
			"width": 100,
			"height": 60,
			"object": "dd2a022d-a850-4e4f-bb68-ff18e429de9c"
		},
		"09371379-0f59-427f-a9bd-e1f5b4f02f14": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "144.24147286593848,116.9375 278.87073643296924,116.9375",
			"sourceSymbol": "ba75d9d3-8f77-4c2e-9797-9b6651c9acc8",
			"targetSymbol": "8c4599cf-c688-471c-9c7e-2999279ad37c",
			"object": "a30e1a30-7530-479d-9930-dbff948ea105"
		},
		"8c4599cf-c688-471c-9c7e-2999279ad37c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 228.87073643296924,
			"y": 87.125,
			"width": 100,
			"height": 60,
			"object": "8940263f-1349-44e3-84e2-6a33dac30152"
		},
		"94ed6dde-01b9-46d9-98d2-4e8a155606d6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "278.87073643296924,116.96875 416.6853682164846,116.96875",
			"sourceSymbol": "8c4599cf-c688-471c-9c7e-2999279ad37c",
			"targetSymbol": "80897fbe-b4cf-45d1-bfd2-181484465b37",
			"object": "5c105fea-2916-4f66-99a6-aaea610dfc5b"
		},
		"80897fbe-b4cf-45d1-bfd2-181484465b37": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 366.6853682164846,
			"y": 86.8125,
			"width": 100,
			"height": 60,
			"object": "bdc7de35-306a-4af5-a618-b4f8786e6a1e"
		},
		"2d5ee76e-ea7b-463d-b2bd-559f563b5b43": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "416.8890261623635,116.734375 526.8890261623635,116.734375",
			"sourceSymbol": "80897fbe-b4cf-45d1-bfd2-181484465b37",
			"targetSymbol": "5f988906-13f5-4902-8199-df102849ea5c",
			"object": "6d686eea-8b69-4340-8057-01415f3c4a22"
		},
		"5f988906-13f5-4902-8199-df102849ea5c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 506.09268410824234,
			"y": 95.65625,
			"object": "9d451043-0faa-468a-b136-f7f17cb5431d"
		},
		"af7ef0fd-316a-4cbc-a847-e0409e6c9dfd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "531.819504895918,116.8671875 639.4613647460938,116.8671875",
			"sourceSymbol": "5f988906-13f5-4902-8199-df102849ea5c",
			"targetSymbol": "ae529575-ccdb-44dd-aa0b-c045b8a17093",
			"object": "61bfc56e-70a9-45d6-ae86-3015a15ad128"
		},
		"ae529575-ccdb-44dd-aa0b-c045b8a17093": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"isAdjustToContent": false,
			"x": 595.5463256835938,
			"y": 87.078125,
			"width": 97,
			"height": 60,
			"object": "56a8ecd6-09b4-4e52-b025-3e0168119934"
		},
		"e758eca7-429a-4588-b761-a5e58f56aa30": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 733.5463256835938,
			"y": 87.078125,
			"width": 112,
			"height": 60,
			"object": "c4a3a624-ae8b-4479-970f-d1d66d019289"
		},
		"475580ca-45c6-46b2-ac77-70caefe69343": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "644.0463256835938,117.078125 789.5463256835938,117.078125",
			"sourceSymbol": "ae529575-ccdb-44dd-aa0b-c045b8a17093",
			"targetSymbol": "e758eca7-429a-4588-b761-a5e58f56aa30",
			"object": "41af9af9-921c-45f8-b1db-12499edc5845"
		},
		"f61f39ba-a1de-4a3e-bd9b-e7a258fb2814": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "527.0926841082423,116.65625 527.0927124023438,45.65625 1044,45.65625 1044,107.65625",
			"sourceSymbol": "5f988906-13f5-4902-8199-df102849ea5c",
			"targetSymbol": "957febb4-7169-4b8f-8c17-c4cf0a027c8d",
			"object": "70818827-e517-495c-a334-2a196afa5b61"
		},
		"dfdbc1da-0ac6-45c6-b780-8a2e22f31b47": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 920.0463256835938,
			"y": 96.078125,
			"object": "b4b4c653-cc9d-4ce5-be6c-466c4f127380"
		},
		"16603c62-9d15-4844-a53e-ac03d1eacd1d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "789.5463256835938,117.078125 941.0463256835938,117.078125",
			"sourceSymbol": "e758eca7-429a-4588-b761-a5e58f56aa30",
			"targetSymbol": "dfdbc1da-0ac6-45c6-b780-8a2e22f31b47",
			"object": "8e287fd7-0873-4b8a-83cd-ac97c3c3340a"
		},
		"b5f36e1c-bdfb-44bf-a378-16f2ee40f958": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "941.0463256835938,115 1050.5,115",
			"sourceSymbol": "dfdbc1da-0ac6-45c6-b780-8a2e22f31b47",
			"targetSymbol": "957febb4-7169-4b8f-8c17-c4cf0a027c8d",
			"object": "d8caac43-aed6-47c7-9969-2c1bbf710898"
		},
		"3d854c78-3a2a-4921-be5c-b886ed1adff7": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1038.0463256835938,
			"y": 281.578125,
			"width": 35,
			"height": 35,
			"object": "bf410f97-3b06-40b2-b784-c60ece7dd59b"
		},
		"710e2378-c94c-4aaf-a3c1-0b11f87c6702": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "940.7963256835938,117.078125 940.7963256835938,209.828125 1055.79638671875,209.828125 1055.7963256835938,299.078125",
			"sourceSymbol": "dfdbc1da-0ac6-45c6-b780-8a2e22f31b47",
			"targetSymbol": "3d854c78-3a2a-4921-be5c-b886ed1adff7",
			"object": "a8728199-44a2-40a9-8a98-47faa88cb511"
		},
		"1d64ab6d-01d2-43c4-a93a-1c580008ccd8": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"isAdjustToContent": false,
			"x": 771.0463256835938,
			"y": 282.078125,
			"width": 111,
			"height": 60,
			"object": "d811805c-8fa4-4bf2-83ae-651417bf3094"
		},
		"566af2ef-1873-4cb1-8326-d1bd3382b6e7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "941.0463256835938,117.078125 941.0463256835938,210.078125 826.5463256835938,210.078125 826.5463256835938,312.078125",
			"sourceSymbol": "dfdbc1da-0ac6-45c6-b780-8a2e22f31b47",
			"targetSymbol": "1d64ab6d-01d2-43c4-a93a-1c580008ccd8",
			"object": "5fe5f5af-f9e3-48cb-8f04-16a120f88cb3"
		},
		"5ecdeba9-ebe6-4715-b8d1-1004276b204c": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 571.0463256835938,
			"y": 282.078125,
			"width": 109,
			"height": 60,
			"object": "de2f9152-8b21-407b-a8e5-d19ce38aa5b6"
		},
		"d7de9a34-6012-4bb4-9819-eb32373f6ba3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "826.5463256835938,312.078125 625.5463256835938,312.078125",
			"sourceSymbol": "1d64ab6d-01d2-43c4-a93a-1c580008ccd8",
			"targetSymbol": "5ecdeba9-ebe6-4715-b8d1-1004276b204c",
			"object": "5a984f1e-fc1d-4cdb-aee5-6c52f2157832"
		},
		"7315273d-dd94-46d4-8952-8a0a3086a065": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "625.5463256835938,312.078125 144,312.078125 144,125",
			"sourceSymbol": "5ecdeba9-ebe6-4715-b8d1-1004276b204c",
			"targetSymbol": "ba75d9d3-8f77-4c2e-9797-9b6651c9acc8",
			"object": "586aab06-933c-4d01-aede-590424e1bfd8"
		},
		"d959b42d-4043-442a-8f94-53ca9dcf6629": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 1,
			"sequenceflow": 18,
			"startevent": 1,
			"endevent": 2,
			"usertask": 2,
			"servicetask": 1,
			"scripttask": 4,
			"exclusivegateway": 3,
			"parallelgateway": 1,
			"referencedsubflow": 2
		}
	}
}