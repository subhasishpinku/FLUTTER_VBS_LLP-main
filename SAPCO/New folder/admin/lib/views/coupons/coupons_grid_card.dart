// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:admin/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Menu { Deactivate, Delete }

Widget coupondGridCard(
  BuildContext context, {
  String? name,
  String? desc,
  String? date,
  String? svgSrc,
  Color? color,
}) {
  String selectedMenu = '';
  return Container(
    padding: EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color!.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: 
              SvgPicture.asset(
                svgSrc!,
                // color: color,
              ),
            ),
            PopupMenuButton<Menu>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              onSelected: (Menu item) {
                selectedMenu = item.name;
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.Deactivate,
                  child: Text('Deactivate'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.Delete,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
        Text(
          name!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // ProgressLine(
        //   color: color,
        //   percentage: percentage,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       "$countLabel",
        //       style: Theme.of(context)
        //           .textTheme
        //           .caption!
        //           .copyWith(color: Colors.white70),
        //     ),
        // Text(
        //   info.totalStorage!,
        //   style: Theme.of(context)
        //       .textTheme
        //       .caption!
        //       .copyWith(color: Colors.white),
        // ),
        //   ],
        // )
      ],
    ),
  );
}

// class ProgressLine extends StatelessWidget {
//   const ProgressLine({
//     Key? key,
//     this.color = primaryColor,
//     required this.percentage,
//   }) : super(key: key);
//
//   final Color? color;
//   final int? percentage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 5,
//           decoration: BoxDecoration(
//             color: color!.withOpacity(0.1),
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//         ),
//         LayoutBuilder(
//           builder: (context, constraints) => Container(
//             width: constraints.maxWidth * (percentage! / 100),
//             height: 5,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
