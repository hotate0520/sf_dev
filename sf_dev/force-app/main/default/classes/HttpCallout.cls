public class HttpCallout{

	public static void go(){

		Http http = new Http();
		HttpRequest request = new HttpRequest();
		// 設定＞リモートサイトに登録が必要
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
		request.setMethod('PUT');
		HttpResponse response = http.send(request);
		// コールアウトが成功した
		if (response.getStatusCode() == 200) { 
		  //戻り値のJSON解析
		   Map<String, Object> results 
		       = (Map<String, Object>)JSON.deserializeUntyped(response.getBody()); 
		    System.debug('getBody＊＊＊＊＊＊＊＊＊');
            System.debug(response.getBody());
		   // animalsをキーにMAPを生成
		   List<Object> animals = (List<Object>) results.get('animals');
		    System.debug('JSONを展開＊＊＊＊＊＊＊＊＊');
		   for (Object animal: animals) { System.debug(animal); }
		}
	}
}