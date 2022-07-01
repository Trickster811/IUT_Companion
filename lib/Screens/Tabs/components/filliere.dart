import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/components/description.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Filieres {
  final String title;
  final String intitule;
  final String description;
  final List images;

  const Filieres(this.title, this.intitule, this.description, this.images);
}

int _indexFil = 0;

const listFilieres = [
  Filieres(
    'GE',
    "Genie Energetique",
    'La filiere Genie Energetique offre a tous les etudiants desirants devenir des grands ingenieurs en genie logiciel ou en reseautique et internet une formation pointu axee sur le domaine choisit par des enseignant qualifies et meilleures ans leur domaine....',
    [
      'assets/images/energy1.png',
      'assets/images/energy2.png',
      'assets/images/energy3.png',
    ],
  ),
  Filieres(
    'GMP',
    "Genie Maritime et Port",
    'Le Genie Maritime et Port est une filiere consacrée aux biologistes',
    [
      'assets/images/martime1.png',
      'assets/images/martime2.png',
    ],
  ),
  Filieres(
    'GME',
    "Genie Mecanique",
    'Le genie Mecanique et maintenance est une filiere consacrée aux etudiant ...',
    [
      'assets/images/mecanique1.png',
      'assets/images/mecanique2.png',
    ],
  ),
  Filieres(
    'MET',
    "Metrologie",
    'La filiere Metrologie est une filiere consacrée aux etudiants desireux de ...',
    [
      'assets/images/meteo1.png',
      'assets/images/meteo2.png',
    ],
  ),
  Filieres(
    'GPR',
    'Genie des Procedes',
    'Le genie des Procedes est une filiere consacrée aux etudiants qui souhaitent devenir des ...',
    [
      'assets/images/process1.png',
      'assets/images/process2.png',
      'assets/images/process3.png',
    ],
  ),
  Filieres(
    'GCI',
    'Genie Civil',
    'Le Genie Civil est une filiere consacrée aux etudiants qui souhaitent devenir des Architechtes...',
    [
      'assets/images/civil1.png',
      'assets/images/civil2.png',
    ],
  ),
  Filieres(
    'GAU',
    'Genie Automobile',
    'Le genie Automobile est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...',
    [
      'assets/images/auto1.png',
      'assets/images/auto2.png',
      'assets/images/auto3.png',
    ],
  ),
  Filieres(
    'GEL',
    'Genie Informtique et Telecommunication',
    'Le genie Electrique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...',
    [
      'assets/images/info1.png',
      'assets/images/info2.png',
      'assets/images/info3.png',
    ],
  ),
  Filieres(
    'GTE',
    'Genie Electrique et Systeme Intelligents',
    'Le genie Thermique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...',
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
  Filieres(
    'IAB',
    'Qualite, Hygiene, Securite et Environnement Industriels',
    "La filiere de l'Industrie Alimentaire et de la Biotechnologique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...",
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
  Filieres(
    'ABB',
    'Energie',
    "La filiere de l'Analyse Biologique et Biochimique est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...",
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
  Filieres(
    'GEN',
    'Science des Donnees et Intelligence Artificielle',
    "Le genie de l'environnement est une filiere consacrée aux etudiants qui souhaitent devenir des maintanciers dans le domaine medical...",
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
  Filieres(
    'GLO',
    'Industrie Chimique et Bioprocedurale',
    "Le genie logiciel est une filiere du Cycle BTS consacrée aux etudiants passionnes par l'informatique en general et par le genie logiciel en particulier...",
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
  Filieres(
    'RIN',
    'Geophysique, Eau et Environnement',
    "La filiere réseautique et internet est une filiere du Cycle BTS consacrée aux etudiants passionnes par l'informatique en general et par l'administration réseau en particulier...",
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
  Filieres(
    'IA',
    'Mecaniques et Materiels',
    "Le genie informatique es une filiere du Cycle BTS consacrée aux etudiants passionnes par le domaine de la biologie en general et par l'industrie alimentaire en particulier...",
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
  Filieres(
    'CGE',
    'Genie Electrique, Electronics, Automation et Telecommunication',
    "Le genie informatique es une filiere du Cycle BTS consacrée aux etudiants passionnes par le domaine des sciences de gestion en général et par celles appliquées aux entreprises en particulier...",
    [
      'assets/images/actu5.png',
      'assets/images/actu6.png',
      'assets/images/actu4.png',
    ],
  ),
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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Row(
              children: [
                Text(
                  "Nos filieres",
                  style: TextStyle(
                    fontSize: taille(22.0, context),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'ArialRoundedBold',
                  ),
                ),
              ],
            ),
          ),

          cardFiliere(
              title: "Genie Energetique",
              description: "Genie Energetique",
              cardColor: Colors.blue,
              index: 0),
          cardFiliere(
              title: "Genie Maritime et Port",
              description: "Genie Maritime et Port",
              cardColor: Color.fromARGB(255, 181, 85, 236),
              index: 1),
          cardFiliere(
              title: "Genie Mecanique",
              description: "Genie Mecanique",
              cardColor: Color.fromARGB(255, 196, 199, 3),
              index: 2),
          cardFiliere(
            title: "Metrologie",
            description: "Metrologie",
            cardColor: Color.fromARGB(255, 7, 153, 129),
            index: 3,
          ),
          cardFiliere(
            title: 'Genie des Procedes',
            description: "Genie des Procedes",
            cardColor: Color.fromARGB(255, 7, 22, 153),
            index: 4,
          ),
          cardFiliere(
            title: 'Genie Civil',
            description: "Genie Civil",
            cardColor: Color.fromARGB(255, 153, 95, 7),
            index: 5,
          ),
          cardFiliere(
            title: 'Genie Automobile',
            description: "Automobile Engineering",
            cardColor: Color.fromARGB(255, 153, 7, 97),
            index: 6,
          ),
          cardFiliere(
            title: 'Genie Informtique et Telecommunication',
            description: "Informations and Telecommunication Engineering",
            cardColor: Color.fromARGB(255, 114, 153, 7),
            index: 7,
          ),
          cardFiliere(
            title: 'Genie Electrique et Systeme Intelligents',
            description: "Electrical Engineering and Intelligent Systems",
            cardColor: Color.fromARGB(255, 153, 36, 7),
            index: 8,
          ),
          cardFiliere(
            title: 'Qualite, Hygiene, Securiteet Environnement Industriels',
            description:
                "Industrial Quality, Hygiene, Security and Environment",
            cardColor: Color.fromARGB(255, 119, 7, 153),
            index: 9,
          ),
          cardFiliere(
            title: 'Energie',
            description: "Energy",
            cardColor: Color.fromARGB(255, 7, 153, 129),
            index: 10,
          ),
          cardFiliere(
            title: 'Science des Donnees et Intelligence Artificielle',
            description: "Data Science and Artificial Intelligence",
            cardColor: Color.fromARGB(255, 31, 153, 7),
            index: 11,
          ),
          cardFiliere(
            title: 'Industrie Chimique et Bioprocedurale',
            description: "Industrial Chemistry and Insutrial Bioprocesses",
            cardColor: Color.fromARGB(255, 7, 153, 129),
            index: 6,
          ),
          cardFiliere(
            title: 'Geophysique, Eau et Environnement',
            description: "Geophysique, Water and Environment",
            cardColor: Color.fromARGB(255, 153, 95, 7),
            index: 12,
          ),
          cardFiliere(
            title: 'Mecaniques et Materiels',
            description: "Mecanics and Materials",
            cardColor: Color.fromARGB(255, 7, 9, 153),
            index: 13,
          ),
          cardFiliere(
            title:
                'Genie Electrique, Electronics, Automation et Telecommunication',
            description: "Automobile Engineering",
            cardColor: kPrimaryColor,
            index: 14,
          ),

          // footer

          Container(
            padding: EdgeInsets.only(bottom: size(10, context)),
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

  final index;

  const cardFiliere({
    Key? key,
    this.title,
    this.description,
    this.cardColor,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        color: cardColor,
        // margin: EdgeInsets.only(
        //     left: size(10.0, context), right: size(10.0, context)),
        elevation: 8,
        child: new InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoFiliere(
                  fil: listFilieres[index],
                ),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: size(170.0, context),
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: taille(24, context),
                    color: Colors.white,
                    fontFamily: 'ArialRoundedBold',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: taille(18, context),
                    color: Color.fromARGB(255, 238, 238, 238),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
