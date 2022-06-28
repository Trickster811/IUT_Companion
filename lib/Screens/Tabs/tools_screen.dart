import 'package:flutter/cupertino.dart';
import 'package:iut_companion/Screens/Tabs/components/auths/sign_in.dart';
import 'package:iut_companion/Screens/Tabs/components/letter.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/firebase.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/notifications.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/projects_screen.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class ToolScreen extends StatelessWidget {
  final image = [
    Image.asset(
      'assets/images/intershipOffice.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/iut.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/iut.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/faq.png',
      fit: BoxFit.cover,
    ),
  ];

  final title = [
    'Lettre de Recommendation',
    'WorkSpace',
    'Our Projects',
    'FAQ'
  ];

  // final width = double.maxFinite;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size(250, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomStart,
                colors: [
                  Color.fromARGB(255, 0, 68, 255),
                  Colors.blueAccent,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tools',
                    style: TextStyle(
                      letterSpacing: 15,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                      fontFamily: 'ArialRoundedBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: size(2.5, context),
                    width: size(150, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Text(
                    'Daily Learning',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 10,
                      fontFamily: 'ArialRoundedBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ToolsTabWidget(
            icon: Icons.file_copy_rounded,
            title: title[0],
            description: 'Generate your own Letters of Recommandation.',
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [kPrimaryColor, Colors.purple],
            ),
            security: 0,
          ),
          ToolsTabWidget(
            icon: Icons.security_update_good_rounded,
            title: title[1],
            description: 'Discover all our the projects.',
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Color.fromARGB(255, 0, 68, 255),
                Colors.blueAccent,
              ],
            ),
            security: 1,
          ),
          ToolsTabWidget(
            icon: Icons.settings,
            title: title[2],
            description: 'Discover all our the projects.',
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Color.fromARGB(255, 252, 50, 35),
                Color.fromRGBO(255, 115, 115, 1)
              ],
            ),
            security: 2,
          ),
          ToolsTabWidget(
            icon: Icons.architecture_rounded,
            title: title[3],
            description: 'Discover all our the projects.',
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [Colors.green, Colors.greenAccent],
            ),
            security: 3,
          ),
          Container(
            padding: EdgeInsets.only(bottom: size(50, context)),
            width: double.maxFinite,
            // height: size(20, context),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright',
                  style: TextStyle(
                      fontSize: taille(12, context), color: kPrimaryColor),
                ),
                Icon(
                  Icons.copyright_rounded,
                  color: kPrimaryColor,
                ),
                Text(
                  '2022 | Daily Learning',
                  style: TextStyle(
                      fontSize: taille(12, context), color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ToolsTabWidget extends StatelessWidget {
  final icon, title, description, gradient, security;
  const ToolsTabWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    required this.security,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () => security == 0
          ? showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: Text(
                  'IUT Companion',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ArialRoundedBold',
                  ),
                ),
                message: Text(
                  'Please do you have your student id?',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'ArialRoundedBold',
                  ),
                ),
                actions: [
                  CupertinoActionSheetAction(
                    // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Letter(index: 1),
                        ),
                      );
                    },
                    child: Text('Yes'),
                  ),
                  CupertinoActionSheetAction(
                    // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Letter(index: 2),
                        ),
                      );
                    },
                    child: Text('No'),
                  ),
                ],
              ),
            )
          : security == 2
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectScreen(),
                  ),
                )
              : security == 3
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    )
                  : showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: Text(
                          'IUT Companion',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'ArialRoundedBold',
                          ),
                        ),
                        message: Text(
                          'You have to be logged as "Admin" to access to area',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'ArialRoundedBold',
                          ),
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                            child: Text('Login now'),
                          ),
                        ],
                      ),
                    ),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    gradient: gradient,
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: size(40, context),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    // top: BorderSide(width: 1, color: Colors.black12),
                    bottom: BorderSide(width: 1, color: Colors.black12),
                  ),
                ),
                height: size(65, context),
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        // letterSpacing: 20,
                        color: Colors.black,
                        fontSize: taille(15, context),
                        fontFamily: 'ArialRoundedBold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: taille(12, context),
                        fontFamily: 'ArialRoundedBold',
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size(25, context),
          ),
        ],
      ),
    );
  }
}
