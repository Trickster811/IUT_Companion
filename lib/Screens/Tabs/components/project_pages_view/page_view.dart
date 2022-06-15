import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

class ProjectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: IconButton(
            onPressed: () {}, icon: Icon(Icons.file_download_outlined,),),
      ),
      body: Container(
        height: size(400, context),
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                      letterSpacing: 15,
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'OpenSans_Regular',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Daily Learning',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'OpenSans_Regular',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
