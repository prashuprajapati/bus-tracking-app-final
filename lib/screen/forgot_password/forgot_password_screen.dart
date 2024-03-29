import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Forgot Password")),
      ),
      body: Body(),
    );
  }
}
