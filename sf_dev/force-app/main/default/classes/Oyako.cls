global with sharing class Oyako extends SkyEditor2.SkyEditorPageBaseWithSharing {
	public Account record {get{return (Account)mainRecord;}}
	public Component6 Component6 {get; private set;}
	public Component8 Component8 {get; private set;}
	{
	setApiVersion(42.0);
	}
	public Oyako(ApexPages.StandardController controller) {
		super(controller);

		SObjectField f;

		f = Account.fields.Name;
		f = Account.fields.BillingPostalCode;
		f = Account.fields.BillingState;
		f = Account.fields.BillingCity;
		f = Account.fields.BillingStreet;
		f = Account.fields.Phone;
		f = Account.fields.Fax;
		f = Contact.fields.LastName;
		f = Contact.fields.FirstName;
		f = Contact.fields.Department;
		f = Contact.fields.Title;
		f = Contact.fields.Phone;
		f = Contact.fields.Email;
		f = Training__c.fields.Name;
		f = Training__c.fields.KaisaibiStart__c;
		f = Training__c.fields.KaisaibiEnd__c;
		f = Training__c.fields.KaisaiBasho__c;
		f = Training__c.fields.Status__c;
		f = Training__c.fields.TrainingContent__c;

		List<RecordTypeInfo> recordTypes;
		try {
			mainSObjectType = Account.SObjectType;
			setPageReferenceFactory(new PageReferenceFactory());
			sve_ClassName = 'Oyako';
			mainQuery = new SkyEditor2.Query('Account');
			mainQuery.addField('Name');
			mainQuery.addField('BillingPostalCode');
			mainQuery.addField('BillingState');
			mainQuery.addField('BillingCity');
			mainQuery.addField('BillingStreet');
			mainQuery.addField('Phone');
			mainQuery.addField('Fax');
			mainQuery.addWhere('Id', mainRecord.Id, SkyEditor2.WhereOperator.Eq)
				.limitRecords(1);
			mode = SkyEditor2.LayoutMode.TempRegistParentAndChild_01; 
			queryMap = new Map<String, SkyEditor2.Query>();
			SkyEditor2.Query query;
			Component6 = new Component6(new List<Contact>(), new List<Component6Item>(), new List<Contact>(), null);
			listItemHolders.put('Component6', Component6);
			query = new SkyEditor2.Query('Contact');
			query.addField('LastName');
			query.addField('FirstName');
			query.addField('Department');
			query.addField('Title');
			query.addField('Phone');
			query.addField('Email');
			query.addWhere('AccountId', mainRecord.Id, SkyEditor2.WhereOperator.Eq);
			relationFields.put('Component6', 'AccountId');
			Component6.queryRelatedEvent = False;
			query.limitRecords(500);
			queryMap.put('Component6', query);
			Component8 = new Component8(new List<Training__c>(), new List<Component8Item>(), new List<Training__c>(), null);
			listItemHolders.put('Component8', Component8);
			query = new SkyEditor2.Query('Training__c');
			query.addField('Name');
			query.addField('KaisaibiStart__c');
			query.addField('KaisaibiEnd__c');
			query.addField('KaisaiBasho__c');
			query.addField('Status__c');
			query.addField('TrainingContent__c');
			query.addWhere('Accout__c', mainRecord.Id, SkyEditor2.WhereOperator.Eq);
			relationFields.put('Component8', 'Accout__c');
			Component8.queryRelatedEvent = False;
			query.limitRecords(500);
			queryMap.put('Component8', query);
			registRelatedList('Contacts', 'Component6');
			registRelatedList('kennsyuPtlZ__r', 'Component8');
			p_showHeader = true;
			p_sidebar = true;
			init();
			Component6.extender = this.extender;
			Component8.extender = this.extender;
			if (record.Id == null) {
				saveOldValues();
				 if((ApexPages.currentPage().getParameters().get('clone') == null || Decimal.valueOf(ApexPages.currentPage().getParameters().get('clone')) != 1) && Contact.fields.AccountId.getDescribe().createable){
					 for (Integer i = 0; i < 1; i++) {
						 Component6.add();
					 }
				 }
				 if((ApexPages.currentPage().getParameters().get('clone') == null || Decimal.valueOf(ApexPages.currentPage().getParameters().get('clone')) != 1) && Training__c.fields.Accout__c.getDescribe().createable){
					 for (Integer i = 0; i < 1; i++) {
						 Component8.add();
					 }
				 }
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

	global with sharing class Component6Item extends SkyEditor2.ListItem {
		public Contact record{get; private set;}
		@TestVisible
		Component6Item(Component6 holder, Contact record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
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
	global with sharing  class Component6 extends SkyEditor2.ListItemHolder {
		public List<Component6Item> items{get; private set;}
		@TestVisible
			Component6(List<SObject> records, List<SkyEditor2.ListItem> items, List<SObject> deleteRecords, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(records, items, deleteRecords, recordTypeSelector);
			this.items = (List<Component6Item>)items;
		}
		global override SkyEditor2.ListItem create(SObject data) {
			return new Component6Item(this, (Contact)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}
	global with sharing class Component8Item extends SkyEditor2.ListItem {
		public Training__c record{get; private set;}
		@TestVisible
		Component8Item(Component8 holder, Training__c record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
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
	global with sharing  class Component8 extends SkyEditor2.ListItemHolder {
		public List<Component8Item> items{get; private set;}
		@TestVisible
			Component8(List<SObject> records, List<SkyEditor2.ListItem> items, List<SObject> deleteRecords, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(records, items, deleteRecords, recordTypeSelector);
			this.items = (List<Component8Item>)items;
		}
		global override SkyEditor2.ListItem create(SObject data) {
			return new Component8Item(this, (Training__c)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}
	with sharing class PageReferenceFactory implements SkyEditor2.PageReferenceFactory.Implementation {
        public PageReference newPageReference(String url) {
            return new PageReference(url);
        }
    }
}