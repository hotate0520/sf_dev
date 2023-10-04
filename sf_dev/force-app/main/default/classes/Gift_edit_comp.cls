global with sharing class Gift_edit_comp extends SkyEditor2.SkyEditorPageBaseWithSharing {
	public GiftOrder__c record {get{return (GiftOrder__c)mainRecord;}}
	public Component13 Component13 {get; private set;}
	{
	setApiVersion(42.0);
	}
	public Gift_edit_comp(ApexPages.StandardController controller) {
		super(controller);
		registTransitionControl='/apex/Gift_view_comp?id={ID}';
		editTransitionControl='/apex/Gift_view_comp?id={ID}';
		deleteTransitionControl='/apex/Gift_view_comp';

		SObjectField f;

		f = GiftOrder__c.fields.ClientNo__c;
		f = GiftOrder__c.fields.ClientName__c;
		f = GiftOrder__c.fields.ClientTel__c;
		f = GiftOrder__c.fields.ClientPostCode__c;
		f = GiftOrder__c.fields.ClientAddress__c;
		f = GiftOrder__c.fields.TotalAmount__c;
		f = GiftOrderDetail__c.fields.ItemNo__c;
		f = GiftOrderDetail__c.fields.ItemName__c;
		f = GiftOrderDetail__c.fields.Quantity__c;
		f = GiftOrderDetail__c.fields.Price__c;
		f = GiftOrderDetail__c.fields.Amount__c;
		f = GiftOrderDetail__c.fields.DeliveryCustomerCode__c;
		f = GiftOrderDetail__c.fields.DeliveryName__c;
		f = GiftOrderDetail__c.fields.DeliveryTel__c;
		f = GiftOrderDetail__c.fields.DeliveryPostcode__c;
		f = GiftOrderDetail__c.fields.DeliveryAddress__c;
		f = SHOHIN__c.fields.GoodsName__c;
		f = SHOHIN__c.fields.Price__c;
		f = GuestMaster__c.fields.Customer__c;
		f = GuestMaster__c.fields.PostCode__c;
		f = GuestMaster__c.fields.Address__c;
		f = GuestMaster__c.fields.Tel__c;

		List<RecordTypeInfo> recordTypes;
		try {
			mainSObjectType = GiftOrder__c.SObjectType;
			setPageReferenceFactory(new PageReferenceFactory());
			sve_ClassName = 'Gift_edit_comp';
			mainQuery = new SkyEditor2.Query('GiftOrder__c');
			mainQuery.addField('ClientNo__c');
			mainQuery.addField('ClientName__c');
			mainQuery.addField('ClientTel__c');
			mainQuery.addField('ClientPostCode__c');
			mainQuery.addField('ClientAddress__c');
			mainQuery.addField('TotalAmount__c');
			mainQuery.addFieldAsOutput('Name');
			mainQuery.addWhere('Id', mainRecord.Id, SkyEditor2.WhereOperator.Eq)
				.limitRecords(1);
			mode = SkyEditor2.LayoutMode.LayoutFree; 
			queryMap = new Map<String, SkyEditor2.Query>();
			SkyEditor2.Query query;
			Component13 = new Component13(new List<GiftOrderDetail__c>(), new List<Component13Item>(), new List<GiftOrderDetail__c>(), null);
			listItemHolders.put('Component13', Component13);
			query = new SkyEditor2.Query('GiftOrderDetail__c');
			query.addField('ItemNo__c');
			query.addField('ItemName__c');
			query.addField('Quantity__c');
			query.addField('Price__c');
			query.addField('Amount__c');
			query.addField('DeliveryCustomerCode__c');
			query.addField('DeliveryName__c');
			query.addField('DeliveryTel__c');
			query.addField('DeliveryPostcode__c');
			query.addField('DeliveryAddress__c');
			query.addWhere('GiftOrderNo__c', mainRecord.Id, SkyEditor2.WhereOperator.Eq);
			relationFields.put('Component13', 'GiftOrderNo__c');
			Component13.queryRelatedEvent = False;
			query.limitRecords(500);
			queryMap.put('Component13', query);
			registRelatedList('GiftOrderDetails__r', 'Component13');
			p_showHeader = true;
			p_sidebar = true;
			addInheritParameter('ClientNo__c', 'ClientNo__c');
			addInheritParameter('ClientName__c', 'ClientName__c');
			addInheritParameter('ClientAddress__c', 'ClientAddress__c');
			addInheritParameter('ClientTel__c', 'ClientTel__c');
			addInheritParameter('ClientPostCode__c', 'ClientPostCode__c');
			init();
			Component13.extender = this.extender;
			if (record.Id == null) {
				saveOldValues();
				 if((ApexPages.currentPage().getParameters().get('clone') == null || Decimal.valueOf(ApexPages.currentPage().getParameters().get('clone')) != 1) && GiftOrderDetail__c.fields.GiftOrderNo__c.getDescribe().createable){
					 for (Integer i = 0; i < 1; i++) {
						 Component13.add();
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

	global with sharing class Component13Item extends SkyEditor2.ListItem {
		public GiftOrderDetail__c record{get; private set;}
		@TestVisible
		Component13Item(Component13 holder, GiftOrderDetail__c record, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(holder);
			if (record.Id == null ){
				if (recordTypeSelector != null) {
					recordTypeSelector.applyDefault(record);
				}
			}
			this.record = record;
		}

	public void loadReferenceValues_Component30() {
		if (record.ItemNo__c == null) {

            if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.ItemName__c)) {
                record.ItemName__c = null;
            }
        
            if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.Price__c)) {
                record.Price__c = null;
            }
        		return;
		}
		SHOHIN__c[] referenceTo = [SELECT GoodsName__c,Price__c FROM SHOHIN__c WHERE Id=:record.ItemNo__c];
		if (referenceTo.size() == 0) {
			record.ItemNo__c.addError(SkyEditor2.Messages.referenceDataNotFound(record.ItemNo__c));
			return;
		}
		
        if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.ItemName__c)) {
            record.ItemName__c = referenceTo[0].GoodsName__c;
        }
        
        if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.Price__c)) {
            record.Price__c = referenceTo[0].Price__c;
        }
        
	}

	public void loadReferenceValues_Component31() {
		if (record.DeliveryCustomerCode__c == null) {

            if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryName__c)) {
                record.DeliveryName__c = null;
            }
        
            if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryPostcode__c)) {
                record.DeliveryPostcode__c = null;
            }
        
            if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryAddress__c)) {
                record.DeliveryAddress__c = null;
            }
        
            if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryTel__c)) {
                record.DeliveryTel__c = null;
            }
        		return;
		}
		GuestMaster__c[] referenceTo = [SELECT Customer__c,PostCode__c,Address__c,Tel__c FROM GuestMaster__c WHERE Id=:record.DeliveryCustomerCode__c];
		if (referenceTo.size() == 0) {
			record.DeliveryCustomerCode__c.addError(SkyEditor2.Messages.referenceDataNotFound(record.DeliveryCustomerCode__c));
			return;
		}
		
        if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryName__c)) {
            record.DeliveryName__c = referenceTo[0].Customer__c;
        }
        
        if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryPostcode__c)) {
            record.DeliveryPostcode__c = referenceTo[0].PostCode__c;
        }
        
        if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryAddress__c)) {
            record.DeliveryAddress__c = referenceTo[0].Address__c;
        }
        
        if (SkyEditor2.Util.isEditable(record, GiftOrderDetail__c.fields.DeliveryTel__c)) {
            record.DeliveryTel__c = referenceTo[0].Tel__c;
        }
        
	}
		global override SObject getRecord() {return record;}
		public void doDeleteItem(){deleteItem();}
	}
	global with sharing  class Component13 extends SkyEditor2.ListItemHolder {
		public List<Component13Item> items{get; private set;}
		@TestVisible
			Component13(List<SObject> records, List<SkyEditor2.ListItem> items, List<SObject> deleteRecords, SkyEditor2.RecordTypeSelector recordTypeSelector) {
			super(records, items, deleteRecords, recordTypeSelector);
			this.items = (List<Component13Item>)items;
			showDefaultVal = true;
		}
		global override SkyEditor2.ListItem create(SObject data) {
			return new Component13Item(this, (GiftOrderDetail__c)data, recordTypeSelector);
		}
		public void doDeleteSelectedItems(){deleteSelectedItems();}
	}
	with sharing class PageReferenceFactory implements SkyEditor2.PageReferenceFactory.Implementation {
        public PageReference newPageReference(String url) {
            return new PageReference(url);
        }
    }
}