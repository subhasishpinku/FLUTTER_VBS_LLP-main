import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetpasswordPage extends StatefulWidget {
  const ForgetpasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetpasswordPage> createState() => _ForgetpasswordPageState();
}

class _ForgetpasswordPageState extends State<ForgetpasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Fogot Password",
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Forget Password',
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                'It is a long established fact\n that a reader will be destracted by',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset('images/forgetpass.png'),
              createdTextTield(label: 'Phone', preIcon: Icon(Icons.phone)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text('Remember password? login')),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.only(
                        right: 30, left: 30, top: 4, bottom: 4)),
                    // minimumSize: MaterialStateProperty.all(),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Send',
                    style: GoogleFonts.poppins(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }

  // bool _passwordVisible = false;
  Widget createdTextTield({Icon? preIcon, String? label}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 199, 217, 232),
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
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: label,
          prefixIcon: preIcon,
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
