import 'package:admin/components/constants.dart';
import 'package:admin/controllers/responsive.dart';
import 'package:admin/models/calls_made_model.dart';
import 'package:admin/models/demo_recent_users.dart';
import 'package:flutter/material.dart';

class RecentCallsMade extends StatelessWidget {
  const RecentCallsMade({
    Key? key,
    this.userInfo,
  }) : super(key: key);

  final RecentUser? userInfo;

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
                "Recent Calls",
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
                child: Text(
                  "All Calls",
                  overflow: TextOverflow.ellipsis,
                ),
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
                itemCount: callsMadeModel.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            callsMadeModel[i]['from'],
                          ),
                        ),
                        // SizedBox(width: 10,),
                        Expanded(child: Text(callsMadeModel[i]['to'])),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: defaultPadding),
                        //   child: Text(demoRecentUsers[i]['title']),
                        // ),

                        Expanded(
                            child: Text(callsMadeModel[i]['dateAndTime']
                                ["01-03-2022"][0])),
                        Expanded(child: Text(callsMadeModel[i]['count'])),
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
