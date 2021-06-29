import java.util.ArrayList;

public class Person {
    private String lastName;
    private String firstName;
    private String pseudoName;

    public Person (String firstName, String lastName, String pseudoName) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.pseudoName = pseudoName;
    }

    public static void main(String[] args) {
        ArrayList<Person> persons = new ArrayList<Person>();

        for (int i = 0; i < 10000; i++) {
            persons.add(new Person("person" + i, "toto" + i, "jjj" + i));
        }

        persons.stream().limit(10).forEach(x -> System.out.println(x));
    }

    @Override
    public String toString() {
        return "Person{" +
            "lastName='" + lastName + '\'' +
            ", firstName='" + firstName + '\'' +
            ", pseudoName='" + pseudoName + '\'' +
            '}';
    }
}
