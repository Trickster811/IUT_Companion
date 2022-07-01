import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:iut_companion/Screens/Admin/search.dart';
import 'package:iut_companion/Screens/Admin/components/adminTabWork.dart';
import 'package:iut_companion/Screens/Admin/components/tabBar.dart';
import 'package:iut_companion/Screens/Admin/dashboard.dart';
import 'package:iut_companion/Screens/Admin/home.dart';
import 'package:iut_companion/Screens/Admin/profile.dart';
import 'package:iut_companion/Screens/Admin/tools.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/tools_screen.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  final List data;
  const AdminScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int index = 0;

  final theme = [
    Text(
      'Home',
      style: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'ArialRoundedBold',
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
    Text(
      'Dashboard',
      style: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'ArialRoundedBold',
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
    CupertinoSearchTextField(
      backgroundColor: Color.fromARGB(255, 139, 139, 139),
      borderRadius: BorderRadius.circular(30),
      onChanged: (String value) {
        print('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        print('Submitted text: $value');
      },
    ),
    Text(
      'Settings',
      style: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'ArialRoundedBold',
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
    CupertinoSearchTextField(
      backgroundColor: Color.fromARGB(255, 139, 139, 139),
      borderRadius: BorderRadius.circular(30),
      onChanged: (String value) {
        print('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        print('Submitted text: $value');
      },
    ),
  ];

  Widget build(BuildContext context) {
    final screens = [
      HomeAdmin(),
      DashboardAdmin(),
      SearchAdmin(),
      ProfileAdmin(data: widget.data),
      ToolsAdmin()
    ];
    return Scaffold(
      extendBody: true,
      body: Container(
        color: Colors.black,
        child: Stack(fit: StackFit.expand, children: [
          Image.asset(
            'assets/images/bg_img.png',
            fit: BoxFit.fitWidth,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'ArialRoundedBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Mr ${widget.data[0]} !!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'ArialRoundedBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      theme[index],
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: screens[index],
                ),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: AdminTabBar(
        index: index,
        onChangedTab: onChangedTab,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => setState(() {
          this.index = 4;
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    // Footer __start__

    // Footer __end__);
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
