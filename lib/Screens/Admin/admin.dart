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
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int index = 0;

  final screens = [
    HomeAdmin(),
    DashboardAdmin(),
    SearchAdmin(),
    ProfileAdmin(),
    ToolsAdmin()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
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
