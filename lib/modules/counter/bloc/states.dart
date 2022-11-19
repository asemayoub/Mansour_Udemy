
// Create States Class
// To Create Main Class and children classes into class use abstract in class


abstract class CounterStates {
}

class CounterIntialState extends CounterStates {}

class CounterPlusState extends CounterStates {

  // هنا لو محتاج ابعت قيمته مع ال state

  late final int counter;

  CounterPlusState(this.counter);


}

class CounterMinusState extends CounterStates {


  late final int counter;

  CounterMinusState(this.counter);

}

class CounterResetState extends CounterStates {

  late final int counter;

  CounterResetState(this.counter);



}
