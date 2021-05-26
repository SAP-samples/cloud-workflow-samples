{
	"contents": {
		"0796d39f-28cc-4238-b2f7-5da34100c93f": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "initialization",
			"subject": "Initialization",
			"name": "Initialization",
			"documentation": "Initialization",
			"lastIds": "566c1b80-e635-4c0e-bb15-a3fa2e2ce958",
			"events": {
				"f29f1d6b-fd9b-4ef9-b682-9a5a1c20c479": {
					"name": "Start Initialization Step"
				},
				"0ceb1f0d-bab5-4bb1-94ee-40146c4f70da": {
					"name": "End Initialization Step"
				}
			},
			"activities": {
				"b3157722-dc62-405a-b6bd-3cd084a7092c": {
					"name": "Initializate Context"
				}
			},
			"sequenceFlows": {
				"db1c98f5-0af5-495c-bb22-a15c9eb1c9d9": {
					"name": "SequenceFlow1"
				},
				"ce6fc9ec-bef8-4e52-a25d-e728903973ed": {
					"name": "SequenceFlow2"
				}
			},
			"diagrams": {
				"f00e35f8-69c3-4867-8058-38ff9246d8a5": {}
			}
		},
		"f29f1d6b-fd9b-4ef9-b682-9a5a1c20c479": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Start Initialization Step"
		},
		"0ceb1f0d-bab5-4bb1-94ee-40146c4f70da": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "End Initialization Step"
		},
		"db1c98f5-0af5-495c-bb22-a15c9eb1c9d9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "f29f1d6b-fd9b-4ef9-b682-9a5a1c20c479",
			"targetRef": "b3157722-dc62-405a-b6bd-3cd084a7092c"
		},
		"f00e35f8-69c3-4867-8058-38ff9246d8a5": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"5ec94bc6-c8be-407c-9d04-1d731bd1dc32": {},
				"c924b541-d4a8-42eb-8918-43a47bf31c63": {},
				"9cf2571e-d26a-43b7-b7a6-7e6809f46888": {},
				"985c6478-05a6-4b23-8f5a-269caacc48a8": {},
				"195db388-fb7a-4904-b3e2-edb4fc9f6d54": {}
			}
		},
		"5ec94bc6-c8be-407c-9d04-1d731bd1dc32": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "f29f1d6b-fd9b-4ef9-b682-9a5a1c20c479"
		},
		"c924b541-d4a8-42eb-8918-43a47bf31c63": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 340,
			"y": 100,
			"width": 35,
			"height": 35,
			"object": "0ceb1f0d-bab5-4bb1-94ee-40146c4f70da"
		},
		"9cf2571e-d26a-43b7-b7a6-7e6809f46888": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116.375 236.24147286593848,116.375",
			"sourceSymbol": "5ec94bc6-c8be-407c-9d04-1d731bd1dc32",
			"targetSymbol": "985c6478-05a6-4b23-8f5a-269caacc48a8",
			"object": "db1c98f5-0af5-495c-bb22-a15c9eb1c9d9"
		},
		"566c1b80-e635-4c0e-bb15-a3fa2e2ce958": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 2,
			"startevent": 1,
			"endevent": 1,
			"scripttask": 1
		},
		"b3157722-dc62-405a-b6bd-3cd084a7092c": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/Initialization/Initialization.js",
			"id": "scripttask1",
			"name": "Initializate Context"
		},
		"985c6478-05a6-4b23-8f5a-269caacc48a8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 186.24147286593848,
			"y": 86.75,
			"width": 100,
			"height": 60,
			"object": "b3157722-dc62-405a-b6bd-3cd084a7092c"
		},
		"ce6fc9ec-bef8-4e52-a25d-e728903973ed": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "b3157722-dc62-405a-b6bd-3cd084a7092c",
			"targetRef": "0ceb1f0d-bab5-4bb1-94ee-40146c4f70da"
		},
		"195db388-fb7a-4904-b3e2-edb4fc9f6d54": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "236.24147286593848,117.125 357.5,117.125",
			"sourceSymbol": "985c6478-05a6-4b23-8f5a-269caacc48a8",
			"targetSymbol": "c924b541-d4a8-42eb-8918-43a47bf31c63",
			"object": "ce6fc9ec-bef8-4e52-a25d-e728903973ed"
		}
	}
}