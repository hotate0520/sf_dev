public class Describe{
/*
Describe.isAccountObject(new Account());
Describe.isAccountObject(new Contact());
*/
	public static Boolean isAccountObject(sObject obj){
		Boolean ret = obj.getsObjectType()==Account.sObjectType;
		System.debug('■引数のオブジェクトは取引先か？:'+ret);
        System.debug(obj);
		return ret;
	}
    
/*
Describe.getAccountNameLabel();
*/ 
    public static String getAccountNameLabel(){
		Schema.DescribeFieldResult dfr = Schema.sObjectType.Account.fields.Name;
        String label = dfr.getLabel();
		System.debug('■取引先.取引先名の表示ラベルは?'+label);
        return label;
    }
    
/*
Describe.getAccountRating();
*/
    public static List<String> getAccountRating(){
		Schema.DescribeFieldResult dfr = Schema.sObjectType.Account.fields.Rating;
		List<Schema.PicklistEntry> pickList = dfr.getPicklistValues();
        List<String> retList=new List<String>();
        for(Schema.PicklistEntry p : pickList){
            retList.add(p.getLabel());
        }
		System.debug('■取引先.評価の選択リストは?'+retList);
        System.debug(dfr);
        System.debug(pickList);
        return retList;
    }

/*
Describe.isAccountName(Account.Name);
Describe.isAccountName(Contact.Name);
*/    
    public static Boolean isAccountName(Schema.sObjectField field){
        Boolean ret = field== Account.Name;
		System.debug('■取引先.取引先名項目か?'+ret);
        return ret;
    }

/*
Describe.isTargetObject(new Account(),'Account');
Describe.isTargetObject(new Contact(),'Account');
*/
    public static Boolean isTargetObject(sObject obj,String targetObject){
        SObjectType objType = Schema.getGlobalDescribe().get(targetObject);
		Boolean ret = obj.getsObjectType()==objType;
		System.debug('■引数のオブジェクトは'+targetObject+'か？:'+ret);
        System.debug(obj);
		return ret;
    }
/*
Describe.getAccountRecordType();
*/
    public static Map<Id,String> getAccountRecordType(){
        Schema.DescribeSObjectResult R = Account.SObjectType.getDescribe();
        List<Schema.RecordTypeInfo>            rtList = R.getRecordTypeInfos();
        Map<Id,Schema.RecordTypeInfo>       rtMapById = R.getRecordTypeInfosById();
        Map<String,Schema.RecordTypeInfo> rtMapByName = R.getRecordTypeInfosByName();
        
        Map<Id,String> ret = new Map<Id,String>();
        for(Schema.RecordTypeInfo rti : rtList){
            ret.put(rti.getRecordTypeId(),rti.getName());
        }

        System.debug('■■取引先のレコードタイプを取得');
        system.debug(rtList);
        system.debug(rtMapById);
        system.debug(rtMapByName);
        system.debug(ret);
        
        return ret;
    }
    
/*
Describe.getTargetObjRecordType('Account');
Describe.getTargetObjRecordType('Contact');
*/
	public static Map<Id,String> getTargetObjRecordType(String target){
        Schema.DescribeSObjectResult R2 = Schema.getGlobalDescribe().get(target).getDescribe();
        List<Schema.RecordTypeInfo>           rtList              = R2.getRecordTypeInfos();
        Map<Id,Schema.RecordTypeInfo>      rtMapById       = R2.getRecordTypeInfosById();
        Map<String,Schema.RecordTypeInfo> rtMapByName = R2.getRecordTypeInfosByName();
        Map<Id,String> ret = new Map<Id,String>();
        for(Schema.RecordTypeInfo rti : rtList){
            ret.put(rti.getRecordTypeId(),rti.getName());
        }

        System.debug('■■'+target+'オブジェクトのレコードタイプを取得');
        system.debug(rtList);
        system.debug(rtMapById);
        system.debug(rtMapByName);
        system.debug(ret);
        
        return ret;
    }

/* 匿名コンソールで実行する
Describe.isAccountObject(new Account());
Describe.isAccountObject(new Contact());
Describe.getAccountNameLabel();
Describe.getAccountRating();

Describe.isAccountName(Account.Name);
Describe.isAccountName(Contact.Name);

Describe.isTargetObject(new Account(),'Account');
Describe.isTargetObject(new Contact(),'Account');

Describe.getAccountRecordType();
Describe.getTargetObjRecordType('Account');
Describe.getTargetObjRecordType('Contact');
 */    
}