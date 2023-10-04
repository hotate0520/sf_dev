@isTest
public class testTestHoge {
    

    @testSetup static void makeData(){
        List<Account> aa = new List<Account>();
        for(Integer i = 0; i < 2; i++){
            aa.add(new Account(Name = 'hogeeeee'+i));
        }
        insert aa;
    }
    
    @isTest static void gugi (){
        
        List<Contact> jjj = new List<Contact>();
        Account gggg = [select id, name from Account where Name = 'hogeeeee0' limit 1];
        gggg.Phone = '2155-5975';
        update gggg;
        
        Account ppp = [select id, name from Account where Name = 'hogeeeee1' limit 1];
        delete ppp;
    }
    
    @isTest static void kkk (){
        Account matsu = [select Phone from Account where Name = 'hogeeeee0' LIMIT 1];
        System.debug('aaaaaaaaaaaaaaaaaaaaaaaa'+matsu.Phone);
        System.assertEquals(null, matsu.Phone);
        
        Account matsu2 = [select id, Name from Account where Name = 'hogeeeee1' limit 1];
        System.debug('bbbbbbbbbbbbbbbbbbbbbbbb'+matsu2.Name);
        System.assertEquals('hogeeeee1', matsu2.Name);
    }
}