public class Week {
    public enum Day {Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday}
    
    public Day convert(String name){
        return Day.valueof(name);
    } 

}