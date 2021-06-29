import java.util.ArrayList;

public class Node {
    public String name;
    public Node[] children;

    Node(String name) {
        this.name = name;
    }

    public static void main(String[] args) {
        ArrayList<Node> nodes = new ArrayList<Node>();
        for (int i = 0; i < 100; i++) {
            nodes.add(new Node("john" + i));
        }

        System.out.println(nodes);
    }
}