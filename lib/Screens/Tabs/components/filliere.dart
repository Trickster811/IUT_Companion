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
        'La filiere Genie Informatique offre a tous les etudiants desirants devenir des grands ingenieurs en genie logiciel ou en reseautique et internet une formation pointu axee sur le domaine choisit par des enseignant qualifies et meilleures ans leur domaine....'),
    Filieres('GBIO', 'Genie Biologique',
        'Le genie biologique est une filiere consacrée aux biologistes'),
    Filieres('GIM', 'Genie Industriel et maintenance',
        'Le genie industrustrielle et maintenance est une filiere consacrée aux informaticien afin de ...'),
    Filieres('GCD', "Genie Civil et Construction durable",
        'Le genie civil et constructions durables est une filiere consacrée aux desireux de devenir de grands Architectes...'),
    Filieres('MEB', "Maintenance des equipements biomédicaux",
        'Le genie maintenance des equipements biomedicaux est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('MIP', "Maintenance Industrie et Productique",
        'La filiere Maintenance Industrie et Productique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('GMP', "Genie Maintenance et Productique",
        'Le genie Maintenance et Productique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('GEL', "Genie Electrique",
        'Le genie Electrique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('GTE', "Genie Thermique",
        'Le genie Thermique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres(
      'IAB',
      "Industrie Alimentaire Biotechnologique",
      "La filiere de l'Industrie Alimentaire et de la Biotechnologique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...",
    ),
    Filieres('ABB', "Analyse Biologique et Biochimique",
        "La filiere de l'Analyse Biologique et Biochimique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical..."),
    Filieres(
      'GEN',
      "Genie de l'Environnement",
      "Le genie de l'environnement est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...",
    ),
  ],
  [
    Filieres('GLO', "Genie Logiciel",
        "Le genie logiciel est une filiere du Cycle BTS consacrée aux etudiants passionnes par l'informatique en general et par le genie logiciel en particulier..."),
    Filieres(
      'RIN',
      "Réseautique et Internet",
      "La filiere réseautique et internet est une filiere du Cycle BTS consacrée aux etudiants passionnes par l'informatique en general et par l'administration réseau en particulier...",
    ),
    Filieres(
      'IA',
      'Industrie Alimentaire',
      "Le genie informatique es une filiere du Cycle BTS consacrée aux etudiants passionnes par le domaine de la biologie en general et par l'industrie alimentaire en particulier...",
    ),
    Filieres(
      'CGE',
      'Comptabilité et Gestion des Entreprises',
      "Le genie informatique es une filiere du Cycle BTS consacrée aux etudiants passionnes par le domaine des sciences de gestion en général et par celles appliquées aux entreprises en particulier...",
    ),
  ],
  [
    Filieres('GLO', "Genie Logiciel",
        "Le genie logiciel est une filiere consacrée aux detenteur d'un diplome universitaire de technologie ou aux etudiants ayant un BAC+2 desireux d'approfondir leurs acquis en matiere de developpement..."),
    Filieres(
      'RIN',
      "Réseautique et Internet",
      "La filiere réseautique ett internet est une filiere consacrée aux detenteur d'un diplome universitaire de technologie ou aux etudiants ayant un BAC+2 desireux d'approfondir leurs acquis en matiere d'administration réseau...",
    ),
    Filieres('GCD', "Genie Civil et Construction durable",
        'Le genie civil et constructions durables est une filiere consacrée aux desireux de devenir de grands Architectes...'),
    Filieres('MEB', "Maintenance des equipements biomédicaux",
        'Le genie maintenance des equipements biomedicaux est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('MIP', "Maintenance Industrie et Productique",
        'La filiere Maintenance Industrie et Productique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('GMP', "Genie Maintenance et Productique",
        'Le genie Maintenance et Productique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('GEL', "Genie Electrique",
        'Le genie Electrique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres('GTE', "Genie Thermique",
        'Le genie Thermique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...'),
    Filieres(
      'IAB',
      "Industrie Alimentaire Biotechnologique",
      "La filiere de l'Industrie Alimentaire et de la Biotechnologique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...",
    ),
    Filieres('ABB', "Analyse Biologique et Biochimique",
        "La filiere de l'Analyse Biologique et Biochimique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical..."),
    Filieres(
      'GEN',
      "Genie de l'Environnement",
      "Le genie de l'environnement est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...",
    ),
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

    final cycle = [
      'DUT',
      'BTS',
      'LiTech',
    ];
    final parcours = [
      'Génie Informatique',
      'Génie Logiciel',
      'Réseautique et Internet',
      'Génie Biologique',
      'Industrie Alimentaire et Biochimique',
      'Analyse Biologique',
      'Génie Industriel et Maintenance',
      'Génie Maintenance et Productique',
      'Maintenance Idustrielle et Productique',
      'Génie Electrique',
      'Génie Thermique',
      'Génie Civil et Constructions Durables',
      'Maintenance des Equipement Biomédicaux',
    ];

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
              cardFiliere(
                  title: "GIN",
                  description: "Genie Informatique",
                  cardColor: Colors.blue,
                  tab: 1,
                  index: 0),
              cardFiliere(
                  title: "GBIO",
                  description: "Genie Biologique",
                  cardColor: Color.fromARGB(255, 15, 150, 44),
                  tab: 1,
                  index: 1),
              cardFiliere(
                  title: "GIM",
                  description: "Genie Industriel et maintenance",
                  cardColor: Color.fromARGB(255, 207, 132, 19),
                  tab: 1,
                  index: 2),
              cardFiliere(
                  title: "GCD",
                  description: "Genie Civil et Construction durable",
                  cardColor: Color.fromARGB(255, 196, 199, 3),
                  tab: 1,
                  index: 3),
              cardFiliere(
                title: "MEB",
                description: "Maintenance des equipements biomédicaux",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 4,
              ),
              cardFiliere(
                title: 'MIP',
                description: "Maintenance Industrie et Productique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 5,
              ),
              cardFiliere(
                title: 'GMP',
                description: "Genie Maintenance et Productique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 6,
              ),
              cardFiliere(
                title: 'GEL',
                description: "Genie Electrique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 7,
              ),
              cardFiliere(
                title: 'GTE',
                description: "Genie Thermique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 8,
              ),
              cardFiliere(
                title: 'IAB',
                description: "Industrie Alimentaire Biotechnologique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 9,
              ),
              cardFiliere(
                title: 'ABB',
                description: "Analyse Biologique et Biochimique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 10,
              ),
              cardFiliere(
                title: 'GEN',
                description: "Genie de l'Environnement",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 1,
                index: 11,
              ),
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
              cardFiliere(
                  title: "GLO",
                  description: "Genie Logiciel",
                  cardColor: Colors.blue,
                  tab: 2,
                  index: 0),
              cardFiliere(
                  title: "RIN",
                  description: "Réseaux Informatique",
                  cardColor: Color.fromARGB(255, 181, 85, 236),
                  tab: 2,
                  index: 1),
              cardFiliere(
                  title: "IA",
                  description: "Industrie Alimentaire",
                  cardColor: Color.fromARGB(255, 43, 187, 14),
                  tab: 2,
                  index: 2),
              cardFiliere(
                  title: "CGE",
                  description: "Comptabilité et Gestion des Entreprises",
                  cardColor: Color.fromARGB(255, 43, 187, 14),
                  tab: 2,
                  index: 2),
              cardFiliere(
                  title: "TEK",
                  description: "Electricité",
                  cardColor: Color.fromARGB(255, 43, 187, 14),
                  tab: 2,
                  index: 2),
              cardFiliere(
                  title: "ABB",
                  description: "Analyse Biologique et Biochimique",
                  cardColor: Color.fromARGB(255, 43, 187, 14),
                  tab: 2,
                  index: 2),
              cardFiliere(
                  title: "GTE",
                  description: "Génie Thermique",
                  cardColor: Color.fromARGB(255, 43, 187, 14),
                  tab: 2,
                  index: 2),
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
              cardFiliere(
                  title: "GLO",
                  description: "Genie Logiciel",
                  cardColor: Colors.blue,
                  tab: 3,
                  index: 0),
              cardFiliere(
                  title: "RIN",
                  description: "Réseaux Informatique",
                  cardColor: Color.fromARGB(255, 181, 85, 236),
                  tab: 3,
                  index: 1),
              cardFiliere(
                  title: "GCD",
                  description: "Genie Civil et Construction durable",
                  cardColor: Color.fromARGB(255, 196, 199, 3),
                  tab: 3,
                  index: 2),
              cardFiliere(
                title: "MEB",
                description: "Maintenance des equipements biomédicaux",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 3,
              ),
              cardFiliere(
                title: 'MIP',
                description: "Maintenance Industrie et Productique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 4,
              ),
              cardFiliere(
                title: 'GMP',
                description: "Genie Maintenance et Productique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 5,
              ),
              cardFiliere(
                title: 'GEL',
                description: "Genie Electrique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 6,
              ),
              cardFiliere(
                title: 'GTE',
                description: "Genie Thermique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 7,
              ),
              cardFiliere(
                title: 'IAB',
                description: "Industrie Alimentaire Biotechnologique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 8,
              ),
              cardFiliere(
                title: 'ABB',
                description: "Analyse Biologique et Biochimique",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 9,
              ),
              cardFiliere(
                title: 'GEN',
                description: "Genie de l'Environnement",
                cardColor: Color.fromARGB(255, 7, 153, 129),
                tab: 3,
                index: 10,
              ),
            ]),
          ),

          // footer

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
                  '2022 | Daily Learning',
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
  final title;
  final description;
  final cardColor;
  final tab;
  final index;

  const cardFiliere({
    Key? key,
    this.title,
    this.description,
    this.cardColor,
    this.tab,
    this.index,
  }) : super(key: key);

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
                builder: (context) => InfoFiliere(
                  fil: listFilieres[tab - 1][index],
                ),
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
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: taille(24, context),
                        color: Colors.white,
                        fontFamily: 'OpenSans_Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.zoom_in,
                      color: Colors.white,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size(7, context),
                  ),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: taille(18, context),
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
