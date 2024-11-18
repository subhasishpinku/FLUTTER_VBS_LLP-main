import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        // child:FlutterLogo(size:MediaQuery.of(context).size.height)
      child: Image.asset('images/logo.jpg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // return Scaffold(
    //   body: Container(
    //     color: Colors.green,
    //     width: double.infinity,
    //     height: 500,
    //     child: Align(
    //       alignment: Alignment.center,
    //       child: Container(
    //         width: MediaQuery.of(context).size.width * 0.9,
    //         height: 100,
    //         color: Colors.amber,
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
          body: SingleChildScrollView(
        child: Stack(
            children:<Widget>[
               Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                padding: const EdgeInsets.only(left: 20, right: 50, top: 50),
                 child: Image.asset('images/stape1.png', fit: BoxFit.cover,
                   height: 100, width: 100,),

              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 450),
                child: Text("Lorem Ipsum",
                  style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 500),
                child: Text("Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                  style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 650),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset('images/dot.png', fit: BoxFit.contain,
                            height: 50, width: 50,),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 650),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                    ),
                     // FlatButton(
                        Column(
                         children: <Widget>[
                           // Image.asset('images/arrow.png', fit: BoxFit.contain,
                           //   height: 50, width: 50,),
                           Material(
                             child: InkWell(
                               onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdScreen()));
                               },
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(20.0),
                                 child: Image.asset('images/arrow.png', fit: BoxFit.contain,
                                   height: 50, width: 50,),

                               ),

                             ),
                           )

                         ],
                       ),
                       // onPressed: () {
                       //   Navigator.push(
                       //     context,
                       //     MaterialPageRoute(
                       //       builder: (context) => const ThirdScreen(),
                       //     ),
                       //   );
                       // },
                    // ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );

  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
            children:<Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                padding: const EdgeInsets.only(left: 20, right: 50, top: 50),
                child: Image.asset('images/stp.png', fit: BoxFit.cover,
                  height: 100, width: 100,),
              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 450),
                child: Text("Lorem Ipsum",
                  style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 500),
                child: Text("Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                  style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 650),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset('images/step2.png', fit: BoxFit.contain,
                            height: 50, width: 50,),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 650),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      // child: Column(
                      //   children: <Widget>[
                      //     // Image.asset('images/arrow.png', fit: BoxFit.contain,
                      //     //   height: 50, width: 50,),
                      //     Material(
                      //       child: InkWell(
                      //         onTap: () {},
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(20.0),
                      //           child: Image.asset('images/arrow.png', fit: BoxFit.contain,
                      //             height: 50, width: 50,),
                      //         ),
                      //       ),
                      //     )
                      //
                      //   ],
                      // ),
                      child: Column(
                        children: <Widget>[
                          // Image.asset('images/arrow.png', fit: BoxFit.contain,
                          //   height: 50, width: 50,),
                          Material(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const FourthScreen()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('images/arrow.png', fit: BoxFit.contain,
                                  height: 50, width: 50,),

                              ),

                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
            children:<Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                padding: const EdgeInsets.only(left: 20, right: 50, top: 50),
                child: Image.asset('images/stp3.png', fit: BoxFit.none,
                  height: 400, width: 400,),
              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 450),
                child: Text("Lorem Ipsum",
                  style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              ),
              const Padding(
                padding:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 500),
                child: Text("4Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                  style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 650),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset('images/dot3.png', fit: BoxFit.contain,
                            height: 50, width: 50,),
                        ],
                      ),

                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 650),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: <Widget>[
                          // Image.asset('images/arrow.png', fit: BoxFit.contain,
                          //   height: 50, width: 50,),
                          Material(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('images/arrow.png', fit: BoxFit.contain,
                                  height: 50, width: 50,),
                              ),
                            ),
                          )

                        ],
                      ),

                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Arial',
);

const wbLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Arial',
);

const errLabelStyle = TextStyle(
  color: Color(0xFFC9E26C),
  fontSize: 16,
  fontWeight: FontWeight.bold,
  fontFamily: 'Arial',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFF5F8FC),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final errorBoxDecorationStyle = BoxDecoration(
  color: Colors.transparent,
  borderRadius: BorderRadius.circular(10.0),
);
bool onLogin = false;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final appKeyController = TextEditingController();
  final loginErrorController = TextEditingController();
  bool _checkbox = false;
  bool _checkboxListTile = false;
  Widget _buildUsernameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Username',
          style: wbLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: usernameController,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Arial',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.black,
              ),
              hintText: 'Enter User Name',
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
              // hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: wbLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Arial',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Enter your Password',
              //hintStyle: kHintTextStyle,
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildErrorTextField() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            decoration: errorBoxDecorationStyle,
            child: Text(
                loginErrorController.text ?? '',
                style: errLabelStyle),
          ),
          const SizedBox(height: 10.0)
        ]);
  }
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color:const Color(0xFF2490EA),
        child: !onLogin
            ? const Text(
          'SIGN IN',
          style: TextStyle(
            color: Color(0xFFF1F6F6),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
  Widget _buildforgotpasseord_remember() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child:  Container(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _checkbox,
                  onChanged: (value) {
                    setState(() {
                      _checkbox = !_checkbox;
                    });
                  },
                ),
                Text('I am true now'),
              ],
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('I am true now'),
              value: _checkboxListTile,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile = !_checkboxListTile;
                });
              },
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFF1F6F6),
                          Color(0xFFF1F6F6),
                          Color(0xFFF1F6F6),
                          Color(0xFFF1F6F6),
                        ],
                        stops: [0.3, 0.5, 0.7, 0.9],
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/logos.png', fit: BoxFit.contain,
                            height: 180, width: 180,),
                          const SizedBox(height: 10.0),
                          const SizedBox(height: 10.0),
                          _buildUsernameTextField(),
                          const SizedBox(height: 30.0,),
                          _buildPasswordTextField(),
                          const SizedBox(height: 20.0,),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text("Forgot password?",
                              style: TextStyle(fontSize: 15),textAlign: TextAlign.end,
                            ),
                          ),
                          _buildLoginBtn(),
                          _buildErrorTextField(),
                          //  _buildAppKeyTextField(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}