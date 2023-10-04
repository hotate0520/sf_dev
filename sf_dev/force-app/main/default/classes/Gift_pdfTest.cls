@isTest
private with sharing class Gift_pdfTest{
	private static testMethod void testPageMethods() {		Gift_pdf extension = new Gift_pdf(new ApexPages.StandardController(new GiftOrder__c()));
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
		Gift_pdf.Component13 Component13 = new Gift_pdf.Component13(new List<GiftOrderDetail__c>(), new List<Gift_pdf.Component13Item>(), new List<GiftOrderDetail__c>(), null);
		Component13.create(new GiftOrderDetail__c());
		System.assert(true);
	}
	
	@isTest
	private static void testLightDataTables(){

		System.assert(true);
	}
}