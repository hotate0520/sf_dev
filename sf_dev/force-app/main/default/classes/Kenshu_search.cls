global with sharing class Kenshu_search extends SkyEditor2.SkyEditorPageBaseWithSharing{
	public Training__c record{get;set;}
	public Component3 Component3 {get; private set;}
	public SkyEditor2.RecordTypeSelector recordTypeSelector {get; private set;}
	public Training__c Component6_val {get;set;}
	public SkyEditor2.TextHolder Component6_op{get;set;}
	public SkyEditor2__SkyEditorDummy__c Component8_val {get;set;}
	public SkyEditor2.TextHolder Component8_op{get;set;}
	public List<SelectOption> valueOptions_Training_c_Status_c {get;set;}
	public SkyEditor2__SkyEditorDummy__c Component10_val {get;set;}
	public SkyEditor2.TextHolder Component10_op{get;set;}
	public SkyEditor2__SkyEditorDummy__c Component12_val {get;set;}
	public SkyEditor2.TextHolder Component12_op{get;set;}
	public SkyEditor2__SkyEditorDummy__c Component14_val {get;set;}
	public SkyEditor2.TextHolder Component14_op{get;set;}
	public SkyEditor2__SkyEditorDummy__c Component16_val {get;set;}
	public SkyEditor2.TextHolder Component16_op{get;set;}
	public SkyEditor2__SkyEditorDummy__c Component18_val {get;set;}
	public SkyEditor2__SkyEditorDummy__c Component18_val_dummy {get;set;}
	public SkyEditor2.TextHolder Component18_op{get;set;}
	public List<SelectOption> valueOptions_Training_c_Status_c_multi {get;set;}
	public String recordTypeRecordsJSON_Training_c {get; private set;}
	public String defaultRecordTypeId_Training_c {get; private set;}
	public String metadataJSON_Training_c {get; private set;}
	{
	setApiVersion(42.0);
	}
	public Kenshu_search(ApexPages.StandardController controller){
		super(controller);

		SObjectField f;

		f = Training__c.fields.Accout__c;
		f = Training__c.fields.Status__c;
		f = Training__c.fields.Name;
		f = Training__c.fields.Instructor__c;
		f = Training__c.fields.KaisaibiStart__c;
		f = Training__c.fields.KaisaibiEnd__c;
		f = Training__c.fields.ContactPerson__c;
		f = Training__c.fields.TrainingContent__c;
		f = Training__c.fields.KaisaiBasho__c;

		List<RecordTypeInfo> recordTypes;
		try {
			mainRecord = null;
			mainSObjectType = Training__c.SObjectType;
			mode = SkyEditor2.LayoutMode.TempSearch_01; 
			Training__c lookupObjComponent38 = new Training__c();
			Component6_val = lookupObjComponent38;
			Component6_op = new SkyEditor2.TextHolder();
			Component8_val = new SkyEditor2__SkyEditorDummy__c();
			Component8_op = new SkyEditor2.TextHolder('eq');
			valueOptions_Training_c_Status_c = new List<SelectOption>{new SelectOption('', Label.none)};
			for (PicklistEntry e : Training__c.Status__c.getDescribe().getPicklistValues()) {
				if (e.isActive()) {valueOptions_Training_c_Status_c.add(new SelectOption(e.getValue(), e.getLabel()));}
			}
			Component10_val = new SkyEditor2__SkyEditorDummy__c();
			Component10_op = new SkyEditor2.TextHolder();
			Component12_val = new SkyEditor2__SkyEditorDummy__c();
			Component12_op = new SkyEditor2.TextHolder();
			Component14_val = new SkyEditor2__SkyEditorDummy__c();
			Component14_op = new SkyEditor2.TextHolder();
			Component16_val = new SkyEditor2__SkyEditorDummy__c();
			Component16_op = new SkyEditor2.TextHolder();
			Component18_val = new SkyEditor2__SkyEditorDummy__c();
			Component18_val_dummy = new SkyEditor2__SkyEditorDummy__c();
			Component18_op = new SkyEditor2.TextHolder();
			valueOptions_Training_c_Status_c_multi = new List<SelectOption>{new SelectOption('', Label.none)};
			for (PicklistEntry e : Training__c.Status__c.getDescribe().getPicklistValues()) {
				if (e.isActive()) {valueOptions_Training_c_Status_c_multi.add(new SelectOption(e.getValue(), e.getLabel()));}
			}
			queryMap.put(
				'Component3',
				new SkyEditor2.Query('Training__c')
					.addField('Accout__c')
					.addField('ContactPerson__c')
					.addField('Status__c')
					.addField('Name')
					.addField('TrainingContent__c')
					.addField('KaisaibiStart__c')
					.addField('KaisaibiEnd__c')
					.addField('KaisaiBasho__c')
					.limitRecords(500)
					.addListener(new SkyEditor2.QueryWhereRegister(Component6_val, 'Accout__c', 'Accout__c', Component6_op, true, 0, false ))
					.addListener(new SkyEditor2.QueryWhereRegister(Component8_val, 'SkyEditor2__Text__c', 'Status__c', Component8_op, true, 0, false ))
					.addListener(new SkyEditor2.QueryWhereRegister(Component10_val, 'SkyEditor2__Text__c', 'Name', Component10_op, true, 0, false ))
					.addListener(new SkyEditor2.QueryWhereRegister(Component12_val, 'SkyEditor2__Text__c', 'Instructor__c', Component12_op, true, 0, false ))
					.addListener(new SkyEditor2.QueryWhereRegister(Component14_val, 'SkyEditor2__Date__c', 'KaisaibiStart__c', Component14_op, true, 0, false ))
					.addListener(new SkyEditor2.QueryWhereRegister(Component16_val, 'SkyEditor2__Date__c', 'KaisaibiEnd__c', Component16_op, true, 0, false ))
					.addListener(new SkyEditor2.QueryWhereRegister(Component18_val_dummy, 'SkyEditor2__Text__c','Status__c', Component18_op, true, 1, false ))
				);
			Component3 = new Component3(new List<Training__c>(), new List<Component3Item>(), new List<Training__c>(), null);
			listItemHolders.put('Component3', Component3);
			recordTypeSelector = new SkyEditor2.RecordTypeSelector(Training__c.SObjectType, true);
			p_showHeader = true;
			p_sidebar = true;
			execInitialSearch = false;
			presetSystemParams();
			Component3.extender = this.extender;
			initSearch();
		} catch (SkyEditor2.Errors.SObjectNotFoundException e) {
			SkyEditor2.Messages.addErrorMessage(e.getMessage());
		} catch (SkyEditor2.Errors.FieldNotFoundException e) {
			SkyEditor2.Messages.addErrorMessage(e.getMessage());
		} catch (SkyEditor2.ExtenderException e) {
			 e.setMessagesToPage();
		} catch (Exception e) {
			System.Debug(LoggingLevel.Error, e);
			SkyEditor2.Messages.addErrorMessage(SkyEditor2.Messages.UNKNOWN_ERROR);
		}
	}
	public List<SelectOption> getOperatorOptions_Training_c_Accout_c() { 
		return getOperatorOptions('Training__c', 'Accout__c');
	}
	public List<SelectOption> getOperatorOptions_Training_c_Status_c() { 
		return getOperatorOptions('Training__c', 'Status__c');
	}
	public List<SelectOption> getOperatorOptions_Training_c_Name() { 
		return getOperatorOptions('Training__c', 'Name');
	}
	public List<SelectOption> getOperatorOptions_Training_c_Instructor_c() { 
		return getOperatorOptions('Training__c', 'Instructor__c');
	}
	public List<SelectOption> getOperatorOptions_Training_c_KaisaibiStart_c() { 
		return getOperatorOptions('Training__c', 'KaisaibiStart__c');
	}
	public List<SelectOption> getOperatorOptions_Training_c_KaisaibiEnd_c() { 
		return getOperatorOptions('Training__c', 'KaisaibiEnd__c');
	}
	public List<SelectOption> getOperatorOptions_Training_c_Status_c_multi() { 
		return SkyEditor2.WhereOperatorOptions.getOperatorOptionsSelectIn(); 
	}
	global with sharing class Component3Item extends SkyEditor2.ListItem {
		public Training__c record{get; private set;}
		@TestVisible
		Component3Item(Component3 holder, Training__c record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
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
	global with sharing  class Component3 extends SkyEditor2.ListItemHolder {
		public List<Component3Item> items{get; private set;}
		@TestVisible
			Component3(List<SObject> records, List<SkyEditor2.ListItem> items, List<SObject> deleteRecords, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(records, items, deleteRecords, recordTypeSelector);
			this.items = (List<Component3Item>)items;
		}
		global override SkyEditor2.ListItem create(SObject data) {
			return new Component3Item(this, (Training__c)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}

	public Training__c Component3_table_Conversion { get { return new Training__c();}}
	
	public String Component3_table_selectval { get; set; }
	
	
}