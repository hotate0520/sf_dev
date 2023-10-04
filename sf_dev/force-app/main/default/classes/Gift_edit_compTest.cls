@isTest
private with sharing class Gift_edit_compTest{
	private static testMethod void testPageMethods() {		Gift_edit_comp extension = new Gift_edit_comp(new ApexPages.StandardController(new GiftOrder__c()));
		SkyEditor2.Messages.clear();
		extension.sObjectNotFound(new SkyEditor2.Errors.SObjectNotFoundException(SkyEditor2.Messages.sObjectNotFound('SkyEditor2__SkyEditorDummy__c')));
		System.assert(extension.getErrorMessages().endsWith(SkyEditor2.Messages.sObjectNotFound('SkyEditor2__SkyEditorDummy__c')));
		SkyEditor2.Messages.clear();
		extension.fieldNotFound(new SkyEditor2.Errors.FieldNotFoundException(SkyEditor2.Messages.fieldNotFound(SkyEditor2__SkyEditorDummy__c.SObjectType, 'Name')));
		System.assert(extension.getErrorMessages().endsWith(SkyEditor2.Messages.fieldNotFound(SkyEditor2__SkyEditorDummy__c.SObjectType, 'Name')));
		SkyEditor2.Messages.clear();
		extension.recordNotFound(new SkyEditor2.Errors.RecordNotFoundException(SkyEditor2.Messages.DATA_NOT_FOUND));
		System.assert(extension.getErrorMessages().endsWith(SkyEditor2.Messages.DATA_NOT_FOUND));

		Integer defaultSize;
	}
	private static testMethod void testComponent13() {
		Gift_edit_comp.Component13 Component13 = new Gift_edit_comp.Component13(new List<GiftOrderDetail__c>(), new List<Gift_edit_comp.Component13Item>(), new List<GiftOrderDetail__c>(), null);
		Component13.create(new GiftOrderDetail__c());
		System.assert(true);
	}
	
	@isTest
	private static void testLightDataTables(){

		System.assert(true);
	}

	@isTest(SeeAllData=true)
	public static void test_loadReferenceValues_Component30() {
		String testReferenceId = '';
		Gift_edit_comp.Component13 table = new Gift_edit_comp.Component13(new List<GiftOrderDetail__c>(), new List<Gift_edit_comp.Component13Item>(), new List<GiftOrderDetail__c>(), null);
		table.add();
		Gift_edit_comp.Component13Item item = table.items[0];
		item.loadReferenceValues_Component30();

		if (testReferenceId == '') {
			try {
				SkyEditor2.TestData testdata = new SkyEditor2.TestData(SHOHIN__c.getSObjectType());
				SObject parent = testdata.newSObject();
				insert parent;
				testReferenceId = parent.Id;
			} catch (Exception e) {
				List<SHOHIN__c> parents = [SELECT Id FROM SHOHIN__c LIMIT 1];
				if (parents.size() == 0) {
					throw new SkyEditor2.Errors.TestDataException(SkyEditor2.Messages.TEST_DATA_CREATION_FAILURE, e);
				} else {
					testReferenceId = parents[0].Id;
				}
			}
		}
		SHOHIN__c parent = [SELECT Id,GoodsName__c,Price__c FROM SHOHIN__c WHERE Id = :testReferenceId];
		item.record.ItemNo__c = parent.Id;
		item.loadReferenceValues_Component30();
				
		if (SkyEditor2.Util.isEditable(item.record, GiftOrderDetail__c.fields.ItemName__c)) {
			System.assertEquals(parent.GoodsName__c, item.record.ItemName__c);
		}


		if (SkyEditor2.Util.isEditable(item.record, GiftOrderDetail__c.fields.Price__c)) {
			System.assertEquals(parent.Price__c, item.record.Price__c);
		}

		System.assert(true);
	}

	@isTest(SeeAllData=true)
	public static void test_loadReferenceValues_Component31() {
		String testReferenceId = '';
		Gift_edit_comp.Component13 table = new Gift_edit_comp.Component13(new List<GiftOrderDetail__c>(), new List<Gift_edit_comp.Component13Item>(), new List<GiftOrderDetail__c>(), null);
		table.add();
		Gift_edit_comp.Component13Item item = table.items[0];
		item.loadReferenceValues_Component31();

		if (testReferenceId == '') {
			try {
				SkyEditor2.TestData testdata = new SkyEditor2.TestData(GuestMaster__c.getSObjectType());
				SObject parent = testdata.newSObject();
				insert parent;
				testReferenceId = parent.Id;
			} catch (Exception e) {
				List<GuestMaster__c> parents = [SELECT Id FROM GuestMaster__c LIMIT 1];
				if (parents.size() == 0) {
					throw new SkyEditor2.Errors.TestDataException(SkyEditor2.Messages.TEST_DATA_CREATION_FAILURE, e);
				} else {
					testReferenceId = parents[0].Id;
				}
			}
		}
		GuestMaster__c parent = [SELECT Id,Customer__c,PostCode__c,Address__c,Tel__c FROM GuestMaster__c WHERE Id = :testReferenceId];
		item.record.DeliveryCustomerCode__c = parent.Id;
		item.loadReferenceValues_Component31();
				
		if (SkyEditor2.Util.isEditable(item.record, GiftOrderDetail__c.fields.DeliveryName__c)) {
			System.assertEquals(parent.Customer__c, item.record.DeliveryName__c);
		}


		if (SkyEditor2.Util.isEditable(item.record, GiftOrderDetail__c.fields.DeliveryPostcode__c)) {
			System.assertEquals(parent.PostCode__c, item.record.DeliveryPostcode__c);
		}


		if (SkyEditor2.Util.isEditable(item.record, GiftOrderDetail__c.fields.DeliveryAddress__c)) {
			System.assertEquals(parent.Address__c, item.record.DeliveryAddress__c);
		}


		if (SkyEditor2.Util.isEditable(item.record, GiftOrderDetail__c.fields.DeliveryTel__c)) {
			System.assertEquals(parent.Tel__c, item.record.DeliveryTel__c);
		}

		System.assert(true);
	}
}