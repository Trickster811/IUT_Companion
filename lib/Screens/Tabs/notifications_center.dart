import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0,
                  color: kPrimaryColor,
                ),
                color: kPrimaryColor,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/bg_img.png',
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_rounded),
                        iconSize: 30,
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                        // onPressed: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ToolScreen(),
                        //   ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo_iut.png',
                              width: size(35, context),
                            ),
                            Image.asset(
                              'assets/images/AppName_light.png',
                              width: size(130, context),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.adjust_rounded),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              padding: padding_h,
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          fontSize: taille(16, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArialRoundedBold',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
