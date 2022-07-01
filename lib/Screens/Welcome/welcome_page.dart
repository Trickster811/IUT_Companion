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
    color: Colors.black,
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
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg_laucher.png',
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  'assets/images/logo_iut.png',
                  width: size(60, context),
                  height: size(60, context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,),
                  child: Text(
                    'ENSPD COMPANION',
                    style: TextStyle(
                      // color: Colors.white,
                      fontFamily: 'ArialRoundedBold',
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                spinkit,
                Spacer(),
                
                Text(
                  'from',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: taille(16, context),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ArialRoundedBold',
                  ),
                ),
                Image.asset(
                  'assets/images/Daily_learning_black.png',
                  width: size(100, context),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
