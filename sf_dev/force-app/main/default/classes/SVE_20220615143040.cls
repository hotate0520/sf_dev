global with sharing class SVE_20220615143040 extends SkyEditor2.SkyEditorPageBaseWithSharing {
	public Training__c record {get{return (Training__c)mainRecord;}}
	public String recordTypeRecordsJSON_Training_c {get; private set;}
	public String defaultRecordTypeId_Training_c {get; private set;}
	public String metadataJSON_Training_c {get; private set;}
	public String picklistValuesJSON_Training_c_Manual_c {get; private set;}
	public String picklistValuesJSON_Training_c_ManualSendingOrBringing_c {get; private set;}
	public String picklistValuesJSON_Training_c_Marker_c {get; private set;}
	public String Component38_hidden { get; set; }
	public String Component79_hidden { get; set; }
	public Component116 Component116 {get; private set;}
	{
	setApiVersion(42.0);
	}
	public SVE_20220615143040(ApexPages.StandardController controller) {
		super(controller);

		SObjectField f;

		f = Training__c.fields.Name;
		f = Training__c.fields.Status__c;
		f = Training__c.fields.TrainingContent__c;
		f = Training__c.fields.KaisaiBasho__c;
		f = Training__c.fields.Accout__c;
		f = Training__c.fields.KaisaibiStart__c;
		f = Training__c.fields.ContactPerson__c;
		f = Training__c.fields.KaisaibiEnd__c;
		f = Training__c.fields.Participant__c;
		f = Training__c.fields.Instructor__c;
		f = Training__c.fields.Manual__c;
		f = Training__c.fields.ManualSendingOrBringing__c;
		f = Training__c.fields.MattersContact__c;
		f = Training__c.fields.Receptiontable__c;
		f = Training__c.fields.Flip__c;
		f = Training__c.fields.FileClear__c;
		f = Training__c.fields.VideoCamera__c;
		f = Training__c.fields.File2hole__c;
		f = Training__c.fields.VoiceRecording__c;
		f = Training__c.fields.Projector__c;
		f = Training__c.fields.Questionnaire__c;
		f = Training__c.fields.Whiteboard__c;
		f = Training__c.fields.Questionnaire_Pen__c;
		f = Training__c.fields.Marker__c;
		f = Training__c.fields.Clip__c;
		f = Training__c.fields.InstructorPC__c;
		f = Training__c.fields.InstructorLunch__c;
		f = Training__c.fields.InstructorDrink__c;
		f = Task.fields.Subject;
		f = Task.fields.IsClosed;
		f = Task.fields.ActivityDate;

		List<RecordTypeInfo> recordTypes;
		FilterMetadataResult filterResult;
		List<RecordType> recordTypeRecords_Training_c = [SELECT Id, DeveloperName, NamespacePrefix FROM RecordType WHERE SobjectType = 'Training__c'];
		Map<Id, RecordType> recordTypeMap_Training_c = new Map<Id, RecordType>(recordTypeRecords_Training_c);
		List<RecordType> availableRecordTypes_Training_c = new List<RecordType>();
		recordTypes = SObjectType.Training__c.getRecordTypeInfos();

		for (RecordTypeInfo t: recordTypes) {
			if (t.isDefaultRecordTypeMapping()) {
				defaultRecordTypeId_Training_c = t.getRecordTypeId();
			}
			if (t.isAvailable()) {
				RecordType rtype = recordTypeMap_Training_c.get(t.getRecordTypeId());
				if (rtype != null) {
					availableRecordTypes_Training_c.add(rtype);
				}
			}
		}
		recordTypeRecordsJSON_Training_c = System.JSON.serialize(availableRecordTypes_Training_c);
		filterResult = filterMetadataJSON(
			System.JSON.deserializeUntyped('{"CustomObject": {"recordTypes": []}}'),
			recordTypeFullNames(availableRecordTypes_Training_c),
			Training__c.SObjectType
		);
		metadataJSON_Training_c = System.JSON.serialize(filterResult.data);
		picklistValuesJSON_Training_c_Manual_c = System.JSON.serialize(filterPricklistEntries(Training__c.SObjectType.Manual__c.getDescribe(), filterResult));
		picklistValuesJSON_Training_c_ManualSendingOrBringing_c = System.JSON.serialize(filterPricklistEntries(Training__c.SObjectType.ManualSendingOrBringing__c.getDescribe(), filterResult));
		picklistValuesJSON_Training_c_Marker_c = System.JSON.serialize(filterPricklistEntries(Training__c.SObjectType.Marker__c.getDescribe(), filterResult));
		try {
			mainSObjectType = Training__c.SObjectType;
			setPageReferenceFactory(new PageReferenceFactory());
			sve_ClassName = 'SVE_20220615143040';
			mainQuery = new SkyEditor2.Query('Training__c');
			mainQuery.addField('Name');
			mainQuery.addField('Status__c');
			mainQuery.addField('TrainingContent__c');
			mainQuery.addField('KaisaiBasho__c');
			mainQuery.addField('Accout__c');
			mainQuery.addField('KaisaibiStart__c');
			mainQuery.addField('ContactPerson__c');
			mainQuery.addField('KaisaibiEnd__c');
			mainQuery.addField('Participant__c');
			mainQuery.addField('Instructor__c');
			mainQuery.addField('Manual__c');
			mainQuery.addField('ManualSendingOrBringing__c');
			mainQuery.addField('MattersContact__c');
			mainQuery.addField('Receptiontable__c');
			mainQuery.addField('Flip__c');
			mainQuery.addField('FileClear__c');
			mainQuery.addField('VideoCamera__c');
			mainQuery.addField('File2hole__c');
			mainQuery.addField('VoiceRecording__c');
			mainQuery.addField('Projector__c');
			mainQuery.addField('Questionnaire__c');
			mainQuery.addField('Whiteboard__c');
			mainQuery.addField('Questionnaire_Pen__c');
			mainQuery.addField('Marker__c');
			mainQuery.addField('Clip__c');
			mainQuery.addField('InstructorPC__c');
			mainQuery.addField('InstructorLunch__c');
			mainQuery.addField('InstructorDrink__c');
			mainQuery.addWhere('Id', mainRecord.Id, SkyEditor2.WhereOperator.Eq)
				.limitRecords(1);
			mode = SkyEditor2.LayoutMode.LayoutSalesforce; 
			queryMap = new Map<String, SkyEditor2.Query>();
			SkyEditor2.Query query;
			Component116 = new Component116(new List<Task>(), new List<Component116Item>(), new List<Task>(), null);
			listItemHolders.put('Component116', Component116);
			query = new SkyEditor2.Query('Task');
			query.addFieldAsOutput('Subject');
			query.addFieldAsOutput('IsClosed');
			query.addFieldAsOutput('ActivityDate');
			query.addWhere('WhatId', mainRecord.Id, SkyEditor2.WhereOperator.Eq);
			relationFields.put('Component116', 'WhatId');
			Component116.queryRelatedEvent = False;
			query.limitRecords(500);
			queryMap.put('Component116', query);
			registRelatedList('Tasks', 'Component116');
			p_showHeader = true;
			p_sidebar = true;
			init();
			Component116.extender = this.extender;
			if (record.Id == null) {
				saveOldValues();
			}


        } catch (SkyEditor2.Errors.FieldNotFoundException e) { fieldNotFound(e);
        } catch (SkyEditor2.Errors.RecordNotFoundException e) { recordNotFound(e);
        } catch (SkyEditor2.ExtenderException e) { e.setMessagesToPage();
        }
	}

	@TestVisible
		private void sObjectNotFound(SkyEditor2.Errors.SObjectNotFoundException e) {
		SkyEditor2.Messages.addErrorMessage(e.getMessage());
		hidePageBody = true;
	}
	@TestVisible
		private void fieldNotFound(SkyEditor2.Errors.FieldNotFoundException e) {
		SkyEditor2.Messages.addErrorMessage(e.getMessage());
		hidePageBody = true;
	}
	@TestVisible
		private void recordNotFound(SkyEditor2.Errors.RecordNotFoundException e) {
		SkyEditor2.Messages.addErrorMessage(e.getMessage());
		hidePageBody = true;
	}

	global with sharing class Component116Item extends SkyEditor2.ListItem {
		public Task record{get; private set;}
		@TestVisible
		Component116Item(Component116 holder, Task record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(holder);
			if (record.Id == null ){
				if (recordTypeSelector != null) {
					recordTypeSelector.applyDefault(record);
				}
			}
			this.record = record;
		}
		global override SObject getRecord() {return record;}
		public void doDeleteItem(){deleteItem();}
	}
	global with sharing  class Component116 extends SkyEditor2.ListItemHolder {
		public List<Component116Item> items{get; private set;}
		@TestVisible
			Component116(List<SObject> records, List<SkyEditor2.ListItem> items, List<SObject> deleteRecords, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(records, items, deleteRecords, recordTypeSelector);
			this.items = (List<Component116Item>)items;
		}
		global override SkyEditor2.ListItem create(SObject data) {
			return new Component116Item(this, (Task)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}
	public String getComponent38OptionsJS() {
		return SkyEditor2.JSON.stringify(SkyEditor2.PicklistValueSelector.getEntries(
		Training__c.getSObjectType(),
		SObjectType.Training__c.fields.Manual__c.getSObjectField()
		));
		}
	public String getComponent41OptionsJS() {
		return SkyEditor2.JSON.stringify(SkyEditor2.PicklistValueSelector.getEntries(
		Training__c.getSObjectType(),
		SObjectType.Training__c.fields.ManualSendingOrBringing__c.getSObjectField()
		));
		}
	public String getComponent79OptionsJS() {
		return SkyEditor2.JSON.stringify(SkyEditor2.PicklistValueSelector.getEntries(
		Training__c.getSObjectType(),
		SObjectType.Training__c.fields.Marker__c.getSObjectField()
		));
		}
	@TestVisible		static Set<String> recordTypeFullNames(RecordType[] records) {
		Set<String> result = new Set<String>();
		for (RecordType r : records) {
			result.add(r.DeveloperName);
			if (r.NamespacePrefix != null) {
				result.add(r.NamespacePrefix + '__' + r.DeveloperName);
			}
		}
		return result;
	}
	
	@TestVisible		static FilterMetadataResult filterMetadataJSON(Object metadata, Set<String> recordTypeFullNames, SObjectType soType) {
		Map<String, Object> metadataMap = (Map<String, Object>) metadata;
		Map<String, Object> customObject = (Map<String, Object>) metadataMap.get('CustomObject');
		List<Object> recordTypes = (List<Object>) customObject.get('recordTypes');
		Map<String, Set<String>> availableEntries = new Map<String, Set<String>>();
		for (Integer i = recordTypes.size() - 1; i >= 0; i--) {
			Map<String, Object> recordType = (Map<String, Object>)recordTypes[i];
			String fullName = (String)recordType.get('fullName');
			if (! recordTypeFullNames.contains(fullName)) {
				recordTypes.remove(i);
			} else {
				addAll(availableEntries, getOutEntries(recordType, soType));
			}
		}	
		return new FilterMetadataResult(metadataMap, availableEntries, recordTypes.size() == 0);
	}
	public class FilterMetadataResult {
		public Map<String, Object> data {get; private set;}
		public Map<String, Set<String>> availableEntries {get; private set;}
		public Boolean master {get; private set;}
		public FilterMetadataResult(Map<String, Object> data, Map<String, Set<String>> availableEntries, Boolean master) {
			this.data = data;
			this.availableEntries = availableEntries;
			this.master = master;
		}
	}
	
	static void addAll(Map<String, Set<String>> toMap, Map<String, Set<String>> fromMap) {
		for (String key : fromMap.keySet()) {
			Set<String> fromSet = fromMap.get(key);
			Set<String> toSet = toMap.get(key);
			if (toSet == null) {
				toSet = new Set<String>();
				toMap.put(key, toSet);
			}
			toSet.addAll(fromSet);
		}
	}

	static Map<String, Set<String>> getOutEntries(Map<String, Object> recordType, SObjectType soType) {
		Map<String, Set<String>> result = new Map<String, Set<String>>();
		List<Object> entries = (List<Object>)recordType.get('picklistValues');
		Map<String, SObjectField> fields = soType.getDescribe().fields.getMap();
		for (Object e : entries) {
			Map<String, Object> entry = (Map<String, Object>) e;
			String picklist = (String) entry.get('picklist');
			SObjectField f = fields.get(picklist);
			List<Object> values = (List<Object>)(entry.get('values'));
			if (f != null && f.getDescribe().isAccessible()) {
				Set<String> entrySet = new Set<String>();
				for (Object v : values) {
					Map<String, Object> value = (Map<String, Object>) v;
					entrySet.add(EncodingUtil.urlDecode((String)value.get('fullName'), 'utf-8'));
				}
				result.put(picklist, entrySet);
			} else { 
				values.clear(); 
			}
		}
		return result;
	}
	
	static List<PicklistEntry> filterPricklistEntries(DescribeFieldResult f, FilterMetadataResult parseResult) {
		List<PicklistEntry> all = f.getPicklistValues();
		if (parseResult.master) {
			return all;
		}
		Set<String> availables = parseResult.availableEntries.get(f.getName());
		List<PicklistEntry> result = new List<PicklistEntry>();
		if(availables == null) return result;
		for (PicklistEntry e : all) {
			if (e.isActive() && availables.contains(e.getValue())) {
				result.add(e);
			}
		}
		return result;
	}
	
	with sharing class PageReferenceFactory implements SkyEditor2.PageReferenceFactory.Implementation {
        public PageReference newPageReference(String url) {
            return new PageReference(url);
        }
    }
}