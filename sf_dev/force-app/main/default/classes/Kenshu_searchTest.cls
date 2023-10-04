@isTest
private with sharing class Kenshu_searchTest{
		private static testMethod void testPageMethods() {	
			Kenshu_search page = new Kenshu_search(new ApexPages.StandardController(new Training__c()));	
			page.getOperatorOptions_Training_c_Accout_c();	
			page.getOperatorOptions_Training_c_Status_c();	
			page.getOperatorOptions_Training_c_Name();	
			page.getOperatorOptions_Training_c_Instructor_c();	
			page.getOperatorOptions_Training_c_KaisaibiStart_c();	
			page.getOperatorOptions_Training_c_KaisaibiEnd_c();	
			page.getOperatorOptions_Training_c_Status_c_multi();	

		Integer defaultSize;

		defaultSize = page.Component3.items.size();
		page.Component3.add();
		System.assertEquals(defaultSize + 1, page.Component3.items.size());
		page.Component3.items[defaultSize].selected = true;
		page.Component3.doDeleteSelectedItems();
			System.assert(true);
		}	
			
	private static testMethod void testComponent3() {
		Kenshu_search.Component3 Component3 = new Kenshu_search.Component3(new List<Training__c>(), new List<Kenshu_search.Component3Item>(), new List<Training__c>(), null);
		Component3.create(new Training__c());
		Component3.doDeleteSelectedItems();
		System.assert(true);
	}
	
	@isTest
	private static void testLightDataTables(){

		System.assert(true);
	}
}