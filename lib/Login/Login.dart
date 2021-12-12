import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'SignUpPage.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      initialRoute: "login",
      routes: {
        'login' : (_) => LoginPage(),
        'registrarse' : (_) => SignUpPage(),
      },
    );
  }

}