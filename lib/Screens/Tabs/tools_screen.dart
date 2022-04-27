import 'package:iut_companion/Screens/Tabs/components/auths/sign_in.dart';
import 'package:iut_companion/Screens/Tabs/components/letter.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/notifications.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/school_screen.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class ToolScreen extends StatelessWidget {
  final image = [
    Image.asset(
      'assets/images/letter.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/news.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/faq.png',
      fit: BoxFit.cover,
    ),
  ];

  final title = ['Lettre de Recommendation', 'WorkSpace', 'FAQ'];

  final width = double.maxFinite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
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
        child: Stack(
          children: [
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Section(
                      image: image[0],
                      title: title[0],
                      security: 0,
                    ),
                    Section(
                      image: image[1],
                      title: title[1],
                      security: 1,
                    ),
                    Section(
                      image: image[2],
                      title: title[2],
                      security: 2,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: size(50, context)),
                      width: double.maxFinite,
                      height: size(100, context),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Copyright',
                            style: TextStyle(
                                fontSize: taille(12, context),
                                color: kPrimaryColor),
                          ),
                          Icon(
                            Icons.copyright_rounded,
                            color: kPrimaryColor,
                          ),
                          Text(
                            '2022 | IUT Ngaoundere',
                            style: TextStyle(
                                fontSize: taille(12, context),
                                color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final Image image;
  final String title;
  final int security;

  const Section({
    Key? key,
    required this.image,
    required this.title,
    required this.security,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: size(10, context),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        width: double.maxFinite,
        height: size(250, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 5.0,
          //     offset: Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: image,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryColor,
                  ),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () => security == 0
                        ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Expanded(
                                child: AlertDialog(
                                  title: Text('Hi!!'),
                                  content: Text(
                                    'Are you Student at UIT of Ngaoundere??',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Letter(index: 1),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'YES',
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Letter(index: 2),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'NO',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : security == 2
                            ? print('Goog Job')
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Expanded(
                                    child: AlertDialog(
                                      title: Text('Hi!!'),
                                      content: Text(
                                        'You have to be logged as "Admin" to access to area',
                                      ),
                                      actions: [
                                        TextButton(
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
                                            'Login Now',
                                            style:
                                                TextStyle(color: kPrimaryColor),
                                          ),
                                        ),
                                        // TextButton(
                                        //   onPressed: () {
                                        //     Navigator.of(context).pop();
                                        //   },
                                        //   child: Text(
                                        //     'NO',
                                        //     style:
                                        //         TextStyle(color: Colors.black),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  );
                                },
                              ),

                    // : Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => NotificationPage(),
                    //     ),
                    //   ),

                    child: Text(
                      title,
                      style: TextStyle(fontSize: taille(12, context)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

