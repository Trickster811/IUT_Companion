import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iut_companion/Screens/Tabs/about_app.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/exam_screen.dart';
import 'package:iut_companion/Screens/Tabs/home_screen.dart';
import 'package:iut_companion/Screens/Tabs/new_screen.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';
import 'package:iut_companion/Screens/Tabs/school_screen.dart';
import 'package:iut_companion/Screens/Tabs/side_bar_menu.dart';
import 'package:iut_companion/Screens/Tabs/tools_screen.dart';
import 'package:iut_companion/constants.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int index = 2;

  final items = <Widget>[
    Icon(
      Icons.newspaper_rounded,
      size: 30.0,
    ),
    Icon(
      Icons.class_rounded,
      size: 30.0,
    ),
    Icon(
      Icons.home_filled,
      size: 30.0,
    ),
    Icon(
      Icons.school_rounded,
      size: 30.0,
    ),
    Icon(
      Icons.task_alt_rounded,
      size: 30.0,
    ),
  ];

  final screens = [
    NewScreen(),
    SchoolScreen(),
    HomeScreen(),
    ExamScreen(),
    ToolScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      extendBody: true,
      // Header __start__
      // drawer: SideBar(),
      body: Stack(
        children: [
          index == 2
              ? NestedScrollView(
                  // physics: ClampingScrollPhysics(),
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          ),
                          icon: Icon(Icons.notifications_sharp),
                          iconSize: taille(25, context),
                          color: Colors.white,
                        ),
                      ],
                      backgroundColor: kPrimaryColor,
                      collapsedHeight: size(60, context),
                      expandedHeight: index == 2 ? 100 : 10,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsets.only(
                          right: size(50, context),
                          bottom: size(15, context),
                          left: size(5, context),
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/logo_iut.png',
                              width: size(30, context),
                            ),
                            Image.asset(
                              'assets/images/AppName_light.png',
                              width: size(130, context),
                            ),
                          ],
                        ),
                        // titlePadding: EdgeInsets.only(left: 100),
                        background: Image.asset(
                          'assets/images/bg_img.png',
                          fit: BoxFit.cover,
                        ),
                      ),

                      floating: false,
                      // snap: true,
                      pinned: true,
                    ),
                  ],
                  body: Container(
                    padding: padding_h,
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: screens[index],
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height / 100) * 10,
                      padding: EdgeInsets.only(
                        left: size(10, context),
                        right: size(10, context),
                        top: size(30, context),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              'assets/images/logo_iut.png',
                              width: size(30, context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              'assets/images/AppName_light.png',
                              width: size(130, context),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationScreen(),
                              ),
                            ),
                            icon: Icon(Icons.notifications_sharp),
                            iconSize: taille(25, context),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: padding_h,
                      height: (MediaQuery.of(context).size.height / 100) * 90,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                      child: screens[index],
                    ),
                  ],
                ),
          SideBar(),
        ],
      ),
      // Footer __start__

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        child: CurvedNavigationBar(
          color: kPrimaryColor,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: sampleColorBtn,
          index: index,
          height: size(50, context),
          // animationCurve: Curves.easeInOut,
          // animationDuration: Duration(milliseconds: 600),
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
      // Footer __end__
    );
  }
}
