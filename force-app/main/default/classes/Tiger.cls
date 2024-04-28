public class Tiger extends Animal {

    // Constructor calling the parameterless constructor of the superclass
    public Tiger() {
        super();
    }

    // Override the eat method from the Animal class
    public override void eat() {
        // Tiger's eating behavior
        System.debug('Tiger is eating like a beast');
    }
}