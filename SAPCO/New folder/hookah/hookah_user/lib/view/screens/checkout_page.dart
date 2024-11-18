import 'package:flutter/material.dart';
import 'package:hookah_user/view/widgets/quantaty_table.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check out')),
      body: Container(
        padding: const EdgeInsets.all(8),
        // color: Colors.white,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Expanded(
            //   child:
            Container(
              height: 200,
              color: Colors.white,
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://m.media-amazon.com/images/I/615EWX23M7L._SL1349_.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(width: 2, color: Colors.indigo),
                          ),
                          height: 65,
                          width: 65,
                        ),
                        const Text('Lorem Ipsum'),
                        QuantityTable(),
                        const Text('₹ 1999'),
                      ],
                    );
                  }),
            ),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(15),
              // height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bill Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Item Total'), Text('₹ 370')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Delivery Fee | 4.0 kms',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Text('₹ 29')
                      ],
                    ),
                    const Text('It is a long established fact that a reader'),
                    SizedBox(height: 15),
                    const Divider(color: Colors.black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Delivery tip'),
                        Text('Add Tip', style: TextStyle(color: Colors.indigo))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Taxes and charges',
                            style: TextStyle(color: Colors.blue)),
                        Text('₹ 44.7')
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('To Pay',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text('₹ 44.7',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              // height: 100,
              color: Colors.white,
              child: Column(children: [
                ListTile(
                  leading: const Icon(
                    Icons.delivery_dining_rounded,
                    size: 35,
                  ),
                  title: const Text('Deliver to Work',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Lorem Ipsum'),
                  trailing: TextButton(
                    child: const Text('Add New',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  title: const Text('₹ 444',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Change UPI Id'),
                  trailing: ElevatedButton(
                    child: const Text('Make Payment',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
