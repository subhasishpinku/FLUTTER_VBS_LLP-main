import 'package:flutter/material.dart';

import 'constants.dart';

// class SubscriptionCard extends StatelessWidget {
//   const SubscriptionCard({
//     Key? key,
//     required this.title,
//     required this.svgSrc,
//     required this.amountOfFiles,
//     required this.numOfFiles,
//     this.color,
//   }) : super(key: key);

  // final Color? color;
  // final String title, svgSrc, amountOfFiles;
  // final int numOfFiles;

  @override
  Widget SubscriptionCard(BuildContext context, {Color? color, String? title, String? svgSrc, String? amountOfFiles, int? numOfFiles}) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              Icons.subscriptions,
              color: color,
            ),
            // SvgPicture.asset(svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$numOfFiles Sold",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text(amountOfFiles!)
        ],
      ),
    );
  }
// }
