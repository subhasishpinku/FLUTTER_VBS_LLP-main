part of 'pizza_bloc.dart';

abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object> get props => [];
}

class LoadpizzaCounter extends PizzaEvent {}

class Addpizza extends PizzaEvent {
  final Pizza pizza;
  const Addpizza(this.pizza);
  @override
  List<Object> get props => [pizza];
}

class RemovePizza extends PizzaEvent {
   final Pizza pizza;
  const RemovePizza(this.pizza);
  @override
  List<Object> get props => [pizza];

}
