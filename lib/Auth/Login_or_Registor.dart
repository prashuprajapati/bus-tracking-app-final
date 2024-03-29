// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:chaloapp/pages/Sign_up.dart';
import 'package:chaloapp/pages/login_page.dart';

class LoginOrRegistor extends StatefulWidget {
  const LoginOrRegistor({super.key});

  @override
  State<LoginOrRegistor> createState() => _LoginOrRegistorState();
}

class _LoginOrRegistorState extends State<LoginOrRegistor> {
// intially show the login page
  bool showLoginPage = true;

// toggle between login or registor page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage();
    } else {
      return Signup();
    }
  }
}
