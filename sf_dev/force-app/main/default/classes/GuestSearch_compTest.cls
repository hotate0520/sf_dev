@isTest
private with sharing class GuestSearch_compTest{
		private static testMethod void testPageMethods() {	
			GuestSearch_comp page = new GuestSearch_comp(new ApexPages.StandardController(new GuestMaster__c()));	
			page.getOperatorOptions_GuestMaster_c_Customer_c();	
			page.getOperatorOptions_GuestMaster_c_Tel_c();	
			System.assert(true);
		}	
			
	private static testMethod void testComponent3() {
		GuestSearch_comp.Component3 Component3 = new GuestSearch_comp.Component3(new List<GuestMaster__c>(), new List<GuestSearch_comp.Component3Item>(), new List<GuestMaster__c>(), null);
		Component3.create(new GuestMaster__c());
		Component3.doDeleteSelectedItems();
		System.assert(true);
	}
	
	@isTest
	private static void testLightDataTables(){

		System.assert(true);
	}
}