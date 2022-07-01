import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/page_view.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/sub_projects_screen.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/sub_projects_view.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';
import 'package:iut_companion/Screens/Tabs/side_bar_menu.dart';
import 'package:iut_companion/constants.dart';

class ProjectScreen extends StatelessWidget {
  final List filiereList = [
    [
      Icons.wind_power,
      "Genie Energetique",
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.green, Colors.greenAccent],
      ),
      RIN,
    ],
    [
      Icons.water_rounded,
      "Genie Maritime et Port",
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.blue, Colors.blueAccent],
      ),
      RIN,
    ],
    [
      Icons.settings,
      "Genie Mecanique",
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.red, Colors.redAccent],
      ),
      RIN,
    ],
    [
      Icons.thermostat_auto_rounded,
      "Metrologie",
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Color.fromARGB(255, 32, 0, 173), Colors.blueAccent],
      ),
      RIN,
    ],
    [
      Icons.wifi_protected_setup_sharp,
      'Genie des Procedes',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.orange, Colors.orangeAccent],
      ),
      RIN,
    ],
    [
      Icons.architecture_rounded,
      'Genie Civil',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.tealAccent, Colors.teal],
      ),
      RIN,
    ],
    [
      Icons.car_repair,
      'Genie Automobile',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.brown, Colors.brown.shade200],
      ),
      RIN,
    ],
    [
      Icons.computer_rounded,
      'Genie Informtique et Telecommunication',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.purpleAccent, Colors.purple],
      ),
      RIN,
    ],
    [
      Icons.electrical_services_rounded,
      'Genie Electrique et Systeme Intelligents',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.green, Colors.greenAccent],
      ),
      RIN,
    ],
    [
      Icons.energy_savings_leaf_rounded,
      'Qualite, Hygiene, Securite et Environnement Industriels',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.green, Colors.greenAccent],
      ),
      RIN,
    ],
    [
      Icons.electric_bolt_rounded,
      'Energie',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.yellow, Colors.yellowAccent],
      ),
      RIN,
    ],
    [
      Icons.blur_linear_outlined,
      'Science des Donnees et Intelligence Artificielle',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.blue, Colors.blueAccent],
      ),
      RIN,
    ],
    [
      Icons.biotech_outlined,
      'Industrie Chimique et Bioprocedurale',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.green, Colors.grey],
      ),
      RIN,
    ],
    [
      Icons.online_prediction_rounded,
      'Geophysique, Eau et Environnement',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [kPrimaryColor, Colors.purple],
      ),
      RIN,
    ],
    [
      Icons.construction_rounded,
      'Mecaniques et Materiels',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [Colors.red, Colors.redAccent],
      ),
      RIN,
    ],
    [
      Icons.troubleshoot_sharp,
      'Genie Electrique, Electronics, Automation et Telecommunication',
      'Discover all our the projects.',
      LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomStart,
        colors: [kPrimaryColor, Colors.purple],
      ),
      RIN,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 0, 0, 0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
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
              // decoration: BoxDecoration(
              //   // border: Border.all(
              //   //   width: 0,
              //   //   color: kPrimaryColor,
              //   // ),
              //   // color: kPrimaryColor,
              // ),
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
                            fontFamily: 'ArialRoundedBold',
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
                            fontFamily: 'ArialRoundedBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  for (var item in filiereList)
                    TabWidget(
                      item: item,
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
                              fontSize: taille(12, context),
                              color: kPrimaryColor),
                        ),
                        Icon(
                          Icons.copyright_rounded,
                          color: kPrimaryColor,
                        ),
                        Text(
                          '2022 | Daily Learning',
                          style: TextStyle(
                              fontSize: taille(12, context),
                              color: kPrimaryColor),
                        ),
                      ],
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

class TabWidget extends StatelessWidget {
  final item;

  const TabWidget({
    Key? key,
    required this.item,
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
            headTitle: item[1],
            info_tab: item[4],
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
                    gradient: item[3],
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Icon(
                  item[0],
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
                      item[1],
                      style: TextStyle(
                        // letterSpacing: 20,
                        color: Colors.black,
                        fontSize: taille(15, context),
                        fontFamily: 'ArialRoundedBold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   height: size(2, context),
                    // ),
                    Text(
                      item[2],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: taille(12, context),
                        fontFamily: 'ArialRoundedBold',
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

// Major infos

final List<SubProjectTabWidget> GIN = [
  SubProjectTabWidget(
    icon: Icons.code_rounded,
    title: 'Génie Logiciel',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [
        Colors.orange,
        Color.fromARGB(255, 255, 185, 94),
      ],
    ),
    info_tab: GLO,
  ),
  SubProjectTabWidget(
    icon: Icons.connect_without_contact_rounded,
    title: 'Telecommunication',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [
        Color.fromARGB(255, 252, 50, 35),
        Color.fromRGBO(255, 115, 115, 1)
      ],
    ),
    info_tab: RT,
  ),
  SubProjectTabWidget(
    icon: Icons.cell_tower_rounded,
    title: 'Réautique et Internet',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [
        Color.fromARGB(255, 0, 68, 255),
        Colors.blueAccent,
      ],
    ),
    info_tab: RIN,
  ),
];

final List<SubProjectTabWidget> GBIO = [
  SubProjectTabWidget(
    icon: Icons.troubleshoot_sharp,
    title: 'Industrie Alimentaire et Biotechnologique',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [Color.fromARGB(255, 0, 68, 255), Colors.blueAccent],
    ),
    info_tab: IAB,
  ),
  SubProjectTabWidget(
    icon: Icons.biotech_outlined,
    title: 'Analyse Biologique et Biochimique',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [kPrimaryColor, Colors.purple],
    ),
    info_tab: ABB,
  ),
  SubProjectTabWidget(
    icon: Icons.energy_savings_leaf_rounded,
    title: "Génie de l'Environnement",
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [Colors.green, Colors.greenAccent],
    ),
    info_tab: GEN,
  ),
];

