import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

var stage = {
  'nom': 'DUT',
  'niveau': 1,
  'objectif':
      'jkhsdf,nfd dkjsf sd, fbjkdsf jfkdsbf bkjsdiff bsfn,dsb fbjdskdfnsdbji ds,f '
};
var listStage = [
  {
    'nom': 'DUT',
    'niveau': 1,
    'objectif':
        'jkhsdf,nfd dkjsf sd, fbjkdsf jfkdsbf bkjsdiff bsfn,dsb fbjdskdfnsdbji ds,f '
  },
  {
    'nom': 'DUT',
    'niveau': 2,
    'objectif':
        'jkhsdf,nfd dkjsf sd, fbjkdsf jfkdsbf bkjsdiff bsfn,dsb fbjdskdfnsdbji ds,f '
  },
  {
    'nom': 'BTS',
    'niveau': 1,
    'objectif':
        'jkhsdf,nfd dkjsf sd, fbjkdsf jfkdsbf bkjsdiff bsfn,dsb fbjdskdfnsdbji ds,f '
  },
  {
    'nom': 'LyTech',
    'niveau': 3,
    'objectif':
        'jkhsdf,nfd dkjsf sd, fbjkdsf jfkdsbf bkjsdiff bsfn,dsb fbjdskdfnsdbji ds,f '
  }
];

class stageInformation extends StatefulWidget {
  stageInformation({Key? key}) : super(key: key);

  @override
  State<stageInformation> createState() => _stageInformationState();
}

class stageInfos extends StatelessWidget {
  const stageInfos({Key? key}) : super(key: key);
  final index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Stage niveau ${listStage[index]['niveau']} en filiere ${listStage[index]['nom']}")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: listStage[index]['niveau'] == 1
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: size(10, context), right: size(10, context)),
                      child: Text(
                        "Les informations concernant le stage ouvrier sont les suivants :",
                        style: TextStyle(
                          fontSize: taille(21, context),
                        ),
                      ))
                  : Padding(
                      padding: EdgeInsets.only(
                          left: size(10, context), right: size(10, context)),
                      child: Text(
                        "Les informations concernant le stage academique sont les suivant :",
                        style: TextStyle(fontSize: taille(21, context)),
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: const panels(
                  title: "But du stage", contenu: "Le stage a pour but de "),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: const panels(
                  title: "Rapport de stage",
                  contenu: "Le stage a pour but de "),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: const panels(
                  title: "Dates", contenu: "Le stage a pour but de "),
            ),
            Padding(
              padding: EdgeInsets.only(top: size(20, context)),
              child: const panels(
                  title: "Conditions", contenu: "Le stage a pour but de "),
            ),
          ],
        ),
      ),
    );
  }
}

class panels extends StatefulWidget {
  const panels({Key? key, required this.title, required this.contenu})
      : super(key: key);
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
                  )),
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

class _stageInformationState extends State<stageInformation> {
  final index = 1;
  int _current = 0;
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_rounded),
                        iconSize: 30,
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                        // onPressed: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ToolScreen(),
                        //   ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo_iut.png',
                              width: 35,
                            ),
                            Image.asset(
                              'assets/images/kali_light.png',
                              width: 70,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.account_circle_sharp),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              // padding: padding_h,
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size(50, context),
                      margin: EdgeInsets.only(
                        bottom: size(20.0, context),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          )
                        ],
                        color: sampleColorBtn,
                      ),

                      // color: Color.fromARGB(255, 219, 219, 219),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(
                          // "Stage niveau ${listStage[index]['niveau']} en filiere ${listStage[index]['nom']}"))
                          Text(
                            "Stage niveau ${listStage[index]['niveau']} en filiere ${listStage[index]['nom']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: taille(18, context),
                                fontFamily: 'OpenSans_Regular',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size(20, context)),
                      child: listStage[index]['niveau'] == 1
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: size(10, context),
                                  right: size(10, context)),
                              child: Text(
                                "Les informations concernant le stage ouvrier sont les suivants :",
                                style: TextStyle(
                                  fontSize: taille(21, context),
                                ),
                              ))
                          : Padding(
                              padding: EdgeInsets.only(
                                  left: size(10, context),
                                  right: size(10, context)),
                              child: Text(
                                "Les informations concernant le stage academique sont les suivant :",
                                style: TextStyle(fontSize: taille(21, context)),
                              )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size(20, context)),
                      child: const panels(
                          title: "But du stage",
                          contenu: "Le stage a pour but de "),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size(20, context)),
                      child: const panels(
                          title: "Rapport de stage",
                          contenu: "Le stage a pour but de "),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size(20, context)),
                      child: const panels(
                          title: "Dates", contenu: "Le stage a pour but de "),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size(20, context)),
                      child: const panels(
                          title: "Conditions",
                          contenu: "Le stage a pour but de "),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
