{
	"contents": {
		"ff8a97f7-7981-4cce-83b3-98e077992be8": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "capexapproval",
			"subject": "capexapproval",
			"name": "capexapproval",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"bdc22b71-7b04-4c5b-9292-8552960b8966": {
					"name": "Capex Approval"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"0dd6b9ff-0142-40fb-b448-a58707444a77": {
					"name": "SequenceFlow2"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"bdc22b71-7b04-4c5b-9292-8552960b8966": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Capex Approval for ${context.RequestId}",
			"description": "Approve capital expenditure request",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://sapdemobpmtaskui/sap.demo.bpm.taskui",
			"recipientUsers": "${info.startedBy}",
			"id": "usertask1",
			"name": "Capex Approval"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "bdc22b71-7b04-4c5b-9292-8552960b8966"
		},
		"0dd6b9ff-0142-40fb-b448-a58707444a77": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "bdc22b71-7b04-4c5b-9292-8552960b8966",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"e1a8e7c5-7148-472c-b86a-e12dca734eb1": {},
				"03ea6a20-b5df-4c76-b354-7111fd290fd6": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 340,
			"y": 100,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116.375 236.24147286593848,116.375",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "e1a8e7c5-7148-472c-b86a-e12dca734eb1",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"e1a8e7c5-7148-472c-b86a-e12dca734eb1": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 186.24147286593848,
			"y": 86.75,
			"width": 100,
			"height": 60,
			"object": "bdc22b71-7b04-4c5b-9292-8552960b8966"
		},
		"03ea6a20-b5df-4c76-b354-7111fd290fd6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "236.24147286593848,117.125 357.5,117.125",
			"sourceSymbol": "e1a8e7c5-7148-472c-b86a-e12dca734eb1",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "0dd6b9ff-0142-40fb-b448-a58707444a77"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 2,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1
		}
	}
}