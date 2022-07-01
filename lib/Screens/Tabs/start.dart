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
import 'package:iut_companion/Screens/Tabs/tools_screen.dart';
import 'package:iut_companion/constants.dart';
// import 'package:flutter_icons/flutter_icons.dart';

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

      body: index == 2
          ? NestedScrollView(
              // physics: ClampingScrollPhysics(),
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: kPrimaryColor,
                  collapsedHeight: size(60, context),
                  expandedHeight: index == 2 ? 100 : 10,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    expandedTitleScale: 1,
                    titlePadding: EdgeInsets.only(
                      // right: size(50, context),
                      bottom: size(15, context),
                      // left: size(5, context),
                    ),
                    title: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Spacer(),
                          Image.asset(
                            'assets/images/logo_iut.png',
                            width: size(30, context),
                          ),
                          Text(
                            'ENSPD COMPANION',
                            style: TextStyle(
                              // decoration: TextDecoration.underline,
                              color: kPrimaryColor,
                              fontFamily: 'ArialRoundedBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                            color: kPrimaryColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                            iconSize: taille(25, context),
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                    // titlePadding: EdgeInsets.only(left: 100),
                    // background: Image.asset(
                    //   'assets/images/bg_img.png',
                    //   fit: BoxFit.cover,
                    // ),
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
                    top: size(30, context),
                    bottom: 5,
                  ),
                  color: kPrimaryColor,
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/logo_iut.png',
                          width: size(30, context),
                        ),
                        Text(
                          'ENSPD COMPANION',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'ArialRoundedBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
                          color: kPrimaryColor,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert),
                          iconSize: taille(25, context),
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
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
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                  child: screens[index],
                ),
              ],
            ),
      // Footer __start__

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
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
