{
	"contents": {
		"b520cbbf-8008-4d2a-9dee-392309aa8eb4": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "documentauditprocess",
			"subject": "Document Audit Process",
			"businessKey": "${context.Document.JAMProperties.Id}",
			"name": "DocumentAuditProcess",
			"lastIds": "93a67d47-1a0f-4c71-a2cf-267f0ab5cb55",
			"events": {
				"2f02941f-682c-419d-8849-f7273c199a63": {
					"name": "Start"
				},
				"25e902cc-3b09-4e50-88ac-93076589eb72": {
					"name": "End"
				}
			},
			"activities": {
				"c970e7be-7975-426f-befc-51ea534e9b2b": {
					"name": "Split"
				},
				"f2d16150-6730-4d52-a0de-563dc1f19047": {
					"name": "Tax Department"
				},
				"23eb50c8-f800-442f-98b9-903ccf945b3b": {
					"name": "Merge"
				},
				"0f8ebaa2-b29f-4717-8eee-62c3a52f79d5": {
					"name": "Accounting Policy Review"
				},
				"08aae417-9547-4b03-a183-15abd2e2be37": {
					"name": "Approved?"
				},
				"0379cc75-f729-4ec7-a44f-9bda1742b605": {
					"name": "Collect"
				},
				"c4e04dbe-ebd1-4d15-82ea-9705d01b1cd5": {
					"name": "Head of Business Analyst Review"
				},
				"010e7539-5fae-4b09-a59b-e54034b6a242": {
					"name": "Set Final Approval Status"
				},
				"9b8a2e6b-9504-40bc-88d0-8a327d1f4e99": {
					"name": "External Auditor Review"
				},
				"096f7aff-6c65-4164-b004-9721573851a9": {
					"name": "ParallelGateway3"
				},
				"b4206345-8bbe-4a8e-8d19-2612a9bc0819": {
					"name": "Approval from Head of External Auditors"
				},
				"b622581b-2fc7-4cc6-be09-0c5d7846df82": {
					"name": "ParallelGateway4"
				},
				"d43e464d-8d72-4a08-9dd5-f56564884f20": {
					"name": "Approval from Head of Group Reporting"
				},
				"1b5d9203-06c9-4624-a7d4-7e1bc32d1760": {
					"name": "Set Approval Status"
				},
				"7f06edfb-48c9-4f4c-9720-33320378ac2d": {
					"name": "Group Approved?"
				},
				"8b3344e2-519b-444b-a926-85829f2c5f0f": {
					"name": "Rework Document"
				},
				"22ce8d30-c74b-4354-92fe-94ed6ec6aac3": {
					"name": "Final Sign-Off"
				},
				"ae55aa5e-821b-41ba-8f47-2bc9bea722d4": {
					"name": "Initialize Approvals"
				}
			},
			"sequenceFlows": {
				"19e01075-205d-4d14-a601-9d61a2962a60": {
					"name": "SequenceFlow1"
				},
				"9765a0c4-3180-4edb-bae8-4beb2be652e0": {
					"name": "SequenceFlow4"
				},
				"ee3530d4-7782-4a51-b74e-c396510188ea": {
					"name": "SequenceFlow5"
				},
				"caac581e-ac1d-4bd1-906e-ec50654b0729": {
					"name": "SequenceFlow6"
				},
				"3797149b-301a-4cb0-81ac-1071a70719d1": {
					"name": "SequenceFlow7"
				},
				"e31e17f3-a721-4494-82e5-74593e57a678": {
					"name": "SequenceFlow8"
				},
				"a2a95496-22e4-40c5-a683-9d63c53911f0": {
					"name": "SequenceFlow10"
				},
				"d293ba22-8374-49dc-ae7d-70f2ef6653cb": {
					"name": "Rejected"
				},
				"85de19df-a5b1-497b-8e5d-9f28af4406aa": {
					"name": "SequenceFlow12"
				},
				"94f034fd-bfc2-4fc3-9168-a96c206432a2": {
					"name": "SequenceFlow13"
				},
				"eeb3f569-0387-4629-8767-2355fb7a0c4b": {
					"name": "SequenceFlow15"
				},
				"eecf9b26-d2a5-4338-8a9a-b8199349a089": {
					"name": "SequenceFlow16"
				},
				"742e0593-8190-4b4e-918a-39433ea58b74": {
					"name": "SequenceFlow17"
				},
				"b4691250-a1d1-4fa9-9848-427128b553ca": {
					"name": "Approved"
				},
				"ab38d669-f7b8-409c-b72f-28321aa8ba7d": {
					"name": "SequenceFlow20"
				},
				"b5afe764-5ea6-4b7c-834e-bc8edadc4fd0": {
					"name": "SequenceFlow21"
				},
				"8cb85070-d1bf-4f84-8c98-15693d35b2b9": {
					"name": "SequenceFlow22"
				},
				"dc7f281b-41f7-47f5-b3ed-058b5d5a3471": {
					"name": "SequenceFlow23"
				},
				"79c5d20e-b200-4db9-8836-d766a9a6bef6": {
					"name": "SequenceFlow24"
				},
				"32bc5b48-665d-4c19-bc88-4eca9874fd24": {
					"name": "SequenceFlow25"
				},
				"ec4aa89d-c864-4780-aaef-7b03529a5845": {
					"name": "Approved"
				},
				"02695575-a2aa-40ba-a857-34f8ace36f98": {
					"name": "SequenceFlow27"
				},
				"08744352-4243-41f8-8fa1-b8438a6a2535": {
					"name": "Rejected"
				},
				"c200d5d4-9350-4fd6-bb86-9b977d9a754f": {
					"name": "SequenceFlow29"
				},
				"ec1c401c-c26d-495b-bd53-ef84540834ff": {
					"name": "SequenceFlow31"
				}
			},
			"diagrams": {
				"97a7a06f-abda-47c0-971e-05dbd0a41f65": {}
			}
		},
		"2f02941f-682c-419d-8849-f7273c199a63": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "Start"
		},
		"25e902cc-3b09-4e50-88ac-93076589eb72": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "End"
		},
		"c970e7be-7975-426f-befc-51ea534e9b2b": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway1",
			"name": "Split"
		},
		"f2d16150-6730-4d52-a0de-563dc1f19047": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Review ${context.Document.JAMProperties.Name} by Tax Department",
			"description": "Verify the document ${context.Document.JAMProperties.Name} submitted for your approval.",
			"priority": "VERY_HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Document.Reviewers.Tax.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "Tax"
			}],
			"id": "usertask1",
			"name": "Tax Department",
			"dueDateRef": "bba35ec3-22f3-4eb7-a7ea-a7cfc140d0e4"
		},
		"23eb50c8-f800-442f-98b9-903ccf945b3b": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway2",
			"name": "Merge"
		},
		"0f8ebaa2-b29f-4717-8eee-62c3a52f79d5": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Review ${context.Document.JAMProperties.Name}",
			"description": "Review the accounting policy in document ${context.Document.JAMProperties.Name}.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Document.Reviewers.Accounting.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "Accounting"
			}],
			"id": "usertask2",
			"name": "Accounting Policy Review"
		},
		"08aae417-9547-4b03-a183-15abd2e2be37": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Approved?",
			"default": "b4691250-a1d1-4fa9-9848-427128b553ca"
		},
		"0379cc75-f729-4ec7-a44f-9bda1742b605": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "Collect"
		},
		"c4e04dbe-ebd1-4d15-82ea-9705d01b1cd5": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Review ${context.Document.JAMProperties.Name} by Head of Business Analyst",
			"description": "Review the document ${context.Document.JAMProperties.Name} submitted to head of Business Analyst.",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Document.Reviewers.HeadOfBA.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "HeadOfBA"
			}],
			"id": "usertask3",
			"name": "Head of Business Analyst Review",
			"dueDateRef": "e6bece8a-72d2-461c-960f-f7a365c5ef51"
		},
		"010e7539-5fae-4b09-a59b-e54034b6a242": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/DocumentAuditProcess/checkApprovalStatusLevel1.js",
			"id": "scripttask3",
			"name": "Set Final Approval Status"
		},
		"9b8a2e6b-9504-40bc-88d0-8a327d1f4e99": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Review ${context.Document.JAMProperties.Name} by External Auditor",
			"description": "Review the document ${context.Document.JAMProperties.Name} submitted for your review.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Document.Reviewers.ExternalAuditors.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "ExternalAuditors"
			}],
			"id": "usertask4",
			"name": "External Auditor Review"
		},
		"096f7aff-6c65-4164-b004-9721573851a9": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway3",
			"name": "ParallelGateway3"
		},
		"b4206345-8bbe-4a8e-8d19-2612a9bc0819": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve ${context.Document.JAMProperties.Name}",
			"description": "As an external auditor head, approve the document ${context.Document.JAMProperties.Name} submitted to you.",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Document.Approvers.ExternalAuditHeads.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "ExternalAuditHeads"
			}],
			"id": "usertask5",
			"name": "Approval from Head of External Auditors"
		},
		"b622581b-2fc7-4cc6-be09-0c5d7846df82": {
			"classDefinition": "com.sap.bpm.wfs.ParallelGateway",
			"id": "parallelgateway4",
			"name": "ParallelGateway4"
		},
		"d43e464d-8d72-4a08-9dd5-f56564884f20": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve the document ${context.Document.JAMProperties.Name}",
			"description": "As the head of group reporting, approve the document ${context.Document.JAMProperties.Name} submitted to you.",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Document.Approvers.HeadOfGroupReporting.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "HeadOfGroupReporting"
			}],
			"id": "usertask6",
			"name": "Approval from Head of Group Reporting"
		},
		"1b5d9203-06c9-4624-a7d4-7e1bc32d1760": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/DocumentAuditProcess/SetApprovalStatus.js",
			"id": "scripttask4",
			"name": "Set Approval Status"
		},
		"7f06edfb-48c9-4f4c-9720-33320378ac2d": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway4",
			"name": "Group Approved?",
			"default": "ec4aa89d-c864-4780-aaef-7b03529a5845"
		},
		"8b3344e2-519b-444b-a926-85829f2c5f0f": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Rework on the document ${context.Document.JAMProperties.Name}",
			"description": "Rework on the document ${context.Document.JAMProperties.Name} as it is rejected by reviewers.",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Requestor.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "Rework"
			}],
			"id": "usertask7",
			"name": "Rework Document"
		},
		"22ce8d30-c74b-4354-92fe-94ed6ec6aac3": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Final Sign-Off of ${context.Document.JAMProperties.Name}",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/samplecollaboration/usertasks/com.sap.cloud.workflow.samples.audit",
			"recipientUsers": "${context.Requestor.UserID}",
			"recipientGroups": "",
			"userInterfaceParams": [{
				"key": "task",
				"value": "SignOff"
			}],
			"id": "usertask8",
			"name": "Final Sign-Off"
		},
		"ae55aa5e-821b-41ba-8f47-2bc9bea722d4": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/DocumentAuditProcess/initializeApprovals.js",
			"id": "scripttask6",
			"name": "Initialize Approvals"
		},
		"19e01075-205d-4d14-a601-9d61a2962a60": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "2f02941f-682c-419d-8849-f7273c199a63",
			"targetRef": "0379cc75-f729-4ec7-a44f-9bda1742b605"
		},
		"9765a0c4-3180-4edb-bae8-4beb2be652e0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "c970e7be-7975-426f-befc-51ea534e9b2b",
			"targetRef": "f2d16150-6730-4d52-a0de-563dc1f19047"
		},
		"ee3530d4-7782-4a51-b74e-c396510188ea": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "f2d16150-6730-4d52-a0de-563dc1f19047",
			"targetRef": "23eb50c8-f800-442f-98b9-903ccf945b3b"
		},
		"caac581e-ac1d-4bd1-906e-ec50654b0729": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "23eb50c8-f800-442f-98b9-903ccf945b3b",
			"targetRef": "010e7539-5fae-4b09-a59b-e54034b6a242"
		},
		"3797149b-301a-4cb0-81ac-1071a70719d1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "c970e7be-7975-426f-befc-51ea534e9b2b",
			"targetRef": "0f8ebaa2-b29f-4717-8eee-62c3a52f79d5"
		},
		"e31e17f3-a721-4494-82e5-74593e57a678": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "0f8ebaa2-b29f-4717-8eee-62c3a52f79d5",
			"targetRef": "23eb50c8-f800-442f-98b9-903ccf945b3b"
		},
		"a2a95496-22e4-40c5-a683-9d63c53911f0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "0379cc75-f729-4ec7-a44f-9bda1742b605",
			"targetRef": "ae55aa5e-821b-41ba-8f47-2bc9bea722d4"
		},
		"d293ba22-8374-49dc-ae7d-70f2ef6653cb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.Document.levelOneStatus == false}",
			"id": "sequenceflow11",
			"name": "Rejected",
			"sourceRef": "08aae417-9547-4b03-a183-15abd2e2be37",
			"targetRef": "8b3344e2-519b-444b-a926-85829f2c5f0f"
		},
		"85de19df-a5b1-497b-8e5d-9f28af4406aa": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "c970e7be-7975-426f-befc-51ea534e9b2b",
			"targetRef": "c4e04dbe-ebd1-4d15-82ea-9705d01b1cd5"
		},
		"94f034fd-bfc2-4fc3-9168-a96c206432a2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "c4e04dbe-ebd1-4d15-82ea-9705d01b1cd5",
			"targetRef": "23eb50c8-f800-442f-98b9-903ccf945b3b"
		},
		"eeb3f569-0387-4629-8767-2355fb7a0c4b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "SequenceFlow15",
			"sourceRef": "010e7539-5fae-4b09-a59b-e54034b6a242",
			"targetRef": "08aae417-9547-4b03-a183-15abd2e2be37"
		},
		"eecf9b26-d2a5-4338-8a9a-b8199349a089": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "SequenceFlow16",
			"sourceRef": "c970e7be-7975-426f-befc-51ea534e9b2b",
			"targetRef": "9b8a2e6b-9504-40bc-88d0-8a327d1f4e99"
		},
		"742e0593-8190-4b4e-918a-39433ea58b74": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "9b8a2e6b-9504-40bc-88d0-8a327d1f4e99",
			"targetRef": "23eb50c8-f800-442f-98b9-903ccf945b3b"
		},
		"b4691250-a1d1-4fa9-9848-427128b553ca": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow18",
			"name": "Approved",
			"sourceRef": "08aae417-9547-4b03-a183-15abd2e2be37",
			"targetRef": "096f7aff-6c65-4164-b004-9721573851a9"
		},
		"ab38d669-f7b8-409c-b72f-28321aa8ba7d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow20",
			"name": "SequenceFlow20",
			"sourceRef": "096f7aff-6c65-4164-b004-9721573851a9",
			"targetRef": "b4206345-8bbe-4a8e-8d19-2612a9bc0819"
		},
		"b5afe764-5ea6-4b7c-834e-bc8edadc4fd0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow21",
			"name": "SequenceFlow21",
			"sourceRef": "b4206345-8bbe-4a8e-8d19-2612a9bc0819",
			"targetRef": "b622581b-2fc7-4cc6-be09-0c5d7846df82"
		},
		"8cb85070-d1bf-4f84-8c98-15693d35b2b9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow22",
			"name": "SequenceFlow22",
			"sourceRef": "b622581b-2fc7-4cc6-be09-0c5d7846df82",
			"targetRef": "1b5d9203-06c9-4624-a7d4-7e1bc32d1760"
		},
		"dc7f281b-41f7-47f5-b3ed-058b5d5a3471": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow23",
			"name": "SequenceFlow23",
			"sourceRef": "096f7aff-6c65-4164-b004-9721573851a9",
			"targetRef": "d43e464d-8d72-4a08-9dd5-f56564884f20"
		},
		"79c5d20e-b200-4db9-8836-d766a9a6bef6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow24",
			"name": "SequenceFlow24",
			"sourceRef": "d43e464d-8d72-4a08-9dd5-f56564884f20",
			"targetRef": "b622581b-2fc7-4cc6-be09-0c5d7846df82"
		},
		"32bc5b48-665d-4c19-bc88-4eca9874fd24": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow25",
			"name": "SequenceFlow25",
			"sourceRef": "1b5d9203-06c9-4624-a7d4-7e1bc32d1760",
			"targetRef": "7f06edfb-48c9-4f4c-9720-33320378ac2d"
		},
		"ec4aa89d-c864-4780-aaef-7b03529a5845": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow26",
			"name": "Approved",
			"sourceRef": "7f06edfb-48c9-4f4c-9720-33320378ac2d",
			"targetRef": "22ce8d30-c74b-4354-92fe-94ed6ec6aac3"
		},
		"02695575-a2aa-40ba-a857-34f8ace36f98": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow27",
			"name": "SequenceFlow27",
			"sourceRef": "8b3344e2-519b-444b-a926-85829f2c5f0f",
			"targetRef": "0379cc75-f729-4ec7-a44f-9bda1742b605"
		},
		"08744352-4243-41f8-8fa1-b8438a6a2535": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.Document.levelTwoStatus == false}",
			"id": "sequenceflow28",
			"name": "Rejected",
			"sourceRef": "7f06edfb-48c9-4f4c-9720-33320378ac2d",
			"targetRef": "0379cc75-f729-4ec7-a44f-9bda1742b605"
		},
		"c200d5d4-9350-4fd6-bb86-9b977d9a754f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow29",
			"name": "SequenceFlow29",
			"sourceRef": "22ce8d30-c74b-4354-92fe-94ed6ec6aac3",
			"targetRef": "25e902cc-3b09-4e50-88ac-93076589eb72"
		},
		"ec1c401c-c26d-495b-bd53-ef84540834ff": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow31",
			"name": "SequenceFlow31",
			"sourceRef": "ae55aa5e-821b-41ba-8f47-2bc9bea722d4",
			"targetRef": "c970e7be-7975-426f-befc-51ea534e9b2b"
		},
		"97a7a06f-abda-47c0-971e-05dbd0a41f65": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"0871370b-282e-4da6-b467-4e83672e7dfd": {},
				"ac09f365-0dd4-4596-9b23-7f6da896ce8b": {},
				"4bc9fa51-49ca-4d22-b804-05f87bda6e02": {},
				"6577ed32-84a2-4848-b0ce-fc0076aa4e00": {},
				"703bead5-9139-4f30-b68c-698e9e02a48e": {},
				"b9addb74-48d7-44cf-aae5-e03ed1c24bd4": {},
				"c01e12dc-39cb-46ce-8783-8835d6410a45": {},
				"efed204a-521a-4c83-b99d-67c76b957cb1": {},
				"dc8ecee1-c324-4a77-818c-40861c54f3d0": {},
				"bf35b96e-17f0-46ad-9502-31f827be3aed": {},
				"a4e7c398-bbee-438c-90dc-640c63f5f896": {},
				"1145a374-37b2-424a-85ba-af25fb020d16": {},
				"73e492fe-332b-4881-9b20-95e555da2c1f": {},
				"9bffa0e7-245b-4ad5-a49b-cd4d997ff864": {},
				"032039cd-720b-4e81-ab2d-7aef37da97b6": {},
				"628b0207-5f44-497c-949d-d98f96c553e7": {},
				"e4641111-999c-40d9-9564-bab02b1cd01e": {},
				"76acd5fb-2666-4c2f-8363-6b9aa7883918": {},
				"bc9c9625-586d-45de-94a6-e6ab263d3cad": {},
				"604f8a2f-f522-42f0-be9a-8d2f0e8c338a": {},
				"dae0705d-9c06-4c65-90b9-522136f74cf0": {},
				"59acf655-883b-4f5b-b5aa-e6f8ef675821": {},
				"dca064f2-25bc-49c7-982e-dcb2bfad9856": {},
				"c7fe0aa8-71e7-44c7-9a35-05409daa10c6": {},
				"70ef64f6-1f6d-4382-ba55-ed32e5b0f32d": {},
				"b4b752e1-2e78-4684-80b6-ab6fe4329b40": {},
				"a6823493-38b8-431e-96f8-96beadbdec4a": {},
				"f9a5a0f9-ccaa-4f43-8aa5-0235c79d35ed": {},
				"0011b8b0-f7ee-4762-848c-582cbba7bdc8": {},
				"735683ca-425e-4919-b0de-110e2fff2147": {},
				"aba8e4ce-54ea-48de-bac7-19ae9fdaf108": {},
				"45d4ccc5-58b7-43fd-ae0f-0c46ce263f9f": {},
				"4dc9878d-e481-40b1-b388-e5ad8c7173c2": {},
				"1f5ebb0b-48d1-47bf-a379-a8764292fec7": {},
				"19cafb1e-96bb-475e-9e38-d2adacc1423f": {},
				"a9023db1-c05f-4f65-8ae6-13db871cbcf7": {},
				"b5971cbf-700f-4321-98e1-163fcd117737": {},
				"180ef1a2-a3cd-4d83-a31d-7572c63ed37c": {},
				"8834e354-079f-4093-94af-c7e5cce87fd7": {},
				"29b1a409-7e8a-4a25-ad62-db6a2d930522": {},
				"89f403a2-0c07-4d6d-b423-bad88d63a76f": {},
				"9eb3e009-fc47-45e7-b3d7-1ef146514c7c": {},
				"6e697638-f31d-4d46-8ed9-ddffa9727903": {},
				"23154b74-c6f6-4ee2-bf85-27798da9db07": {},
				"e584f45a-f0b8-403c-87ae-52aa34a622a1": {}
			}
		},
		"0871370b-282e-4da6-b467-4e83672e7dfd": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -2,
			"y": 95,
			"width": 32,
			"height": 32,
			"object": "2f02941f-682c-419d-8849-f7273c199a63"
		},
		"ac09f365-0dd4-4596-9b23-7f6da896ce8b": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 1874,
			"y": 91,
			"width": 32,
			"height": 32,
			"object": "25e902cc-3b09-4e50-88ac-93076589eb72"
		},
		"4bc9fa51-49ca-4d22-b804-05f87bda6e02": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "14,113.5 118.375,113.5",
			"sourceSymbol": "0871370b-282e-4da6-b467-4e83672e7dfd",
			"targetSymbol": "9bffa0e7-245b-4ad5-a49b-cd4d997ff864",
			"object": "19e01075-205d-4d14-a601-9d61a2962a60"
		},
		"6577ed32-84a2-4848-b0ce-fc0076aa4e00": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 296.75,
			"y": 95,
			"object": "c970e7be-7975-426f-befc-51ea534e9b2b"
		},
		"703bead5-9139-4f30-b68c-698e9e02a48e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "317.75,116 317.75,-57 407.125,-57",
			"sourceSymbol": "6577ed32-84a2-4848-b0ce-fc0076aa4e00",
			"targetSymbol": "b9addb74-48d7-44cf-aae5-e03ed1c24bd4",
			"object": "9765a0c4-3180-4edb-bae8-4beb2be652e0"
		},
		"b9addb74-48d7-44cf-aae5-e03ed1c24bd4": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 407.125,
			"y": -87,
			"width": 100,
			"height": 60,
			"object": "f2d16150-6730-4d52-a0de-563dc1f19047"
		},
		"c01e12dc-39cb-46ce-8783-8835d6410a45": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "507.125,-55 609.8125,-55 609.8125,116",
			"sourceSymbol": "b9addb74-48d7-44cf-aae5-e03ed1c24bd4",
			"targetSymbol": "efed204a-521a-4c83-b99d-67c76b957cb1",
			"object": "ee3530d4-7782-4a51-b74e-c396510188ea"
		},
		"efed204a-521a-4c83-b99d-67c76b957cb1": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 588.8125,
			"y": 95,
			"object": "23eb50c8-f800-442f-98b9-903ccf945b3b"
		},
		"dc8ecee1-c324-4a77-818c-40861c54f3d0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "609.8125,115.875 714.1542479810778,115.875",
			"sourceSymbol": "efed204a-521a-4c83-b99d-67c76b957cb1",
			"targetSymbol": "604f8a2f-f522-42f0-be9a-8d2f0e8c338a",
			"object": "caac581e-ac1d-4bd1-906e-ec50654b0729"
		},
		"bf35b96e-17f0-46ad-9502-31f827be3aed": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 407,
			"y": 249,
			"width": 100,
			"height": 60,
			"object": "0f8ebaa2-b29f-4717-8eee-62c3a52f79d5"
		},
		"a4e7c398-bbee-438c-90dc-640c63f5f896": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "317.75,116 317.75,279 407,279",
			"sourceSymbol": "6577ed32-84a2-4848-b0ce-fc0076aa4e00",
			"targetSymbol": "bf35b96e-17f0-46ad-9502-31f827be3aed",
			"object": "3797149b-301a-4cb0-81ac-1071a70719d1"
		},
		"1145a374-37b2-424a-85ba-af25fb020d16": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "506,282 609.8125,282 609.8125,137",
			"sourceSymbol": "bf35b96e-17f0-46ad-9502-31f827be3aed",
			"targetSymbol": "efed204a-521a-4c83-b99d-67c76b957cb1",
			"object": "e31e17f3-a721-4494-82e5-74593e57a678"
		},
		"73e492fe-332b-4881-9b20-95e555da2c1f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 783.4959959621556,
			"y": 94.5,
			"object": "08aae417-9547-4b03-a183-15abd2e2be37"
		},
		"9bffa0e7-245b-4ad5-a49b-cd4d997ff864": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 97.375,
			"y": 95,
			"object": "0379cc75-f729-4ec7-a44f-9bda1742b605"
		},
		"032039cd-720b-4e81-ab2d-7aef37da97b6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "118.375,116 218.0625,116",
			"sourceSymbol": "9bffa0e7-245b-4ad5-a49b-cd4d997ff864",
			"targetSymbol": "23154b74-c6f6-4ee2-bf85-27798da9db07",
			"object": "a2a95496-22e4-40c5-a683-9d63c53911f0"
		},
		"628b0207-5f44-497c-949d-d98f96c553e7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "806,115.5 806,442 457,442",
			"sourceSymbol": "73e492fe-332b-4881-9b20-95e555da2c1f",
			"targetSymbol": "8834e354-079f-4093-94af-c7e5cce87fd7",
			"object": "d293ba22-8374-49dc-ae7d-70f2ef6653cb"
		},
		"e4641111-999c-40d9-9564-bab02b1cd01e": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 407,
			"y": 134,
			"width": 100,
			"height": 60,
			"object": "c4e04dbe-ebd1-4d15-82ea-9705d01b1cd5"
		},
		"76acd5fb-2666-4c2f-8363-6b9aa7883918": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "317.75,116 372.875,116 372.875,164 407,164",
			"sourceSymbol": "6577ed32-84a2-4848-b0ce-fc0076aa4e00",
			"targetSymbol": "e4641111-999c-40d9-9564-bab02b1cd01e",
			"object": "85de19df-a5b1-497b-8e5d-9f28af4406aa"
		},
		"bc9c9625-586d-45de-94a6-e6ab263d3cad": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "457,164 548.15625,164 548.15625,116 588.8125,116",
			"sourceSymbol": "e4641111-999c-40d9-9564-bab02b1cd01e",
			"targetSymbol": "efed204a-521a-4c83-b99d-67c76b957cb1",
			"object": "94f034fd-bfc2-4fc3-9168-a96c206432a2"
		},
		"604f8a2f-f522-42f0-be9a-8d2f0e8c338a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 664.1542479810778,
			"y": 85.75,
			"width": 100,
			"height": 60,
			"object": "010e7539-5fae-4b09-a59b-e54034b6a242"
		},
		"dae0705d-9c06-4c65-90b9-522136f74cf0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "714.1542479810778,115.625 804.4959959621556,115.625",
			"sourceSymbol": "604f8a2f-f522-42f0-be9a-8d2f0e8c338a",
			"targetSymbol": "73e492fe-332b-4881-9b20-95e555da2c1f",
			"object": "eeb3f569-0387-4629-8767-2355fb7a0c4b"
		},
		"59acf655-883b-4f5b-b5aa-e6f8ef675821": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 407,
			"y": 35,
			"width": 100,
			"height": 60,
			"object": "9b8a2e6b-9504-40bc-88d0-8a327d1f4e99"
		},
		"dca064f2-25bc-49c7-982e-dcb2bfad9856": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "317.75,116 372.875,116 372.875,65 407,65",
			"sourceSymbol": "6577ed32-84a2-4848-b0ce-fc0076aa4e00",
			"targetSymbol": "59acf655-883b-4f5b-b5aa-e6f8ef675821",
			"object": "eecf9b26-d2a5-4338-8a9a-b8199349a089"
		},
		"c7fe0aa8-71e7-44c7-9a35-05409daa10c6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "457,65 548.15625,65 548.15625,116 588.8125,116",
			"sourceSymbol": "59acf655-883b-4f5b-b5aa-e6f8ef675821",
			"targetSymbol": "efed204a-521a-4c83-b99d-67c76b957cb1",
			"object": "742e0593-8190-4b4e-918a-39433ea58b74"
		},
		"70ef64f6-1f6d-4382-ba55-ed32e5b0f32d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "804.4959959621556,115.625 944.8953479537222,115.625",
			"sourceSymbol": "73e492fe-332b-4881-9b20-95e555da2c1f",
			"targetSymbol": "b4b752e1-2e78-4684-80b6-ab6fe4329b40",
			"object": "b4691250-a1d1-4fa9-9848-427128b553ca"
		},
		"b4b752e1-2e78-4684-80b6-ab6fe4329b40": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 923.8953479537222,
			"y": 94.75,
			"object": "096f7aff-6c65-4164-b004-9721573851a9"
		},
		"a6823493-38b8-431e-96f8-96beadbdec4a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "944.8953479537222,115.8125 1018.234130859375,115.8125 1018.234130859375,34.8125 1120.6353971939939,34.8125",
			"sourceSymbol": "b4b752e1-2e78-4684-80b6-ab6fe4329b40",
			"targetSymbol": "f9a5a0f9-ccaa-4f43-8aa5-0235c79d35ed",
			"object": "ab38d669-f7b8-409c-b72f-28321aa8ba7d"
		},
		"f9a5a0f9-ccaa-4f43-8aa5-0235c79d35ed": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1070.6353971939939,
			"y": 4.875,
			"width": 100,
			"height": 60,
			"object": "b4206345-8bbe-4a8e-8d19-2612a9bc0819"
		},
		"0011b8b0-f7ee-4762-848c-582cbba7bdc8": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1120.6353971939939,34.875 1229.3515625,34.875 1229.3515625,106.9375 1308.567626953125,106.9375",
			"sourceSymbol": "f9a5a0f9-ccaa-4f43-8aa5-0235c79d35ed",
			"targetSymbol": "735683ca-425e-4919-b0de-110e2fff2147",
			"object": "b5afe764-5ea6-4b7c-834e-bc8edadc4fd0"
		},
		"735683ca-425e-4919-b0de-110e2fff2147": {
			"classDefinition": "com.sap.bpm.wfs.ui.ParallelGatewaySymbol",
			"x": 1287.567626953125,
			"y": 85.9375,
			"object": "b622581b-2fc7-4cc6-be09-0c5d7846df82"
		},
		"aba8e4ce-54ea-48de-bac7-19ae9fdaf108": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1308.567626953125,106.953125 1448.0182024274663,106.953125",
			"sourceSymbol": "735683ca-425e-4919-b0de-110e2fff2147",
			"targetSymbol": "19cafb1e-96bb-475e-9e38-d2adacc1423f",
			"object": "8cb85070-d1bf-4f84-8c98-15693d35b2b9"
		},
		"45d4ccc5-58b7-43fd-ae0f-0c46ce263f9f": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1071,
			"y": 178,
			"width": 100,
			"height": 60,
			"object": "d43e464d-8d72-4a08-9dd5-f56564884f20"
		},
		"4dc9878d-e481-40b1-b388-e5ad8c7173c2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "944.8953479537222,115.75 1018.4476318359375,115.75 1018.4476318359375,208 1071,208",
			"sourceSymbol": "b4b752e1-2e78-4684-80b6-ab6fe4329b40",
			"targetSymbol": "45d4ccc5-58b7-43fd-ae0f-0c46ce263f9f",
			"object": "dc7f281b-41f7-47f5-b3ed-058b5d5a3471"
		},
		"1f5ebb0b-48d1-47bf-a379-a8764292fec7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1121,208 1229.5338134765625,208 1229.5338134765625,106.9375 1287.567626953125,106.9375",
			"sourceSymbol": "45d4ccc5-58b7-43fd-ae0f-0c46ce263f9f",
			"targetSymbol": "735683ca-425e-4919-b0de-110e2fff2147",
			"object": "79c5d20e-b200-4db9-8836-d766a9a6bef6"
		},
		"19cafb1e-96bb-475e-9e38-d2adacc1423f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1398.0182024274663,
			"y": 76.96875,
			"width": 100,
			"height": 60,
			"object": "1b5d9203-06c9-4624-a7d4-7e1bc32d1760"
		},
		"a9023db1-c05f-4f65-8ae6-13db871cbcf7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1448.0182024274663,107.2265625 1591.0977231354568,107.2265625",
			"sourceSymbol": "19cafb1e-96bb-475e-9e38-d2adacc1423f",
			"targetSymbol": "b5971cbf-700f-4321-98e1-163fcd117737",
			"object": "32bc5b48-665d-4c19-bc88-4eca9874fd24"
		},
		"b5971cbf-700f-4321-98e1-163fcd117737": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1570.0977231354568,
			"y": 86.484375,
			"object": "7f06edfb-48c9-4f4c-9720-33320378ac2d"
		},
		"180ef1a2-a3cd-4d83-a31d-7572c63ed37c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1591.0977231354568,107.2421875 1750,107.2421875",
			"sourceSymbol": "b5971cbf-700f-4321-98e1-163fcd117737",
			"targetSymbol": "9eb3e009-fc47-45e7-b3d7-1ef146514c7c",
			"object": "ec4aa89d-c864-4780-aaef-7b03529a5845"
		},
		"8834e354-079f-4093-94af-c7e5cce87fd7": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 407,
			"y": 412,
			"width": 100,
			"height": 60,
			"object": "8b3344e2-519b-444b-a926-85829f2c5f0f"
		},
		"29b1a409-7e8a-4a25-ad62-db6a2d930522": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "457,445 119,445 119,116",
			"sourceSymbol": "8834e354-079f-4093-94af-c7e5cce87fd7",
			"targetSymbol": "9bffa0e7-245b-4ad5-a49b-cd4d997ff864",
			"object": "02695575-a2aa-40ba-a857-34f8ace36f98"
		},
		"89f403a2-0c07-4d6d-b423-bad88d63a76f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1591.0977231354568,107.484375 1591.0977783203125,-113 118.375,-113 118.375,95",
			"sourceSymbol": "b5971cbf-700f-4321-98e1-163fcd117737",
			"targetSymbol": "9bffa0e7-245b-4ad5-a49b-cd4d997ff864",
			"object": "08744352-4243-41f8-8fa1-b8438a6a2535"
		},
		"9eb3e009-fc47-45e7-b3d7-1ef146514c7c": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1700,
			"y": 77,
			"width": 100,
			"height": 60,
			"object": "22ce8d30-c74b-4354-92fe-94ed6ec6aac3"
		},
		"6e697638-f31d-4d46-8ed9-ddffa9727903": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1750,107 1890,107",
			"sourceSymbol": "9eb3e009-fc47-45e7-b3d7-1ef146514c7c",
			"targetSymbol": "ac09f365-0dd4-4596-9b23-7f6da896ce8b",
			"object": "c200d5d4-9350-4fd6-bb86-9b977d9a754f"
		},
		"23154b74-c6f6-4ee2-bf85-27798da9db07": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 168.0625,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "ae55aa5e-821b-41ba-8f47-2bc9bea722d4"
		},
		"e584f45a-f0b8-403c-87ae-52aa34a622a1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "218.0625,116 317.75,116",
			"sourceSymbol": "23154b74-c6f6-4ee2-bf85-27798da9db07",
			"targetSymbol": "6577ed32-84a2-4848-b0ce-fc0076aa4e00",
			"object": "ec1c401c-c26d-495b-bd53-ef84540834ff"
		},
		"93a67d47-1a0f-4c71-a2cf-267f0ab5cb55": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 3,
			"maildefinition": 1,
			"hubapireference": 1,
			"sequenceflow": 36,
			"startevent": 1,
			"endevent": 1,
			"usertask": 8,
			"servicetask": 2,
			"scripttask": 8,
			"mailtask": 1,
			"exclusivegateway": 4,
			"parallelgateway": 4
		},
		"bba35ec3-22f3-4eb7-a7ea-a7cfc140d0e4": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "P1D",
			"id": "timereventdefinition2"
		},
		"e6bece8a-72d2-461c-960f-f7a365c5ef51": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "PT12H",
			"id": "timereventdefinition3"
		}
	}
}