final List<SubProjectTabWidget> GIM = [
  SubProjectTabWidget(
    icon: Icons.settings,
    title: 'Maintenance Industrielle et Productique',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [
        Color.fromARGB(255, 252, 50, 35),
        Color.fromRGBO(255, 115, 115, 1)
      ],
    ),
    info_tab: RIN,
  ),
  SubProjectTabWidget(
    icon: Icons.construction_rounded,
    title: 'Génie Mécanique et Productique',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [
        Colors.orange,
        Color.fromARGB(255, 255, 185, 94),
      ],
    ),
    info_tab: GMP,
  ),
  SubProjectTabWidget(
    icon: Icons.electrical_services_rounded,
    title: 'Génie Electrique',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [Colors.green, Colors.greenAccent],
    ),
    info_tab: GEL,
  ),
  SubProjectTabWidget(
    icon: Icons.thermostat_auto_rounded,
    title: 'Génie Thermique',
    description: 'Discover all our the projects.',
    gradient: LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomStart,
      colors: [
        Color.fromARGB(255, 0, 68, 255),
        Colors.blueAccent,
      ],
    ),
    info_tab: GTE,
  ),
];

// Projects infos

final GLO = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Mobile Development",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet_1.png",
        color: kPrimaryColor,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet_2.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Mobile Development',
        title_2: "My Perf Online",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet_1.png",
        color: Colors.redAccent,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: '.NET Development',
        title_2: "Code Blocks",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet_2.png",
        color: Colors.greenAccent,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 5,
        title_1: "Desktop Development",
        title_2: "Polynomials",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet_2.png",
        color: Colors.orangeAccent,
        images: listImages),
  ),
];

final RT = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Telecommunication",
        title_2: "VLAN de Gestion des QOS",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
];

final RIN = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Computer Network",
        title_2: "Reseau VPN et Systeme Active Directory",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Colors.greenAccent,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Computer Network",
        title_2: "Active Directory sous Windows",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Colors.blueAccent,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Telecommunication',
        title_2: "Proxy SQUID et Auth LDAP",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: kPrimaryColor,
        images: listImages),
  ),
];

final ABB = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Health",
        title_2: "White blood cells and Platelets",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Colors.orange,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Health",
        title_2: "White blood cells and Platelets",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: "Health",
        title_2: "White blood cells and Platelets",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: kPrimaryColor,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: "Health",
        title_2: "White blood cells and Platelets",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Colors.green,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 5,
        title_1: "Health",
        title_2: "White blood cells and Platelets",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Colors.redAccent,
        images: listImages),
  ),
];

final IAB = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Mobile Development",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 148, 5, 129),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Mobile Development',
        title_2: "My Perf Online",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 89, 145, 0),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: '.NET Development',
        title_2: "Code Blocks",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 67, 0, 105),
        images: listImages),
  ),
];

final GEN = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Mobile Development",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: kPrimaryColor,
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
];

final GMP = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Mobile Development",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 61, 72, 174),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 104, 0, 0),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Mobile Development',
        title_2: "My Perf Online",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 28, 43, 53),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: '.NET Development',
        title_2: "Code Blocks",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 0, 184, 129),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 5,
        title_1: "Desktop Development",
        title_2: "Polynomials",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color.fromARGB(255, 41, 10, 38),
        images: listImages),
  ),
];

final GEL = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Mobile Development",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Mobile Development',
        title_2: "My Perf Online",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: '.NET Development',
        title_2: "Code Blocks",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 5,
        title_1: "Desktop Development",
        title_2: "Polynomials",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
];

final GTE = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Mobile Development",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Mobile Development',
        title_2: "My Perf Online",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: '.NET Development',
        title_2: "Code Blocks",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 5,
        title_1: "Desktop Development",
        title_2: "Polynomials",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
];

final GCD = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Mobile Development",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Mobile Development',
        title_2: "My Perf Online",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: '.NET Development',
        title_2: "Code Blocks",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 5,
        title_1: "Desktop Development",
        title_2: "Polynomials",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
];

final MEB = [
  Tabs(
    livret: Livret(
        id: 1,
        title_1: "Maintenance",
        title_2: "IUT Companion",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 2,
        title_1: "Web Development",
        title_2: "Coinpass Crypto Platform",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 3,
        title_1: 'Mobile Development',
        title_2: "My Perf Online",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 4,
        title_1: '.NET Development',
        title_2: "Code Blocks",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
  Tabs(
    livret: Livret(
        id: 5,
        title_1: "Desktop Development",
        title_2: "Polynomials",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/projet.png",
        color: Color(0xFF3D82AE),
        images: listImages),
  ),
];
