// import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/components/concours.dart';
import 'package:iut_companion/Screens/Tabs/components/filliere.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  final page = [ConcoursPage()];
  final width = double.infinity;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: TabBar(
              indicatorColor: Color.fromARGB(255, 112, 19, 122),
              tabs: [
                Tab(
                  child: Text(
                    'Concours',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Filieres',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: TabBarView(
              children: [
                buildPage(1),
                buildPage(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(int index) =>
      index == 1 ? ConcoursPage() : Filiere(title: 'title');
}