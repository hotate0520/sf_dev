public class Employee implements Comparable {

    public Long id;
    public String name;
    public String phone;
    
    // Constructor
    public Employee(Long i, String n, String p) {
        id = i;
        name = n;
        phone = p;
    }
    
    // Implement the compareTo() method
    public Integer compareTo(Object compareTo) {
        Employee compareToEmp = (Employee)compareTo;
        if (id == compareToEmp.id) return 0;
        if (id > compareToEmp.id) return 1;
        return -1;        
    }
}

/*
List<Employee> empList = new List<Employee>();
empList.add(new Employee(101,'Joe Smith', '4155551212'));
empList.add(new Employee(101,'J. Smith', '4155551212'));
empList.add(new Employee(25,'Caragh Smith', '4155551000'));
empList.add(new Employee(105,'Mario Ruiz', '4155551099'));
empList.sort();
for(Employee e : empList){
    System.debug(e);
}


*/