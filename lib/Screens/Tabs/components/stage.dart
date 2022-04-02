import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/components/informationsFiliere.dart';

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

class Stage extends StatefulWidget {
  Stage({Key? key}) : super(key: key);

  @override
  State<Stage> createState() => _StageState();
}

class _StageState extends State<Stage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: size(30, context),
                        bottom: size(10, context),
                        left: size(25, context),
                        right: size(25, context)),
                    padding: EdgeInsets.only(
                      top: size(10, context),
                      bottom: size(10, context),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Niveau 1",
                      style: TextStyle(
                        fontSize: taille(20, context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => stageInformation()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: size(0, context),
                            // bottom: size(20, context),
                            left: size(50, context),
                            right: size(50, context)),
                        padding: EdgeInsets.only(
                          top: size(7, context),
                          bottom: size(7, context),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 187, 187, 187),
                              blurRadius: 10.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "DUT",
                          style: TextStyle(
                            fontSize: taille(16, context),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => stageInformation()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: size(7, context),
                            bottom: size(20, context),
                            left: size(50, context),
                            right: size(50, context)),
                        padding: EdgeInsets.only(
                          top: size(7, context),
                          bottom: size(7, context),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 187, 187, 187),
                              blurRadius: 10.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "BTS",
                          style: TextStyle(
                            fontSize: taille(16, context),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: size(20, context),
                        bottom: size(10, context),
                        left: size(25, context),
                        right: size(25, context)),
                    padding: EdgeInsets.only(
                      top: size(10, context),
                      bottom: size(10, context),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Niveau 2",
                      style: TextStyle(
                        fontSize: taille(20, context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => stageInformation()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: size(7, context),
                            bottom: size(20, context),
                            left: size(50, context),
                            right: size(50, context)),
                        padding: EdgeInsets.only(
                          top: size(7, context),
                          bottom: size(7, context),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 187, 187, 187),
                              blurRadius: 10.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "DUT",
                          style: TextStyle(
                            fontSize: taille(16, context),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: size(20, context),
                        bottom: size(10, context),
                        left: size(25, context),
                        right: size(25, context)),
                    padding: EdgeInsets.only(
                      top: size(10, context),
                      bottom: size(10, context),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Niveau 3",
                      style: TextStyle(
                        fontSize: taille(20, context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => stageInformation()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: size(7, context),
                            bottom: size(20, context),
                            left: size(50, context),
                            right: size(50, context)),
                        padding: EdgeInsets.only(
                          top: size(7, context),
                          bottom: size(7, context),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 187, 187, 187),
                              blurRadius: 10.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "LyTech",
                          style: TextStyle(
                            fontSize: taille(16, context),
                            color: Colors.black,
                          ),
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
