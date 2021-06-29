import java.util.ArrayList;
import java.util.HashMap;

class Directive {
    private String leftText;
    private String rightText;
    private Character directive;

    public Directive(String leftText, String rightText, Character directive) {
        this.leftText = leftText;
        this.rightText = rightText;
        this.directive = directive;
    }

    public String getRightText() {
        return rightText;
    }

    public void setRightText(String rightText) {
        this.rightText = rightText;
    }

    public String getLeftText() {
        return leftText;
    }

    public void setLeftText(String leftText) {
        this.leftText = leftText;
    }

    public Character getDirective() {
        return directive;
    }

    public void setDirective(Character directive) {
        this.directive = directive;
    }
}

public class IntroductionOverriding {
    public static void main(String[] args) {
        Shape[] shapes = new Shape[2];

        Circle circle = new Circle();

        Ambiguous ambiguous = new Ambiguous();

        shapes[0] = circle;
        shapes[1] = ambiguous;

        for (Shape s : shapes) {
            s.printMe();
            System.out.println(s.computeArea());
        }
        ArrayList<String> myArr = new ArrayList<String>();
        myArr.add("one");
        myArr.add("two");

        HashMap<String, String> map = new HashMap<String, String>();

        map.put("one", "uno");
        map.put("two", "dos");

        System.out.println(map);

        ArrayList<Directive> directives = new ArrayList<Directive>();

        directives.add(new Directive("toto", "toti", 'S'));

        directives.add(new Directive("toto", "toti", 'a'));

        directives.add(new Directive("toto", "toti", 'S'));

        directives.add(new Directive("toto", "toti", '%'));
        System.out.println(directives);
    }
}