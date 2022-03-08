import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:guilt_app/constants/assets.dart';
import 'package:guilt_app/utils/routes/routes.dart';
import 'package:guilt_app/widgets/app_logo.dart';

import '../../widgets/rounded_button_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.welcome_login, (Route<dynamic> route) => false);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 15,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: AppLogoWidget(
                    width: 140.0,
                    height: 140.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20),
                  child: Text(
                    'Guilt App',
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20),
                  child: Text(
                    'free guide will tell about the impact your gift will have',
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 30),
                  child: Container(
                    height: 50,
                    width: 310,
                    child: TextField(
                      // controller: nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                        labelText: '   Enter Mail',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Container(
                    height: 50,
                    width: 310,
                    child: TextField(
                      obscureText: passenable,
                      //if passenable == true, show **, else show password character
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_sharp),
                          border: OutlineInputBorder(),
                          hintText: "Enter Password",
                          labelText: "Password",
                          suffix: IconButton(
                              onPressed: () {
                                //add Icon button at end of TextField
                                setState(() {
                                  //refresh UI
                                  if (passenable) {
                                    //if passenable == true, make it false
                                    passenable = false;
                                  } else {
                                    passenable =
                                        true; //if passenable == false, make it true
                                  }
                                });
                              },
                              icon: Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Icon(
                                  passenable == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ))
                          //eye icon if passenable = true, else, Icon is ***__
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 210, top: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.forgot_password,
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20),
                  child: ElevatedButtonWidget(
                    buttonText: 'Login',
                    buttonColor: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.after_login, (Route<dynamic> route) => false);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20),
                  child: Container(
                      child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign up',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {})
                          ]),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/6956/6956877.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Face Recognition',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
