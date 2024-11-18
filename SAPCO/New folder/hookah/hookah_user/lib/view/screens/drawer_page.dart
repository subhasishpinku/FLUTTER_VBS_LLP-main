import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/view/screens/about_us.dart';
import 'package:hookah_user/view/screens/checkout_page.dart';
import 'package:hookah_user/view/screens/login.dart';
import 'package:hookah_user/view/screens/order_history.dart';
import 'package:hookah_user/view/screens/tab_controller_page.dart';
import 'package:share_plus/share_plus.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);
  final apkId = 'com.bookmysmoke.hookahuser';

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
                backgroundColor: Color(0xffffffff),
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
                  icon: Icons.home,
                  title: 'Home',
                  ontap: () {
                    Get.offAll(
                      () => TabControllerPage(),
                    );
                  }),
              menuContainer(
                  icon: Icons.history,
                  title: 'Order History',
                  ontap: () {
                    Get.to(() => const OrderHistory());
                  }),
              menuContainer(
                icon: Icons.shopping_cart,
                title: 'My Cart',
                ontap: () {
                  Get.to(
                    () => CheckOutPage(),
                    //     transition: Transition.circularReveal
                  );
                },
              ),
              menuContainer(
                icon: Icons.offline_pin_rounded,
                title: 'Order Status',
                ontap: () {
                  Get.snackbar('NO ORDER FOUND',
                      'Looks like you haven\'t made your order yet',
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP);
                },
              ),
              menuContainer(
                icon: Icons.share,
                title: 'Share the app',
                ontap: () async {
                  await Share.share(
                      'Hi!, Check out this amazing app:\n\nhttps://play.google.com/store/apps/details?id=$apkId');
                  // Get.to(() => MyEarningPage(),
                  //     transition: Transition.circularReveal);
                },
              ),
              menuContainer(
                icon: Icons.info_outline,
                title: 'about us',
                ontap: () {
                  Get.to(() => AboutUs());
                  //     transition: Transition.circularReveal);
                },
              ),
              menuContainer(
                icon: Icons.logout,
                title: 'Logout',
                ontap: () {
                  Get.offAll(() => Login());
                  //     transition: Transition.circularReveal);
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
      // margin: EdgeInsets.only(top: 4),
      // color: Color.fromARGB(255, 202, 208, 248),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onTap: ontap,
      ),
    );
  }
}
