import 'dart:async';

import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iut_companion/Screens/Tabs/start.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  final spinkit = SpinKitDualRing(
    color: Colors.white,
    size: 50.0,
    duration: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StartScreen(),
      ),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg_img.png',
            fit: BoxFit.fitWidth,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(children: [
                Spacer(),
                Image.asset(
                  'assets/images/logo_iut.png',
                  width: size(100, context),
                ),
                Image.asset(
                  'assets/images/AppName_light_1.png',
                  width: size(600, context),
                ),
                spinkit,
                Spacer(),
                Text(
                  'from',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: taille(16, context),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans_Regular',
                  ),
                ),
                Image.asset(
                  'assets/images/Daily_learning_white.png',
                  width: size(300, context),
                ),
                SizedBox(
                  height: 10,
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
