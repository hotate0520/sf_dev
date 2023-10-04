global with sharing class Gift_pdf extends SkyEditor2.SkyEditorPageBaseWithSharing {
	public GiftOrder__c record {get{return (GiftOrder__c)mainRecord;}}
	public Component13 Component13 {get; private set;}
	{
	setApiVersion(42.0);
	}
	public Gift_pdf(ApexPages.StandardController controller) {
		super(controller);

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

		List<RecordTypeInfo> recordTypes;
		try {
			mainSObjectType = GiftOrder__c.SObjectType;
			setPageReferenceFactory(new PageReferenceFactory());
			sve_ClassName = 'Gift_pdf';
			mainQuery = new SkyEditor2.Query('GiftOrder__c');
			mainQuery.addFieldAsOutput('Name');
			mainQuery.addFieldAsOutput('ClientNo__c');
			mainQuery.addFieldAsOutput('ClientName__c');
			mainQuery.addFieldAsOutput('ClientTel__c');
			mainQuery.addFieldAsOutput('ClientPostCode__c');
			mainQuery.addFieldAsOutput('ClientAddress__c');
			mainQuery.addFieldAsOutput('TotalAmount__c');
			mainQuery.addWhere('Id', mainRecord.Id, SkyEditor2.WhereOperator.Eq)
				.limitRecords(1);
			mode = SkyEditor2.LayoutMode.LayoutFree; 
			queryMap = new Map<String, SkyEditor2.Query>();
			SkyEditor2.Query query;
			Component13 = new Component13(new List<GiftOrderDetail__c>(), new List<Component13Item>(), new List<GiftOrderDetail__c>(), null);
			listItemHolders.put('Component13', Component13);
			query = new SkyEditor2.Query('GiftOrderDetail__c');
			query.addFieldAsOutput('ItemNo__c');
			query.addFieldAsOutput('ItemName__c');
			query.addFieldAsOutput('Quantity__c');
			query.addFieldAsOutput('Price__c');
			query.addFieldAsOutput('Amount__c');
			query.addFieldAsOutput('DeliveryCustomerCode__c');
			query.addFieldAsOutput('DeliveryName__c');
			query.addFieldAsOutput('DeliveryTel__c');
			query.addFieldAsOutput('DeliveryPostcode__c');
			query.addFieldAsOutput('DeliveryAddress__c');
			query.addWhere('GiftOrderNo__c', mainRecord.Id, SkyEditor2.WhereOperator.Eq);
			relationFields.put('Component13', 'GiftOrderNo__c');
			Component13.queryRelatedEvent = False;
			query.limitRecords(500);
			queryMap.put('Component13', query);
			registRelatedList('GiftOrderDetails__r', 'Component13');
			p_showHeader = true;
			p_sidebar = true;
			p_isPdf = true;
			p_pdfPageSize = 'A4';
			p_pdfOrientation = 'portrait';
			p_pdfMargin = '0.0cm';
			init();
			Component13.extender = this.extender;
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