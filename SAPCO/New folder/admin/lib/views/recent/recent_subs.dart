import 'package:admin/components/constants.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:admin/models/demo_recent_users.dart';
import 'package:admin/models/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentSubs extends StatelessWidget {
  RecentSubs({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Subscriptions",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                child: Text("All Subscriptions", overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            // width: double.infinity,
            child: ListView.separated(
                controller: ScrollController(),
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  thickness: 0.1,
                  color: Colors.grey,
                ),
                shrinkWrap: true,
                itemCount: subscriptionModel.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            subscriptionModel[i]['img'],
                            height: 30,
                            width: 30,
                          ),
                        ),
                        // SizedBox(width: 10,),
                        Expanded(child: Text(subscriptionModel[i]['name'])),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: defaultPadding),
                        //   child: Text(demoRecentUsers[i]['title']),
                        // ),

                        Expanded(child: Text(subscriptionModel[i]['date'])),
                        Expanded(child: Text(subscriptionModel[i]['count'])),
                      ],
                    ),
                  );
                }),

            //   DataTable2(
            //     columnSpacing: defaultPadding,
            //     minWidth: 100,
            //     columns: [
            //       DataColumn(
            //         label: Text("Name"),
            //       ),
            //       DataColumn(
            //         label: Text("Date"),
            //       ),
            //       DataColumn(
            //         label: Text("Plan"),
            //       ),
            //     ],
            //     rows: List.generate(
            //       demoRecentUsers.length,
            //           (index) => recentUserDataRow(demoRecentUsers[index]),
            //     ),
            //   ),
          ),
        ],
      ),
    );
  }
}

// DataRow recentUserDataRow(RecentUser userInfo) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             SvgPicture.asset(
//               userInfo.icon!,
//               height: 30,
//               width: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(userInfo.title!),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Text(userInfo.date!)),
//       DataCell(Text(userInfo.size!)),
//     ],
//   );
// }
