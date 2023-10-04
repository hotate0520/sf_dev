@isTest
private class MyTestClass {
    @testSetup static void methodName() {
    	System.debug('■テストデータ生成■');
        Account acc = new Account(name='A');
        insert acc;
    }
    @isTest static void myTest1() {
    	System.debug('■myTest1■');
        Account acc = [select name from Account where name='a'];
        update new Account(id=acc.id,name='b');
        System.debug(acc);
    }
    @isTest static void myTest2() {
    	System.debug('■myTest1■');
        Account acc = [select name from Account where name='b'];  // System.QueryException: List has no rows for assignment to SObject
        update new Account(id=acc.id,name='c');
        System.debug(acc);
    }
}