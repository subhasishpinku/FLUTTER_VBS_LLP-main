import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/product_controller.dart';
import 'package:hookah_user/view/screens/checkout_page.dart';
import 'package:hookah_user/view/screens/drawer_page.dart';
import 'package:hookah_user/view/widgets/created_chip.dart';
import 'package:hookah_user/view/widgets/createde_product_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = Get.put<ProductController>(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140), // Set this height
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff020D4D),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                title: const Text('Grab your Favorite'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.to(CheckOutPage());
                    },
                    icon: const Icon(Icons.shopping_cart),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text('search your product...'),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,
                    focusColor: Colors.amber,
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 9,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      gapPadding: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 14,
                  itemBuilder: (context, index) {
                    return CreatedChip();
                  },
                ),
              ),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/03/31/96/15/360_F_331961563_x2z2ZWWHwemXgdVYZqaSYRTU9ZMyDBB1.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  height: 190,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('On Sale All Over\n Kolkata',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffffffff))),
                            onPressed: () {},
                            child: const Text(
                              'View more',
                              style: TextStyle(
                                  color: Color(0xFF020D4D),
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                )
              ]),
              const Text('Featured Products For Sale',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CreatedProductContainer();
                  },
                ),
              ),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/03/31/96/15/360_F_331961563_x2z2ZWWHwemXgdVYZqaSYRTU9ZMyDBB1.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  height: 190,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('On Rent All Over\n Kolkata',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffffffff))),
                            onPressed: () {},
                            child: Text(
                              'View more',
                              style: TextStyle(
                                  color: Color(0xFF020D4D),
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
