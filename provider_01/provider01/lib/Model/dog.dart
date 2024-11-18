//provider 02
// class Dog {
//   final String name;
//   final String breed;
//   int age;
//   Dog({
//     required this.name,
//     required this.breed,
//     this.age = 1,
//   });

//   void grow() {
//     age++;
//     print('age: $age');
//   }
// }

//provider 03
// import 'package:flutter/foundation.dart';

// class Dog with ChangeNotifier {
//   final String name;
//   final String breed;
//   int age;
//   Dog({
//     required this.name,
//     required this.breed,
//     this.age = 1,
//   });

//   void grow() {
//     age++;
//     notifyListeners();
//     print('age: $age');
//   }
// }

//provider 04
// import 'package:flutter/foundation.dart';

// class Dog with ChangeNotifier {
//   final String name;
//   final String breed;
//   int age;
//   Dog({
//     required this.name,
//     required this.breed,
//     this.age = 1,
//   });

//   void grow() {
//     age++;
//     notifyListeners();
//   }
// }

//provider 05
// import 'package:flutter/foundation.dart';

// class Dog with ChangeNotifier {
//   final String name;
//   final String breed;
//   int age;
//   Dog({
//     required this.name,
//     required this.breed,
//     this.age = 1,
//   });

//   void grow() {
//     age++;
//     notifyListeners();
//   }
// }

//provider 06
// import 'package:flutter/foundation.dart';

// class Dog with ChangeNotifier {
//   final String name;
//   final String breed;
//   int age;
//   Dog({
//     required this.name,
//     required this.breed,
//     this.age = 1,
//   });

//   void grow() {
//     age++;
//     notifyListeners();
//   }
// }
//Provider 07

// import 'package:flutter/foundation.dart';

// class Dog with ChangeNotifier {
//   final String name;
//   final String breed;
//   int age;
//   Dog({
//     required this.name,
//     required this.breed,
//     this.age = 1,
//   });

//   void grow() {
//     age++;
//     notifyListeners();
//   }
// }

//Provider 08
import 'package:flutter/foundation.dart';

class Dog with ChangeNotifier {
  final String name;
  final String breed;
  int age;
  Dog({
    required this.name,
    required this.breed,
    this.age = 1,
  });

  void grow() {
    age++;
    notifyListeners();
  }
}
