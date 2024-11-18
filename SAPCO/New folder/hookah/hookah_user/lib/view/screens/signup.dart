import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/view/screens/login.dart';
import 'package:hookah_user/view/screens/tab_controller_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = '';
  String email = '';
  String? password;
  final _form = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();

  void saveLogin() {
    final valid = _form.currentState!.validate();
    if (!valid) {
      return;
    }
    print('email');
    print(password);
    Get.to(TabControllerPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.asset(
                      'images/loginDesign.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.height * .2,
                    bottom: 0,
                    child: Center(
                      child: Image.asset('images/bmsLogo.png'),
                    ),
                  ),
                ],
              ),
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Register your account.',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              createdTextTield(
                preIcon: const Icon(Icons.person),
                isPassword: false,
                label: 'Full name',
                textValue: email,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }

                  return null;
                }),
              ),
              createdTextTield(
                preIcon: const Icon(Icons.email),
                isPassword: false,
                label: 'Email',
                textValue: password,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your passsord';
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
                label: 'password',
                textValue: password,
                firstPassword: true,
                controller: _passwordController,
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
              createdTextTield(
                preIcon: const Icon(Icons.lock),
                isPassword: true,
                label: 'confirm Password',
                textValue: password,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your passsord';
                  }
                  if (value.toString() != _passwordController.text.trim()) {
                    return 'confirm password not match';
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
                        // Get.to(ForgetpasswordPage());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                    saveLogin();
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(height: 7),
              InkWell(
                child: const Text('Have account? Login'),
                onTap: () {
                  Get.snackbar('title', 'message');
                  Get.offAll(Login());
                },
              ),
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

// ----------------Text field----------------------------------

  bool _passwordVisible = false;
  Widget createdTextTield({
    Icon? preIcon,
    bool? isPassword,
    String? label,
    String? textValue,
    bool firstPassword = false,
    var controller,
    validator,
  }) {
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
        controller: firstPassword ? controller : null,
        textInputAction: TextInputAction.next,
        validator: validator,
        onSaved: (value) {
          setState(() {
            textValue = value;
            print(value);
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
