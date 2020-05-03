{
	"contents": {
		"f1ab2a72-76d7-4614-9358-1eb43d340c9b": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "aifalert",
			"subject": "AIFAlert",
			"name": "AIFAlert",
			"lastIds": "e0a7f884-9d2b-4ea5-83ad-eb14a4fc38f2",
			"events": {
				"bf6efad8-2da3-4a5e-8547-8396687c18c3": {
					"name": "AIFAlertCreated"
				},
				"d0a34334-ce25-4cf6-acd8-46efc490ef31": {
					"name": "EndProcess"
				}
			},
			"activities": {
				"0eae543c-b81e-48ab-97cd-a820e6bae79b": {
					"name": "AIF Error Details"
				},
				"fbdec51c-6eaa-484b-854e-f83e2b5d4e92": {
					"name": "Send Error Mail"
				},
				"71e633dc-5405-4a17-8c15-e8386c93547b": {
					"name": "Modify Context"
				},
				"c6f73aef-8469-4be5-8b80-26d25b6b29f1": {
					"name": "CallBack for Restart/Cancel action"
				}
			},
			"sequenceFlows": {
				"de3d2653-2efa-421b-9b23-8bda3b6a246b": {
					"name": "SequenceFlow7"
				},
				"56e6a5ff-1908-45c3-b661-3595794b660b": {
					"name": "SequenceFlow8"
				},
				"fdd4ec3c-0bd9-4f73-b403-e56871d6cd64": {
					"name": "SequenceFlow9"
				},
				"e127c82e-b6a1-4e93-a835-a503bde31ed9": {
					"name": "SequenceFlow10"
				},
				"692c4c33-59fc-4547-b45e-2093055d98dc": {
					"name": "SequenceFlow11"
				}
			},
			"diagrams": {
				"647e024b-142a-4539-99a0-7d3f3bd9b9d5": {}
			}
		},
		"bf6efad8-2da3-4a5e-8547-8396687c18c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "AIFAlertCreated",
			"name": "AIFAlertCreated"
		},
		"d0a34334-ce25-4cf6-acd8-46efc490ef31": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "EndProcess",
			"name": "EndProcess"
		},
		"0eae543c-b81e-48ab-97cd-a820e6bae79b": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Check AIF Alert Triggered from System ${context.alertData.system}, Client ${context.alertData.client}",
			"description": "Error Message Keys: \nNamespace ${context.alertData.ns}\nInterface ${context.alertData.ifname} \nVersion ${context.alertData.ifversion}\nMSGGUID ${context.alertData.msgguid}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://comsapaifAIFAlertUI/com.sap.aif.AIFAlertUI",
			"recipientUsers": "",
			"recipientGroups": "AIF_WF_role_collection",
			"id": "CheckAIFError",
			"name": "AIF Error Details",
			"dueDateRef": "f89bcde2-0b93-4b83-b156-db42ace51733"
		},
		"fbdec51c-6eaa-484b-854e-f83e2b5d4e92": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"id": "SendErrorMail",
			"name": "Send Error Mail",
			"mailDefinitionRef": "a02af959-b081-4213-b684-5e2393390eed"
		},
		"71e633dc-5405-4a17-8c15-e8386c93547b": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/AIFAlert/ModifyContext.js",
			"id": "ModifyContext",
			"name": "Modify Context"
		},
		"c6f73aef-8469-4be5-8b80-26d25b6b29f1": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "YI3_000",
			"path": "/sap/opu/odata/sap/SWF_CPWF_NOTIFICATION_SRV/ProcessCompleted?workflowInstanceId='${info.workflowInstanceId}'",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/sap/SWF_CPWF_NOTIFICATION_SRV/",
			"requestVariable": "",
			"id": "servicetask1",
			"name": "CallBack for Restart/Cancel action"
		},
		"de3d2653-2efa-421b-9b23-8bda3b6a246b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "bf6efad8-2da3-4a5e-8547-8396687c18c3",
			"targetRef": "71e633dc-5405-4a17-8c15-e8386c93547b"
		},
		"56e6a5ff-1908-45c3-b661-3595794b660b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "71e633dc-5405-4a17-8c15-e8386c93547b",
			"targetRef": "fbdec51c-6eaa-484b-854e-f83e2b5d4e92"
		},
		"fdd4ec3c-0bd9-4f73-b403-e56871d6cd64": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "fbdec51c-6eaa-484b-854e-f83e2b5d4e92",
			"targetRef": "0eae543c-b81e-48ab-97cd-a820e6bae79b"
		},
		"e127c82e-b6a1-4e93-a835-a503bde31ed9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "0eae543c-b81e-48ab-97cd-a820e6bae79b",
			"targetRef": "c6f73aef-8469-4be5-8b80-26d25b6b29f1"
		},
		"692c4c33-59fc-4547-b45e-2093055d98dc": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "c6f73aef-8469-4be5-8b80-26d25b6b29f1",
			"targetRef": "d0a34334-ce25-4cf6-acd8-46efc490ef31"
		},
		"647e024b-142a-4539-99a0-7d3f3bd9b9d5": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"40c188e2-9edb-48b2-a9f1-0f163414e3dc": {},
				"1d65d771-3eee-47fd-abc4-454a0615af41": {},
				"003d8ee4-3cc2-4bd5-bdea-af2b9d94f050": {},
				"1095895d-8714-484f-b92c-57e1b9eba5f1": {},
				"00dce4ce-ed82-484c-bbec-6c6fa6a19d2a": {},
				"df0516f6-dfa2-417b-b8ed-65a6dc148636": {},
				"0daac1c4-3711-4162-826b-80f6a35707be": {},
				"73aa591b-2ab8-4aa0-b358-4dc67eed3069": {},
				"3bddb2c7-efc7-476a-aec3-6607efc323c7": {},
				"2ce9c4b4-a334-454a-9ca3-c3f76c9da350": {},
				"40899cfc-e3e5-429c-9d34-50f393db511a": {}
			}
		},
		"40c188e2-9edb-48b2-a9f1-0f163414e3dc": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "bf6efad8-2da3-4a5e-8547-8396687c18c3"
		},
		"1d65d771-3eee-47fd-abc4-454a0615af41": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 707,
			"y": 25.5,
			"width": 35,
			"height": 35,
			"object": "d0a34334-ce25-4cf6-acd8-46efc490ef31"
		},
		"003d8ee4-3cc2-4bd5-bdea-af2b9d94f050": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 394,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "0eae543c-b81e-48ab-97cd-a820e6bae79b"
		},
		"1095895d-8714-484f-b92c-57e1b9eba5f1": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 244,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "fbdec51c-6eaa-484b-854e-f83e2b5d4e92"
		},
		"00dce4ce-ed82-484c-bbec-6c6fa6a19d2a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "71e633dc-5405-4a17-8c15-e8386c93547b"
		},
		"df0516f6-dfa2-417b-b8ed-65a6dc148636": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,42 94,42",
			"sourceSymbol": "40c188e2-9edb-48b2-a9f1-0f163414e3dc",
			"targetSymbol": "00dce4ce-ed82-484c-bbec-6c6fa6a19d2a",
			"object": "de3d2653-2efa-421b-9b23-8bda3b6a246b"
		},
		"0daac1c4-3711-4162-826b-80f6a35707be": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,42 244,42",
			"sourceSymbol": "00dce4ce-ed82-484c-bbec-6c6fa6a19d2a",
			"targetSymbol": "1095895d-8714-484f-b92c-57e1b9eba5f1",
			"object": "56e6a5ff-1908-45c3-b661-3595794b660b"
		},
		"73aa591b-2ab8-4aa0-b358-4dc67eed3069": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,42 394,42",
			"sourceSymbol": "1095895d-8714-484f-b92c-57e1b9eba5f1",
			"targetSymbol": "003d8ee4-3cc2-4bd5-bdea-af2b9d94f050",
			"object": "fdd4ec3c-0bd9-4f73-b403-e56871d6cd64"
		},
		"3bddb2c7-efc7-476a-aec3-6607efc323c7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "444,42 592,42",
			"sourceSymbol": "003d8ee4-3cc2-4bd5-bdea-af2b9d94f050",
			"targetSymbol": "2ce9c4b4-a334-454a-9ca3-c3f76c9da350",
			"object": "e127c82e-b6a1-4e93-a835-a503bde31ed9"
		},
		"2ce9c4b4-a334-454a-9ca3-c3f76c9da350": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 542,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "c6f73aef-8469-4be5-8b80-26d25b6b29f1"
		},
		"40899cfc-e3e5-429c-9d34-50f393db511a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "592,42.5 724.5,42.5",
			"sourceSymbol": "2ce9c4b4-a334-454a-9ca3-c3f76c9da350",
			"targetSymbol": "1d65d771-3eee-47fd-abc4-454a0615af41",
			"object": "692c4c33-59fc-4547-b45e-2093055d98dc"
		},
		"e0a7f884-9d2b-4ea5-83ad-eb14a4fc38f2": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 1,
			"maildefinition": 1,
			"sequenceflow": 11,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 1,
			"mailtask": 1
		},
		"f89bcde2-0b93-4b83-b156-db42ace51733": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P5D",
			"id": "timereventdefinition1"
		},
		"a02af959-b081-4213-b684-5e2393390eed": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "your EMail address here for testing",
			"subject": "AIF Restart Cancel Workflow Triggered for testing",
			"text": "AIF Message Keys:\nNamespace: ${context.alertData.ns}\nInterface: ${context.alertData.ifname} \nVersion  : ${context.alertData.ifversion}\nMSGGUID  : ${context.alertData.msgguid}\nIBN URL  : ${context.alertData.ibn}\n\nAIF Error Logs:\n${context.alertData.logMessages[0].message}\n${context.alertData.logMessages[1].message}\n${context.alertData.logMessages[2].message}\n${context.alertData.logMessages[3].message}\n${context.alertData.logMessages[4].message}\n${context.alertData.logMessages[5].message}\n${context.alertData.logMessages[6].message}\n${context.alertData.logMessages[7].message}\n${context.alertData.logMessages[8].message}\n${context.alertData.logMessages[9].message}\n",
			"id": "maildefinition1"
		}
	}
}
