import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/sub_projects_view.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/side_bar_menu.dart';
import 'package:iut_companion/constants.dart';

class SubProjectScreen extends StatelessWidget {
  final String headTitle;
  final List? tab;
  const SubProjectScreen({
    Key? key,
    required this.headTitle,
    required this.tab,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          'Projects',
          style: TextStyle(
            // letterSpacing: 15,
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'OpenSans_Regular',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // drawer: SideBar(),
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
                          headTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'OpenSans_Regular',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: size(2.5, context),
                          width: size(150, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Daily Learning',
                          style: TextStyle(
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
              children: [
                for (var items in tab!) items,
              ],
            ),

            // footer
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

class SubProjectTabWidget extends StatelessWidget {
  final icon, title, description, gradient, info_tab;
  const SubProjectTabWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    required this.info_tab,
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
          builder: (context) => SubProjectView(
            headTitle: title,
            info_tab: info_tab,
          ),
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
