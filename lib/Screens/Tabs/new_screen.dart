import 'package:iut_companion/Screens/Tabs/components/news/department.dart';
import 'package:iut_companion/Screens/Tabs/components/news/new.dart';
import 'package:iut_companion/Screens/Tabs/components/news/news_concours.dart';
import 'package:iut_companion/Screens/Tabs/components/news/sport.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  int index = 1;

  final tabs = [
    News(),
    Department(),
    Concours(),
    Sport(),
  ];

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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: CupertinoSearchTextField(
                borderRadius: BorderRadius.circular(50),
                onChanged: (String value) {
                  print('The text has changed to: $value');
                },
                onSubmitted: (String value) {
                  print('Submitted text: $value');
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: () => setState(() => this.index = 0),
                          child: Text(
                            'News',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'OpenSans_Regular',
                                fontSize: taille(14, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: () => setState(() => this.index = 1),
                          child: Text(
                            'Departments',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'OpenSans_Regular',
                                fontSize: taille(14, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: () => setState(() => this.index = 2),
                          child: Text(
                            'Concours',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'OpenSans_Regular',
                                fontSize: taille(14, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: () => setState(() => this.index = 3),
                          child: Text(
                            'Sport',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'OpenSans_Regular',
                                fontSize: taille(14, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: tabs[index],
            ),
          ],
        ),
      ),
    );
  }
}
