import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah/view/screen/forget_password.dart';
import 'package:hookah/view/screen/home.dart';
import 'package:hookah/tab_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String? password;
  final _form = GlobalKey<FormState>();

  void saveLogin() {
    final valid = _form.currentState!.validate();
    if (!valid) {
      return;
    }
    Get.to(TabControllerPage());
    _form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.asset(
                  'images/loginDesign.png',
                  fit: BoxFit.fill,
                ),
              ),
              Image.asset('images/Logo.png'),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                'Sign in to continue',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              createdTextTield(
                preIcon: const Icon(Icons.email),
                isPassword: false,
                label: 'Email',
                textValue: email,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter a email';
                  }
                  if (!value.contains('.com')) {
                    return 'Please enter a valid email';
                  }

                  return null;
                }),
              ),
              createdTextTield(
                preIcon: const Icon(Icons.lock),
                isPassword: true,
                label: 'Password',
                textValue: password,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your passsord';
                  }
                  if (value.length < 5) {
                    return 'Please enter atleat 5 caracters';
                  }

                  return null;
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Forget Password',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      onTap: () {
                        Get.to(ForgetpasswordPage());
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.only(
                        right: 30, left: 30, top: 1, bottom: 1)),
                    // minimumSize: MaterialStateProperty.all(),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Get.to(TabControllerPage());
                    saveLogin();
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(child: Image.asset('images/gsign.png')),
                  GestureDetector(child: Image.asset('images/fsign.png')),
                  // googlesignin
                  // facebook signin
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Login with OTP',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }

// ----------------Text fiela----------------------------------

  bool _passwordVisible = false;
  Widget createdTextTield(
      {Icon? preIcon,
      bool? isPassword,
      String? label,
      String? textValue,
      validator}) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 30, right: 10),
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 199, 217, 232),
          blurRadius: 10,
          blurStyle: BlurStyle.outer,
          spreadRadius: 2,
          offset: Offset.fromDirection(.2),
        )
      ], borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: TextFormField(
        validator: validator,
        onSaved: (value) {
          setState(() {
            textValue = value;
            print(value);
            print('value');
          });
        },
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
