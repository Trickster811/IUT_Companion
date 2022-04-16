import 'package:iut_companion/Screens/Admin/admin.dart';
import 'package:iut_companion/Screens/Tabs/components/auths/sign_up.dart';
import 'package:iut_companion/Screens/Tabs/components/letter.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/start.dart';
import 'package:iut_companion/Screens/Tabs/tools_screen.dart';
import 'package:iut_companion/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_database/firebase_database.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  authentification(idmat) async {
    // QuerySnapshot querySnapshot;
    List docs = [];
    try {
      FirebaseFirestore.instance
          .collection('User')
          .doc(idmat[0])
          .get()
          .then((DocumentSnapshot doc) {
        print(doc.data());
        print(idmat);
        docs.add(doc['username']);
        docs.add(doc['password']);
        if (docs[1] == idmat[1]) {
          // Go to the admin page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AdminScreen(),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Display a message to user
                content: Column(
                  children: [
                    Text(
                      'Username or Password incorrect',
                      style: TextStyle(
                        fontSize: taille(12, context),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      });
      // return 0;
    } catch (e) {
      print(e);
    }
  }

  _openMyPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AdminScreen(),
      ),
    );
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
                          'Sign In',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'OpenSans_Regular',
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
                            fontFamily: 'OpenSans_Regular',
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
                                TextTitle(title: 'Username'),
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
                                TextTitle(title: 'Password'),
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
                                          final data = [
                                            my_con_1.text,
                                            my_con_2.text,
                                          ];
                                          authentification(data);
                                          // update(userInputs);

                                        }
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'OpenSans_Regular',
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
                                      "Don't have an account?",
                                      style: TextStyle(
                                        // color: kPrimaryColor,
                                        fontFamily: 'OpenSans_Regular',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpScreen(),
                                        ),
                                      ),
                                      child: Text(
                                        'Sign Up',
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
