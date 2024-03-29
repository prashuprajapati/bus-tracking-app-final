import 'package:chaloapp/screen/login_sucess/component/body.dart';
import 'package:flutter/material.dart';


class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Center(child: Text("Login Success")),
      ),
      body: Body(),
    );
  }
}
