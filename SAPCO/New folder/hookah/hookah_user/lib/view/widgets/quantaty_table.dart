import 'package:flutter/material.dart';

class QuantityTable extends StatefulWidget {
  QuantityTable({Key? key}) : super(key: key);

  @override
  State<QuantityTable> createState() => _QuantityTableState();
}

class _QuantityTableState extends State<QuantityTable> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 3 - 10,
      height: 35,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                padding: EdgeInsets.only(left: 2, right: 2),
                onPressed: () {
                  setState(() {
                    quantity--;
                  });
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.indigo,
                  size: 15,
                )),
            Text(
              ' $quantity',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.indigo,
                  size: 15,
                ))
          ]),
    );
  }
}
