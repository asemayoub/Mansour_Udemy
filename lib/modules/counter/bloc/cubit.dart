
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/modules/counter/bloc/states.dart';

// Create Class Cubit need states cubit get it from class in states



class CounterCubit extends Cubit<CounterStates> {


  // Erorr In Class Because Is Needed Constructor Match Super

  CounterCubit() : super(CounterIntialState());


  // Create Object Into Cubit To Get It in Classes


static CounterCubit get(context) => BlocProvider.of(context);

// كده اي حاجه جوا الكلاس ده هقدر استدعيها من بره ف اي مكان


int counter = 0;

void minus() {

  if (counter <= 0 ) {

    counter = 0;

    emit(CounterMinusState(counter));

  }else {

    counter--;

    emit(CounterMinusState(counter));
  }

}
void plus() {

  if (counter < 0) {


    counter = 0;

    emit(CounterPlusState(counter));


  }else {
    counter++;
    emit(CounterPlusState(counter));

  }



  }
void reset() {


  counter = 0;
  emit(CounterResetState(counter));

  }




}





