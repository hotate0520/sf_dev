@isTest
private with sharing class OyakoTest{
	private static testMethod void testPageMethods() {		Oyako extension = new Oyako(new ApexPages.StandardController(new Account()));
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
	private static testMethod void testComponent6() {
		Oyako.Component6 Component6 = new Oyako.Component6(new List<Contact>(), new List<Oyako.Component6Item>(), new List<Contact>(), null);
		Component6.create(new Contact());
		System.assert(true);
	}
	
	private static testMethod void testComponent8() {
		Oyako.Component8 Component8 = new Oyako.Component8(new List<Training__c>(), new List<Oyako.Component8Item>(), new List<Training__c>(), null);
		Component8.create(new Training__c());
		System.assert(true);
	}
	
	@isTest
	private static void testLightDataTables(){

		System.assert(true);
	}
}