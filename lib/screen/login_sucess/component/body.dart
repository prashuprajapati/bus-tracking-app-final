import 'package:chaloapp/components/my_button.dart';
import 'package:chaloapp/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:chaloapp/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: MyButton(
                text: "Back to home",
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                })),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
