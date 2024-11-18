// import 'package:flutter/material.dart';

// class CreatedTextField extends StatefulWidget {
//   Icon? preIcon;
//   bool? isPassword;
//   String? label;
//   String? textValue;
//   var validator;

//   CreatedTextField(this.preIcon, this.isPassword, this.label, this.textValue,
//       this.validator);

//   @override
//   State<CreatedTextField> createState() => _CreatedTextFieldState();
// }

// class _CreatedTextFieldState extends State<CreatedTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 30, right: 10),
//       margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           color: const Color.fromARGB(255, 199, 217, 232),
//           blurRadius: 10,
//           blurStyle: BlurStyle.outer,
//           spreadRadius: 2,
//           offset: Offset.fromDirection(.2),
//         )
//       ], borderRadius: BorderRadius.circular(50), color: Colors.white),
//       child: TextFormField(
//         // controller: ,
//         textInputAction: TextInputAction.next,
//         validator: widget.validator,
//         onSaved: (value) {
//           setState(() {
//             widget.textValue = value;
//             print(value);
//           });
//         },
//         obscureText: widget.isPassword! ? !_passwordVisible : false,
//         decoration: InputDecoration(
//           labelText: widget.label,
//           prefixIcon: widget.preIcon,
//           suffixIcon: widget.isPassword
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
// }
