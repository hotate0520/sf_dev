public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchTerm) {
      String searchKey = '%' + searchTerm + '%';
      //return [SELECT Id, Name, Phone, Website FROM Account WHERE Name LIKE :searchKey];

      List<Account> accountList = new List<account>();
      List<List<sObject>> serchResult = [find :searchTerm in all fields returning Account(Id, Name, Phone, Website)];
      if(serchResult != null && !serchResult.isEmpty()){
        List<sObject> accountRecord = serchResult[0];
        for(sObject record : accountRecord){
          Account account = (Account)record;
          accountList.add(account);
        }
      }
      return accountList;
    }
  
    @AuraEnabled
    public static void updateAccount(List<Account> data) {
      System.debug('update start');
      update data;
    }
  }