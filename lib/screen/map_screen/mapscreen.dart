import 'package:chaloapp/screen/map_screen/components/body.dart';
import 'package:flutter/material.dart';

class Mappage extends StatelessWidget {
  const Mappage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapSelectionPage(),
    );
  }
}