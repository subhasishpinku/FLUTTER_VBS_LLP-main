// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../tab_controller.dart';

// class HookahWidget extends GetxController {
//   static Widget createdTextTield(
//       {Icon? preIcon, bool? isPassword, String? label, setState}) {
//     bool _passwordVisible = false;
//     return Container(
//       padding: EdgeInsets.only(left: 10, right: 10),
//       margin: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//             color: Colors.grey,
//             blurRadius: 10,
//             blurStyle: BlurStyle.outer,
//             spreadRadius: 2,
//             offset: Offset.fromDirection(.2))
//       ], borderRadius: BorderRadius.circular(50), color: Colors.white),
//       child: TextFormField(
//         // validator: ((value) {
//         //   if(value!.isEmpty){
//         //     return 'Please enter a value';
//         //   }
//         // },
//         obscureText: !_passwordVisible,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: preIcon,
//           suffixIcon: isPassword!
//               ? IconButton(
//                   icon: Icon(_passwordVisible
//                       ? Icons.visibility_off
//                       : Icons.visibility),
//                   onPressed: () {
//                     setState(() {
//                       _passwordVisible = !_passwordVisible;
//                     });
//                   },
//                 )
//               : null,
//           disabledBorder: InputBorder.none,
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       ),
//     );
//   }

//   // static void setState(Null Function() param0) {}

//   static Widget button({text, required var page}) {
//     return ElevatedButton(
//         style: ButtonStyle(
//           padding: MaterialStateProperty.all(
//               EdgeInsets.only(right: 30, left: 30, top: 4, bottom: 4)),
//           // minimumSize: MaterialStateProperty.all(),
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//         ),
//         onPressed: () {
//           page();
//         },
//         child: Text(
//           text,
//           style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w500),
//         ));
//   }
// }
