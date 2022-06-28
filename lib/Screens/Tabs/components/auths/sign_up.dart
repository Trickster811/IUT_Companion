import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:iut_companion/Screens/Admin/components/encrytion.dart';
import 'package:iut_companion/Screens/Tabs/components/auths/sign_in.dart';
import 'package:iut_companion/Screens/Tabs/components/letter.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/tools_screen.dart';
import 'package:iut_companion/constants.dart';
import 'package:iut_companion/manage_db.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  storeNotificationToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance
        .collection('Admin')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'token': token}, SetOptions(merge: true));
  }

  // Variables to get user entries
  final my_con_1 = TextEditingController();

  final my_con_2 = TextEditingController();

  // Form key
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          iconSize: 30,
          color: Colors.white,
          onPressed: () => Navigator.pop(context, ToolScreen()),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg_img.png',
            fit: BoxFit.fitWidth,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_iut.png',
                      width: size(70, context),
                    ),
                    Image.asset(
                      'assets/images/AppName_light_1.png',
                      width: size(145, context),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      ),
                      color: Colors.white),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'ArialRoundedBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Sign In and enjoy withyour companion',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'ArialRoundedBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: _dropdownFormKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textStyle(context, 'Username'),
                                TextFormField(
                                  style: TextStyle(
                                    fontSize: taille(10, context),
                                    height: 1.5,
                                  ),
                                  decoration: InputDecoration(
                                    // icon: Icon(Icons.person),
                                    hintText: 'entrer votre nom',
                                  ),
                                  // value: dropdownvalue_1,
                                  controller: my_con_1,
                                  validator: RequiredValidator(
                                      errorText:
                                          'Veuillez renseigner votre nom'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                textStyle(context, 'Password'),
                                TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                    fontSize: taille(10, context),
                                    height: 1.5,
                                  ),
                                  decoration: InputDecoration(
                                    // icon: Icon(Icons.person),
                                    hintText: 'entrer votre code',
                                  ),
                                  // value: dropdownvalue_1,
                                  controller: my_con_2,
                                  validator: RequiredValidator(
                                      errorText:
                                          'Veuillez renseigner votre code'),
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                // Submit Button

                                Center(
                                  child: SizedBox(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_dropdownFormKey.currentState!
                                            .validate()) {
                                          try {
                                            // final password = EncryptionSalsa20
                                            //     .encryptSalsa20(my_con_2.text);

                                            final userInputs = [
                                              my_con_1.text,
                                              my_con_2.text,
                                            ];
                                            Admin.createAdmin(userInputs);

                                            storeNotificationToken();

                                            showCupertinoModalPopup(
                                              context: context,
                                              builder: (context) =>
                                                  CupertinoActionSheet(
                                                title: Text(
                                                  'Succes!!',
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'ArialRoundedBold',
                                                  ),
                                                ),
                                                message: Text(
                                                  'Welcome Admin ${my_con_1.text}.\nSign In now and start manging the app.',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'ArialRoundedBold',
                                                  ),
                                                ),
                                                actions: [
                                                  CupertinoActionSheetAction(
                                                    // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Go to the Login page
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              SignInScreen(),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      'Get Started',
                                                      style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'ArialRoundedBold',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } catch (e) {
                                            print(e);
                                            return showCupertinoModalPopup(
                                              context: context,
                                              builder: (context) =>
                                                  CupertinoActionSheet(
                                                title: Text(
                                                  'Error!!',
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'ArialRoundedBold',
                                                  ),
                                                ),
                                                message: Text(
                                                  'Sorry some error occured.\nPlease retry.',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'ArialRoundedBold',
                                                  ),
                                                ),
                                                actions: [
                                                  CupertinoActionSheetAction(
                                                    // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'ArialRoundedBold',
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                        // elevation: 0,
                                      ),
                                    ),
                                  ),
                                ),

                                // SizedBox(
                                //   height: 5,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Alredy have an account?",
                                      style: TextStyle(
                                        // color: kPrimaryColor,
                                        fontFamily: 'ArialRoundedBold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          decoration: TextDecoration.underline,
                                          fontSize: taille(10, context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
