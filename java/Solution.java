import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Solution {

    public String solution(String names, String company) {
        return Stream.of(normalizeNames(names)).map(name -> name.trim().split(" "))
            .map(name -> {
                    return name.length > 2 ? this.makeCompanyName(name[0], name[1], name[2], company)
                            : this.makeCompanyName(name[0], name[1], company);
                })
            .collect(Collectors.joining(", "));
    }

    public String[] normalizeNames(String names) {
        return names.split(",");
    }

    public String makeCompanyName(String firstName, String midleName, String lastName, String companyName) {
        String lowerCaseFirstName = firstName.toLowerCase();
        String lowerCaseMidleName = midleName.toLowerCase();
        String lowerCaseLastName = lastName.toLowerCase();
        String name = String.format("%s %s %s", firstName, midleName, lastName);

        //        System.out.println(lowerCaseLastName);
        //        System.out.println(lowerCaseFirstName.substring(0, 1));

        return String.format("%s <%s_%s_%s@%s.com>", name, lowerCaseFirstName, lowerCaseMidleName, this.truncateLastName(lowerCaseLastName), companyName.toLowerCase());
    }

    public String makeCompanyName(String firstName, String lastName, String companyName) {
        String lowerCaseFirstName = firstName.toLowerCase();
        String lowerCaseLastName = firstName.toLowerCase();

        String name = String.format("%s %s", firstName, lastName);
        return String.format("%s <%s_%s@%s.com>", name, lowerCaseFirstName, this.truncateLastName(lowerCaseLastName), companyName.toLowerCase());
    }

    public String truncateLastName(String lastName) {
        String workingLastName;
        if (lastName.contains("-")) {
            String[] splitted = lastName.split("-");
            workingLastName = String.join("", splitted).replaceAll(" ", "");
        } else {
            workingLastName = lastName.replaceAll(" ", "");
        }

        if (workingLastName.length() > 8) {
            return workingLastName.substring(0, 8);
        } else {
            return workingLastName;
        }
    }
}
