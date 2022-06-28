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
  const ProjectScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(230, 255, 255, 255),
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
                  tab: GIN,
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
                      Colors.blueAccent,
                    ],
                  ),
                  tab: GBIO,
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
                  tab: GIM,
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
                  tab: [],
                  index: 1,
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
                  tab: [],
                  index: 2,
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
  final icon, title, description, gradient, index;
  final List<SubProjectTabWidget>? tab;
  const TabWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    this.tab,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () => tab!.length > 0
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubProjectScreen(
                  headTitle: title,
                  tab: tab,
                ),
              ),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubProjectView(
                  headTitle: title,
                  info_tab: index == 1 ? GCD : MEB,
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
                        fontFamily: 'ArialRoundedBold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: taille(12, context),
                        fontFamily: 'ArialRoundedBold',
                      ),
                    ),
                    Spacer(),
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
    info_tab: MIP,
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

final MIP = [
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
