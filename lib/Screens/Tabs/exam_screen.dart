import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/components/stage.dart';
import 'package:iut_companion/Screens/Tabs/components/scolarity.dart';

class ExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        // padding: padding_h,
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
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
                child: DefaultTabController(
              length: 2,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: TabBar(
                        indicatorColor: Color.fromARGB(255, 112, 19, 122),
                        tabs: [
                          Tab(
                            child: Text(
                              'Stage',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Scolarite',
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
                  ),
                  Flexible(
                    flex: 10,
                    child: Container(
                      // color: Color.fromARGB(255, 221, 221, 221),
                      child: TabBarView(
                        children: [
                          buildPage(1),
                          buildPage(2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget buildPage(int index) => index == 1 ? Stage() : Scolarite();
}
