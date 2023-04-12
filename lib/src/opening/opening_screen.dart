import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:weewee_delivery/src/deliver/deliver_main_screen.dart';
import 'package:weewee_delivery/src/onboarding/onboarding_screen.dart';

import '../constant/constant.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({ super.key });

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

const colorizeColors = [
  Colors.deepPurple,
  Colors.yellowAccent,
  Colors.deepPurple,
];

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Container(
                  height: width*.35,
                  width: width*.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/logo.png")
                    )
                  ),
                ),
                Container(
                  child: AnimatedTextKit(
                    pause: const Duration(milliseconds: 0),
                    totalRepeatCount: 0,
                    animatedTexts: [
                       ColorizeAnimatedText(
                        'WeeWee Delivery',
                        textStyle: const  TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        colors: colorizeColors,
                        speed: Duration(milliseconds: 100)
                      ),
                    ],
                    isRepeatingAnimation: false,
                    onFinished: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  OnboardingScreen()),//OnboardingScreen
                      );
                    },
                  ),

                ),
                SizedBox(height: height*.05,)
              ],
            ),
            Positioned(
                bottom: 30,
                child: Text("Copyright © WeeWee 2021",style: TextStyle(
                  color: Colors.black54
                ),))
          ],
        ),
      ),
    );
  }
}