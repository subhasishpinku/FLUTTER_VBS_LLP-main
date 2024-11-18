import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Pizza({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Pizza> Pizzas = [
    Pizza(
      id: '0',
      name: 'Pizzas',
      image: Image.asset('images/pizza.avif'),
    ),
    Pizza(
    id: '1',
    name: 'Pizzas pepperoni',
    image: Image.asset('images/pizza_pepperoni.webp'),

   )
  ];
}
