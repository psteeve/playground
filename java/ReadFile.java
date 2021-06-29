import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;



public class ReadFile {
    public static void main(String[] args) {
        String filename = args[0].toString();

        Person p = new Person("toto", "ti", "pre");
        System.out.println(p);
        File myObject = new File(filename);
        try {
            if (myObject.exists()) {
                Scanner scanner = new Scanner(myObject);
                System.out.println(scanner.nextLine());
                while (scanner.hasNextLine()) {
                    String data = scanner.nextLine();
                    System.out.println(data);
                }
                scanner.close();
            }
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred!");
            e.printStackTrace();
        }
    }
}
