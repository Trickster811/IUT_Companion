import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/add_entrance_exam.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/add_news.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/send_notification.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/update_Intership.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/update_filiere.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/update_lettre.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';
import 'package:iut_companion/constants.dart';

class Constructor extends StatelessWidget {
  final index;
  const Constructor({
    Key? key,
    required this.index,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final tabs = [
      AddNews(),
      SendNotifications(),
      UpdateLetter(),
      EntranceExam(),
      Interships(),
      UpdateFiliere(),
    ];
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
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        ),
                        icon: Icon(Icons.notifications),
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
              child: tabs[index],
            ),
          ),
        ],
      ),
    );
  }
}
