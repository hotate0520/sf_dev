public class testHOge {
	public static integer hogeNumber = 1;
    
    {
        System.debug('インスタンス初期化');
        testHOge.hogeNumber++;
    }
    
    static {
        System.debug('静的初期化');
        hogeNumber++;
        System.debug(hogeNumber);
    }
    
    public static integer hogeCalc(){
        System.debug('静的メソッド');
        return hogeNumber;
    }
}