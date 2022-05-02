import 'package:iut_companion/Screens/Admin/components/adminTabWork.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Icon(
          Icons.menu_open_rounded,
          size: 30,
        ),
        actions: [
          Icon(
            Icons.account_circle_sharp,
            size: 30,
          )
        ],
        title: Image.asset(
          'assets/images/AppName_light.png',
          width: size(150, context),
          height: size(100, context),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Container(
        // padding: padding_h,
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(children: [
          Positioned(
            right: -120,
            bottom: 0,
            child: Image.asset(
              'assets/images/logo_iut.png',
              color: Colors.white.withOpacity(0.2),
              colorBlendMode: BlendMode.modulate,
              width: 350,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Welcome!! Admin',
                    style: TextStyle(
                      fontFamily: 'OpenSans_Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Let's choose a task and manage our application.",
                    style: TextStyle(
                      fontFamily: 'OpenSans_Regular',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Actions(
                            icon: Icons.newspaper_rounded,
                            title: 'Add News',
                            link: AdminWorkSpace(index: 0),
                          ),
                          Actions(
                            icon: Icons.class_rounded,
                            title: 'Add Stage Infos',
                            link: AdminWorkSpace(index: 1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Actions(
                            icon: Icons.school_rounded,
                            title: 'Add Concours',
                            link: AdminWorkSpace(index: 2),
                          ),
                          Actions(
                            icon: Icons.home_work_rounded,
                            title: 'Update Scolarity Infos',
                            link: AdminWorkSpace(index: 3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  final icon, title, link;
  const Actions({
    Key? key,
    required this.icon,
    required this.title,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size(150, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 216, 216, 216),
            // blurStyle: BlurStyle.solid,
            blurRadius: 5.0,
            // spreadRadius: 1.0,
            offset: Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, 0),
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(5, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 75,
            color: Color.fromARGB(255, 4, 77, 145),
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => link,
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
