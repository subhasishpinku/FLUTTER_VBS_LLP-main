import 'package:flutter/material.dart';
import 'package:hookah_user/view/widgets/order_history_item.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return const OrderHistoryItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: 4));
  }
}
