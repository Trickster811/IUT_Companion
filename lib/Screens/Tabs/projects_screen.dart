import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/page_view.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';
import 'package:iut_companion/Screens/Tabs/side_bar_menu.dart';
import 'package:iut_companion/constants.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: CupertinoSearchTextField(
          // decoration: BoxDecoration(),
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          borderRadius: BorderRadius.circular(30),
          onChanged: (String value) {
            print('The text has changed to: $value');
          },
          onSubmitted: (String value) {
            print('Submitted text: $value');
          },
        ),
      ),
      drawer: SideBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size(250, context),
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Projects',
                          style: TextStyle(
                            letterSpacing: 15,
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'OpenSans_Regular',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Daily Learning',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'OpenSans_Regular',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabWidget(
                  icon: Icons.computer_rounded,
                  title: 'Génie Informatique',
                  description: 'Discover all our the projects.',
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomStart,
                    colors: [kPrimaryColor, Colors.purple],
                  ),
                ),
                TabWidget(
                  icon: Icons.biotech_outlined,
                  title: 'Génie Biologique',
                  description: 'Discover all our the projects.',
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomStart,
                    colors: [
                      Color.fromARGB(255, 0, 68, 255),
                      Colors.blueAccent
                    ],
                  ),
                ),
                TabWidget(
                  icon: Icons.settings,
                  title: 'Génie Idustrielle et Maintenance',
                  description: 'Discover all our the projects.',
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomStart,
                    colors: [
                      Color.fromARGB(255, 252, 50, 35),
                      Color.fromRGBO(255, 115, 115, 1)
                    ],
                  ),
                ),
                TabWidget(
                  icon: Icons.architecture_rounded,
                  title: 'Génie Civil et Dévéloppement Durable',
                  description: 'Discover all our the projects.',
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomStart,
                    colors: [Colors.green, Colors.greenAccent],
                  ),
                ),
                TabWidget(
                  icon: Icons.medical_services_outlined,
                  title: 'Maintenance des Equipement Biomédicaux',
                  description: 'Discover all our the projects.',
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomStart,
                    colors: [
                      Colors.orange,
                      Color.fromARGB(255, 255, 185, 94),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: size(25, context)),
              width: double.maxFinite,
              // height: size(20, context),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Copyright',
                    style: TextStyle(
                        fontSize: taille(12, context), color: kPrimaryColor),
                  ),
                  Icon(
                    Icons.copyright_rounded,
                    color: kPrimaryColor,
                  ),
                  Text(
                    '2022 | Daily Learning',
                    style: TextStyle(
                        fontSize: taille(12, context), color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  final icon;
  final title;
  final description;
  final gradient;
  const TabWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectView(),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    gradient: gradient,
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: size(40, context),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    // top: BorderSide(width: 1, color: Colors.black12),
                    bottom: BorderSide(width: 1, color: Colors.black12),
                  ),
                ),
                height: size(65, context),
                width: 225,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        // letterSpacing: 20,
                        color: Colors.black,
                        fontSize: taille(15, context),
                        fontFamily: 'OpenSans_Regular',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   height: size(2, context),
                    // ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: taille(12, context),
                        fontFamily: 'OpenSans_Regular',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                    child: Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.black26,
                )),
              )
            ],
          ),
          SizedBox(
            height: size(25, context),
          ),
        ],
      ),
    );
  }
}
