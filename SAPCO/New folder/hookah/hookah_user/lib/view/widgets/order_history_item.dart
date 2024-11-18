import 'package:flutter/material.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.all(10),
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://www.publichealthpost.org/wp-content/uploads/2019/02/Hookah-College-Students.jpg'),
                          fit: BoxFit.cover))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Lorem Ipsum',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Lorem Ipsum', style: TextStyle(fontSize: 15)),
                  Text('₹ 250'),
                ],
              ),
              Row(children: const [
                Text('Delivered'),
                SizedBox(width: 4),
                CircleAvatar(radius: 8, child: Icon(Icons.check, size: 12))
              ]),
            ],
          ),
          const Divider(color: Colors.black, thickness: .5, indent: 10),
          const Text(
              'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text('Rating'),
                  SizedBox(width: 10),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                  Icon(Icons.star, color: Colors.amber),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text('REORDER'))
            ],
          ),
        ],
      ),
    );
  }
}
