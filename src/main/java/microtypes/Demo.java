package microtypes;

public class Demo {

    public static void main(String[] args) {
        // easy to mix up things
        PlayerA playerA = new PlayerA(75, 5);
        // typesafety, cohesivity with microtypes
        PlayerB playerB = new PlayerB(new Strength(75), new Life(25));
    }

}

class PlayerA {

    private int strength;
    private int life;
    // client code can easily exchange strength and weapon
    // various checks and operations to be done on these functional concepts may be scattered all over
    // primitives don't express domain model
    PlayerA(int strength, int life) {
        this.strength = strength;
        this.life = life;
    }
}

class PlayerB {
    Strength strength;
    Life life;

    PlayerB(Strength strength, Life life) {
        this.strength = strength;
        this.life = life;
    }
}

// microtypes provide type safety
// Avoids duplication of various checks and improve cohesion as now microtype contains the checks and all needed operations
// microtypes express domain model much better than primitives
// any future modification in functional concept can be easily done, like adding a new attribute

class Strength {
    int strength;

    Strength(int strength) {
        assert strength >= 0 : "Strength is too low";
        assert strength <= 10 : "Strength is too high";

        this.strength = strength;
    }
}

class Life {
    int life;

    Life(int life) {
        assert life >= 10 : "Life is too short";
        assert life <= 100 : "Life is too long";

        this.life = life;
    }

    // all sorts of operations on Life are here, not scattered
    public int toDays() {
        return this.life * 365;
    }
}


