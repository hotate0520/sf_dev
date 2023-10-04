/*
LeadConvert.convert('00Q5h0000010JImEAM');
 */
public class LeadConvert {
    
    // 引数のリードを取引開始する
    public static void convert(Id leadId){
         
        Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(leadId);
         
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
         
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
    }
    
    

/*
List<Lead> newList = new List<Lead>();
for(Integer i=0 ; i<200 ; i++){
    newList.add(new Lead(lastName='test'+i,company='会社'+i));
}
insert newList;
Map<Id,Lead> leadMap = new Map<Id,Lead>(newList);
system.debug(leadMap);
LeadConvert.convert(new List<Id>(leadMap.keyset()));
*/
    // 複数のリードを取引開始する
    public static void convert(List<Id> leadIds){
        List<Database.LeadConvert> lc = new List<Database.LeadConvert>();
        
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];

        for(Id i : leadIds){
            Database.LeadConvert d = new Database.LeadConvert();
            d.setLeadId(i);
            d.setConvertedStatus(convertStatus.MasterLabel);
            lc.add(d);
        }
        
        List<Database.LeadConvertResult> lcr = Database.convertLead(lc);
        System.debug(lcr);
    }
    
}