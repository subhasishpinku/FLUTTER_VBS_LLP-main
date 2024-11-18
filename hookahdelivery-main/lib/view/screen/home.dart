import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah/view/screen/drawerPage.dart';

import '../../controller/data_list_controller.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var listOfData = DataList().deliveryList;

  final args = Get.arguments;
  getData() {
    if (args == null || args == 'deliveryList') {
      setState(() {
        listOfData = DataList().deliveryList;
      });
    } else {
      setState(() {
        listOfData = DataList().pickupList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(args);
    getData();
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text(args == "deliveryList" ? 'Delivery List' : 'Pickup List'),
      ),
      // ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: DataList().deliveryList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ...listOfData.map((item) {
                      // print(item.title);
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Container(
                              color: Colors.grey,
                              height: 52,
                              width: 52,
                              child: Image.network(
                                'https://images.pexels.com/photos/3794457/pexels-photo-3794457.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(item.title),
                            subtitle:
                                Text('${item.description}\n ₹${item.price}'),
                            isThreeLine: true,
                            trailing: ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(
                                      right: 30, left: 30, top: 4, bottom: 4),
                                ),
                                // minimumSize: MaterialStateProperty.all(),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              child: const Text('view'),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
