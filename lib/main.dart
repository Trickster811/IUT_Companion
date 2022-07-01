// ************************************************************
// ************************************************************
// ***  Copyright 2022 Daily Learning. All rights reserved. ***
// ***     by Jo@chim Ned@ouk@ and B@d@ne Je@n Chretien.    ***
// ************************************************************
// ************************************************************

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Welcome/welcome_page.dart';
import 'package:iut_companion/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// void main()  => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IUT Companion',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 243, 243, 243),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          // border: textFieldBorder,
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}
