import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget menuContainer({required String icon, required String title, ontap}) {
  return Container(
    // margin: EdgeInsets.only(top: 4),
    // color: Color.fromARGB(255, 202, 208, 248),
    child: ListTile(
      leading: SvgPicture.asset(
        icon,
        color: Colors.black,
        height: 18,
        width: 18,
        // size: 30,
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      onTap: ontap,
    ),
  );
}
