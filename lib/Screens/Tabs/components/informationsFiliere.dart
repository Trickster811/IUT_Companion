import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';
import 'package:iut_companion/constants.dart';

class panels extends StatefulWidget {
  const panels({
    Key? key,
    required this.title,
    required this.contenu,
  }) : super(key: key);
  final title;
  final contenu;

  @override
  State<panels> createState() => _panelStates();
}

class _panelStates extends State<panels> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      dividerColor: Colors.black,
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 156, 156, 156),
                  height: size(0.8, context),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: size(10, context),
                    right: size(0, context),
                  ),
                ),
              ],
            );
          },
          body: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: size(10, context),
                  right: size(10, context),
                  top: size(10, context),
                ),
                child: Text(
                  widget.contenu,
                  style: TextStyle(
                    fontSize: taille(20, context),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          isExpanded: _expanded,
          canTapOnHeader: true,
        ),
      ],
      elevation: 0,
      //dividerColor: Colors.black,
      expansionCallback: (panelIndex, isExpanded) {
        _expanded = !_expanded;
        setState(() {});
      },
    );
  }
}

class StageInfo extends StatelessWidget {
  final Map index;
  const StageInfo({
    Key? key,
    required this.index,
  }) : super(key: key);
  // int _current = 0;
  // bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      // backgroundColor: Color.fromARGB(230, 247, 247, 247),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          "Stage niveau ${index['niveau']}\nmention ${index['nom']}",
          textAlign: TextAlign.center,
          style: TextStyle(
            // color: kPrimaryColor,
            fontSize: taille(18, context),
            fontFamily: 'OpenSans_Regular',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationScreen(),
              ),
            ),
            icon: Icon(Icons.notifications),
            iconSize: 25,
            color: Colors.white,
          ),
        ],
      ),
      // drawer: SideBar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size(100, context),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo_iut.png',
                        width: 35,
                      ),
                      Image.asset(
                        'assets/images/AppName_light.png',
                        width: size(130, context),
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: index['niveau'] == 1
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: size(10, context), right: size(10, context)),
                      child: Text(
                        "Les informations concernant le stage ouvrier sont les suivants :",
                        style: TextStyle(
                          fontSize: taille(15, context),
                        ),
                      ))
                  : Padding(
                      padding: EdgeInsets.only(
                          left: size(10, context), right: size(10, context)),
                      child: Text(
                        "Les informations concernant le stage academique sont les suivant :",
                        style: TextStyle(fontSize: taille(15, context)),
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: panels(
                title: "But du stage",
                contenu: index['objectif'],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: panels(
                title: "Dates",
                contenu: "index['periode']",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: panels(
                title: "Conditions",
                contenu: "index['conditions']",
              ),
            ),
            Padding(
              padding: padding_h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Canevas du Rapport',
                    style: TextStyle(
                      fontSize: taille(17, context),
                      fontFamily: 'OpenSans_Regular',
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: size(40, context),
                    width: size(150, context),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                      ),
                      child: Text(
                        "Obtenir",
                        style: TextStyle(
                          fontSize: taille(17, context),
                          fontFamily: 'OpenSans_Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
