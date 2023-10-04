global with sharing class GuestSearch_comp extends SkyEditor2.SkyEditorPageBaseWithSharing{
	public GuestMaster__c record{get;set;}
	public Component3 Component3 {get; private set;}
	public SkyEditor2.RecordTypeSelector recordTypeSelector {get; private set;}
	public SkyEditor2__SkyEditorDummy__c Component6_val {get;set;}
	public SkyEditor2.TextHolder Component6_op{get;set;}
	public SkyEditor2__SkyEditorDummy__c Component8_val {get;set;}
	public SkyEditor2.TextHolder Component8_op{get;set;}
	public String recordTypeRecordsJSON_GuestMaster_c {get; private set;}
	public String defaultRecordTypeId_GuestMaster_c {get; private set;}
	public String metadataJSON_GuestMaster_c {get; private set;}
	{
	setApiVersion(42.0);
	}
	public GuestSearch_comp(ApexPages.StandardController controller){
		super(controller);

		SObjectField f;

		f = GuestMaster__c.fields.Customer__c;
		f = GuestMaster__c.fields.Tel__c;
		f = GuestMaster__c.fields.Address__c;
		f = GuestMaster__c.fields.PostCode__c;
		f = GuestMaster__c.fields.Name;

		List<RecordTypeInfo> recordTypes;
		try {
			mainRecord = null;
			mainSObjectType = GuestMaster__c.SObjectType;
			mode = SkyEditor2.LayoutMode.TempSearch_01; 
			Component6_val = new SkyEditor2__SkyEditorDummy__c();
			Component6_op = new SkyEditor2.TextHolder('co');
			Component8_val = new SkyEditor2__SkyEditorDummy__c();
			Component8_op = new SkyEditor2.TextHolder('co');
			queryMap.put(
				'Component3',
				new SkyEditor2.Query('GuestMaster__c')
					.addFieldAsOutput('Customer__c')
					.addFieldAsOutput('Address__c')
					.addFieldAsOutput('Tel__c')
					.addFieldAsOutput('PostCode__c')
					.addFieldAsOutput('Name')
					.limitRecords(500)
					.addListener(new SkyEditor2.QueryWhereRegister(Component6_val, 'SkyEditor2__Text__c', 'Customer__c', Component6_op, true, 0, true ))
					.addListener(new SkyEditor2.QueryWhereRegister(Component8_val, 'SkyEditor2__Phone__c', 'Tel__c', Component8_op, true, 0, true ))
				);
			Component3 = new Component3(new List<GuestMaster__c>(), new List<Component3Item>(), new List<GuestMaster__c>(), null);
			Component3.ignoredOnSave = true;
			listItemHolders.put('Component3', Component3);
			recordTypeSelector = new SkyEditor2.RecordTypeSelector(GuestMaster__c.SObjectType, true);
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
	public List<SelectOption> getOperatorOptions_GuestMaster_c_Customer_c() { 
		return getOperatorOptions('GuestMaster__c', 'Customer__c');
	}
	public List<SelectOption> getOperatorOptions_GuestMaster_c_Tel_c() { 
		return getOperatorOptions('GuestMaster__c', 'Tel__c');
	}
	global with sharing class Component3Item extends SkyEditor2.ListItem {
		public GuestMaster__c record{get; private set;}
		@TestVisible
		Component3Item(Component3 holder, GuestMaster__c record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
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
			return new Component3Item(this, (GuestMaster__c)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}

}