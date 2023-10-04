/*
Workbench
DELETE
/services/apexrest/Account/0012w00000JWh51AAD
 */
@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource{
    
    @HttpDelete
    global static void doDelete() {
        System.debug('■■■REST API■DELETE■■■');
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId =req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        System.debug('requestURI:'+req.requestURI);
        Account account = [SELECT Id FROM Account WHERE Id = :accountId];
        delete account;
/*        
		if(true){
            res.statusCode = 400;
            Result r = new Result(false,'error message...');
            res.responseBody = Blob.valueOf(JSON.serialize(r));
        }
*/
    }
    
    class Result{
        Boolean result;
        String message;
        Result(Boolean result,String message){
            this.result = result;
            this.message = message;
        }
    }
}