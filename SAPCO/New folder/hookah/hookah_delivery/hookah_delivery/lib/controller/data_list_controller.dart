import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../modal/product.dart';

class DataList extends GetxController {
  List deliveryList = [
    Product(
      id: DateTime.now().toString(),
      title: 'delivery',
      image: 'image',
      description: 'description',
      price: 10,
    ),
    Product(
        id: DateTime.now().toString(),
        title: 'delivery',
        image: 'image',
        description: 'description',
        price: 10),
    Product(
        id: DateTime.now().toString(),
        title: 'delivery',
        image: 'image',
        description: 'description',
        price: 10),
    Product(
        id: DateTime.now().toString(),
        title: 'delivery',
        image: 'image',
        description: 'description',
        price: 10),
  ];

  List pickupList = [
    Product(
        id: DateTime.now().toString(),
        title: 'pick',
        image: 'image',
        description: 'description',
        price: 10),
    Product(
        id: DateTime.now().toString(),
        title: 'pick',
        image: 'image',
        description: 'description',
        price: 10),
    Product(
        id: DateTime.now().toString(),
        title: 'pick',
        image: 'image',
        description: 'description',
        price: 10),
    Product(
      id: DateTime.now().toString(),
      title: 'pick',
      image: 'image',
      description: 'description',
      price: 10,
    ),
  ];
}
