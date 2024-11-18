import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../tab_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                children: [
                  const CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    radius: 60,
                    backgroundColor: Colors.grey,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFffffff),
                        radius: 16,
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: Color(0xFF020D4D),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            createdTextTield(
                label: 'Name',
                preIcon: const Icon(Icons.person),
                isPassword: false),
            createdTextTield(
                label: 'Email',
                preIcon: const Icon(Icons.email),
                isPassword: false),
            createdTextTield(
                label: 'Password', preIcon: Icon(Icons.lock), isPassword: true),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                    right: 30, left: 30, top: 1, bottom: 1)),
                // minimumSize: MaterialStateProperty.all(),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                Get.to(TabControllerPage());
              },
              child: Text(
                'Update',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _passwordVisible = false;
  Widget createdTextTield({Icon? preIcon, bool? isPassword, String? label}) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 199, 217, 232),
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            spreadRadius: 2,
            offset: Offset.fromDirection(.2))
      ], borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: TextFormField(
        // validator: ((value) {
        //   if(value!.isEmpty){
        //     return 'Please enter a value';
        //   }
        // },
        obscureText: isPassword! ? !_passwordVisible : false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: label,
          prefixIcon: preIcon,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(_passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : null,
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
