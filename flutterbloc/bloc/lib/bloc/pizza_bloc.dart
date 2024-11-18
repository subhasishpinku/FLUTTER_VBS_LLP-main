import 'package:bloc/models/pizza_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState>{
  PizzaBloc():super(PizzaInitial()){
    on<LoadpizzaCounter>(
      (event,emit) async{}
    );
     on<Addpizza>(
      (event,emit) async{}
    );
     on<RemovePizza>(
      (event,emit) async{}
    );
  }
}