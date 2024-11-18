import 'package:flutter/material.dart';

import '../../components/active_subscription_card.dart';
import '../../components/active_subscriptions_chart.dart';
import '../../components/constants.dart';

class ActiveSubscriptions extends StatelessWidget {
  const ActiveSubscriptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Active Subscriptions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          SubscriptionCard(
            context,
            svgSrc: "assets/icons/Documents.svg",
            color: Colors.redAccent,
            title: "Subscription1",
            amountOfFiles: "₹300",
            numOfFiles: 1328,
          ),
          SubscriptionCard(
            context,
            svgSrc: "assets/icons/media.svg",
            color: Colors.yellowAccent,
            title: "Subscription2",
            amountOfFiles: "₹400",
            numOfFiles: 1328,
          ),
          SubscriptionCard(
            context,
            svgSrc: "assets/icons/folder.svg",
            color: Colors.cyanAccent,
            title: "Subscription3",
            amountOfFiles: "₹500",
            numOfFiles: 1328,
          ),
          SubscriptionCard(
            context,
            svgSrc: "assets/icons/unknown.svg",
            color: Colors.blueAccent,
            title: "Subscription4",
            amountOfFiles: "₹800",
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
