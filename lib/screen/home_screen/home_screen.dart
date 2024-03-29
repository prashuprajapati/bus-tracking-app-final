
import 'package:chaloapp/components/my_drawer.dart';
import 'package:chaloapp/screen/home_screen/components/body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Center(
          child: Text('Chalo Bus')),
      ),
      body:  Body(),
    drawer:  const MyDrawer(),
    );
  }
}
