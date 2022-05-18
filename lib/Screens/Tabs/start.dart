import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/exam_screen.dart';
import 'package:iut_companion/Screens/Tabs/home_screen.dart';
import 'package:iut_companion/Screens/Tabs/new_screen.dart';
import 'package:iut_companion/Screens/Tabs/school_screen.dart';
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
      extendBody: true,
      // Header __start__

      body: index == 2
          ? NestedScrollView(
              // physics: ClampingScrollPhysics(),
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu_open_rounded),
                    iconSize: taille(30, context),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_sharp),
                      iconSize: taille(30, context),
                    )
                  ],
                  backgroundColor: kPrimaryColor,
                  collapsedHeight: size(100, context),
                  expandedHeight: index == 2 ? 240 : 40,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Hi!! Compagnon'),
                    background: Image.asset(
                      'assets/images/bg_img.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  floating: true,
                  // snap: true,
                  pinned: true,
                ),
              ],
              body: Stack(children: [
                screens[index],
              ]),
            )
          : Column(
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size(10, context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.menu_open_rounded),
                                iconSize: taille(30, context),
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size(10, context),
                                ),
                                child: Column(
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
                              ),
                              IconButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Expanded(
                                      child: AlertDialog(
                                        title: Text('Account Setting'),
                                        content: Text(
                                          'Connect to your account',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                icon: Icon(Icons.notifications_sharp),
                                iconSize: taille(30, context),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: screens[index],
                ),
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
