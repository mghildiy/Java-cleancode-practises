package unittesting;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class Target {
    private final Dependency dependency;

    public void methodToTest(Obj obj) {
        int result = dependency.perform(obj, 7);
        System.out.println(result);
    }

}

class Dependency {
    // this method is both a command(changing state) and a query(returning value)
    public int perform(Obj obj, int input) {
        // due to this mutation, in unit test for 'methodToTest' we also need to validate for number of times  'perform' is called
        obj.setValue(obj.getValue() + 10);
        return  input + 15;
    }
}

@Data
class Obj {
    private int value;
}
