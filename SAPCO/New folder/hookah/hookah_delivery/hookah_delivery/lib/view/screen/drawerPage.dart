import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah/view/screen/my_earning_page.dart';
import 'package:hookah/tab_controller.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff020D4D),
        child: const Icon(
          Icons.clear_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffC34072),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(350),
              ),
            ),
            height: MediaQuery.of(context).size.height * .80,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff020D4D),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(350),
              ),
            ),
            height: MediaQuery.of(context).size.height * .75,
          ),
          const Positioned(
              right: 30,
              top: 80,
              child: CircleAvatar(
                radius: 43,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
              )),
          ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              menuContainer(
                  icon: Icons.delivery_dining_outlined,
                  title: 'Delivery List',
                  ontap: () {
                    Get.offAll(() => TabControllerPage(),
                        arguments: 'deliveryList',
                        transition: Transition.circularReveal);
                    // Get.to(Home(), arguments: 'ok');
                  }),
              menuContainer(
                  icon: Icons.playlist_add_check_rounded,
                  title: 'pickupList',
                  ontap: () {
                    Get.offAll(() => TabControllerPage(),
                        arguments: 'pickupList',
                        transition: Transition.circularReveal);
                  }),
              menuContainer(
                icon: Icons.monetization_on,
                title: 'My Earning',
                ontap: () {
                  Get.to(() => MyEarningPage(),
                      transition: Transition.circularReveal);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuContainer({required IconData icon, required String title, ontap}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      // color: Color.fromARGB(255, 202, 208, 248),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        onTap: ontap,
      ),
    );
  }
}
