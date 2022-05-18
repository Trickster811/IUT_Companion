import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/components/description.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Filieres {
  final String title;
  final String intitule;
  final String description;

  const Filieres(this.title, this.intitule, this.description);
}

int _indexFil = 0;

const listFilieres = [
  [
    Filieres('GIN', 'Genie Informatique',
        'Créé en 00/00/0000, la filiere Genie Informatique offre a tout nos étudiant ....'),
    Filieres('GBIO', 'Genie Biologique',
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
    Filieres('GIM', 'Genie Industriel et maintenance',
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
    Filieres('GCD', "Genie Civil et Construction durable",
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
    Filieres('MEB', "Maintenance des equipements biomédicaux",
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
  ],
  [
    Filieres('GLO', "Genie Logiciel",
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
    Filieres('RIN', "Réseaux Informatique",
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
    Filieres('GBIO', 'Genie Biologique',
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
  ],
  [
    Filieres('GLO', "Genie Logiciel",
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
    Filieres('RIN', "Réseaux Informatique",
        'Le genie informatique es une filiere consacrée aux informaticien afin de ...'),
  ],
];

class Filiere extends StatefulWidget {
  const Filiere({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Filiere> createState() => _FiliereState();
}

class _FiliereState extends State<Filiere> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size(20.0, context),
                bottom: size(20.0, context),
                left: size(20.0, context)),
            child: Text(
              "DUT",
              style: TextStyle(
                fontSize: taille(22.0, context),
                fontFamily: 'OpenSans_Regular',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              cardFiliere("GIN", "Genie Informatique", Colors.blue, 1, 0),
              cardFiliere("GBIO", "Genie Biologique",
                  Color.fromARGB(255, 15, 150, 44), 1, 1),
              cardFiliere("GIM", "Genie Industriel et maintenance",
                  Color.fromARGB(255, 207, 132, 19), 1, 2),
              cardFiliere("GCD", "Genie Civil et Construction durable",
                  Color.fromARGB(255, 196, 199, 3), 1, 3),
              cardFiliere("MEB", "Maintenance des equipements biomédicaux",
                  Color.fromARGB(255, 7, 153, 129), 1, 4),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size(20.0, context),
                bottom: size(20.0, context),
                left: size(20.0, context)),
            child: Text("BTS",
                style: TextStyle(
                  fontSize: taille(22.0, context),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans_Regular',
                )),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              cardFiliere("GLO", "Genie Logiciel", Colors.blue, 2, 0),
              cardFiliere("RIN", "Réseaux Informatique",
                  Color.fromARGB(255, 181, 85, 236), 2, 1),
              cardFiliere("GBIO", "Genie Biologique",
                  Color.fromARGB(255, 43, 187, 14), 2, 2),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size(20.0, context),
                bottom: size(20.0, context),
                left: size(20.0, context)),
            child: Text(
              "LiTech",
              style: TextStyle(
                fontSize: taille(22.0, context),
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans_Regular',
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              cardFiliere("GLO", "Genie Logiciel", Colors.blue, 3, 0),
              cardFiliere("RIN", "Réseaux Informatique",
                  Color.fromARGB(255, 181, 85, 236), 3, 1),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(bottom: size(60, context)),
            width: double.maxFinite,
            height: size(100.0, context),
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
                  '2022 | IUT Ngaoundere',
                  style: TextStyle(
                      fontSize: taille(12, context), color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class cardFiliere extends StatelessWidget {
  String title = "";
  String description = "";
  Color cardColor = Colors.white;
  int tab = 0;
  int index = 0;

  cardFiliere(
      String titre, String descrip, Color cardCol, int tableau, int id) {
    this.title = titre;
    this.description = descrip;
    this.cardColor = cardCol;
    this.tab = tableau;
    this.index = id;
  }

  @override
  Widget build(BuildContext context) => Card(
        color: cardColor,
        margin: EdgeInsets.only(
            left: size(10.0, context), right: size(10.0, context)),
        elevation: 8,
        child: new InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    InfoFiliere(fil: listFilieres[tab - 1][index]),
              ),
            );
          },
          child: Container(
              width: size(200.0, context),
              height: size(130.0, context),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.only(
                  left: size(15.0, context), top: size(10.0, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: taille(24, context),
                              color: Colors.white,
                              fontFamily: 'OpenSans_Regular',
                              fontWeight: FontWeight.w500)),
                      Padding(
                        padding: EdgeInsets.only(left: size(98, context)),
                        child: Icon(Icons.zoom_in, color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size(7, context)),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: taille(18, context),
                        color: Color.fromARGB(255, 238, 238, 238),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      );
}
