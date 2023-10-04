global class testInvocabale {
	@invocableMethod(label='hogeeeeeeeeeeeee' description='ああああ')
    global static List<Account> acc (List<Account> req){
        List<Account> hoge = [select id from Account limit 10];
        return hoge;
    }
}