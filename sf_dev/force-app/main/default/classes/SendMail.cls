/*
	SendMail.go();
*/
public class SendMail{
    
    public static String emailAddress='nmatsuzaki@terrasky.co.jp';

	public static void go(){
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] {emailAddress}; 
		String[] ccAddresses = new String[] {emailAddress};
		mail.setToAddresses(toAddresses);
		mail.setCcAddresses(ccAddresses);
		mail.setReplyTo(emailAddress);
		mail.setSenderDisplayName('Salesforce Support');
		mail.setSubject('hoge');
		mail.setBccSender(false);
		mail.setUseSignature(false);
		mail.setPlainTextBody('body');
		mail.setHtmlBody('body html');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}

	public static void goOrgMail(){
        
		List<OrgWideEmailAddress> owdlist = 
            [SELECT Id FROM OrgWideEmailAddress  LIMIT 1];
        
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] {emailAddress}; 
		mail.setToAddresses(toAddresses);
		mail.setOrgWideEmailAddressId(owdlist.get(0).id);
		mail.setSubject('hotate');
		mail.setPlainTextBody('test');
		mail.setHtmlBody('test');
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}


}