import 'package:flutter/cupertino.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/components/filliere.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> debouches = [
  'Developpement Web',
  'Administration réseaux',
  'Bureautique',
  'Maintenance informatique',
];

class InfoFiliere extends StatefulWidget {
  // final listUnite;

  const InfoFiliere({
    Key? key,
    required this.fil,
    // required this.listUnite,
  }) : super(key: key);
  final Filieres fil;
  @override
  State<StatefulWidget> createState() {
    return _InfoFiliereState();
  }
}

class _InfoFiliereState extends State<InfoFiliere> {
  bool _expanded = false;
  final listImages = [
    'assets/images/admin.png',
    'assets/images/gin-01.png',
    'assets/images/gin-02.png',
    'assets/images/gbio-01.png',
    'assets/images/gbio-02.png',
    'assets/images/gbio-03.png',
    'assets/images/iut.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 247, 247, 247),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          widget.fil.intitule,
          textAlign: TextAlign.center,
          style: TextStyle(
              // color: ,
              fontSize: taille(20, context),
              fontFamily: 'OpenSans_Regular',
              fontWeight: FontWeight.w600),
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
              padding: padding_h,
              child: Text(
                widget.fil.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: taille(14.0, context),
                  fontFamily: 'ArialRoundedBold',
                ),
              ),
            ),
            CarouselSlider.builder(
              itemCount: listImages.length,
              options: CarouselOptions(
                autoPlayInterval: Duration(
                  seconds: 4,
                ),
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                height: 250,
                autoPlay: true,
              ),
              itemBuilder: (context, index, realIndex) {
                final image = listImages[index];
                return buildImage(image, index);
              },
            ),
            Padding(
              padding: padding_h,
              child: Text(
                "Notre formation visant a rendre l'etudiant compétent tout en le familiarisant avec la vie en entreprise, s'articule ainsi :",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: taille(14.0, context),
                  fontFamily: 'OpenSans_Regular',
                ),
              ),
            ),
            Padding(
                padding: padding_h,
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 500),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(
                            'Programme',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: taille(16, context),
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      },
                      body: Column(
                        children: [
                          panel(
                            title: 'Semestre 1',
                          ),
                          panel(
                            title: 'Semestre 2',
                          ),
                          panel(
                            title: 'Semestre 3',
                          ),
                          panel(
                            title: 'Semestre 4',
                          ),
                        ],
                      ),
                      backgroundColor: Color.fromARGB(255, 248, 216, 130),
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
                )),
            Padding(
              padding: padding_h,
              child: Text(
                "Vous désirez nous rejoindre ? N'hésitez plus, regardez les conditions d'entrer et rejoignez nous sans plus attendre.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: taille(14.0, context),
                  fontFamily: 'OpenSans_Regular',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: size(20, context)),
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

  Widget buildImage(
    String img,
    int index,
  ) =>
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
      );
}

class panel extends StatefulWidget {
  const panel({Key? key, required this.title}) : super(key: key);
  final title;

  @override
  State<panel> createState() => _panelState();
}

class _panelState extends State<panel> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 500),
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: taille(14.0, context),
                    fontFamily: 'OpenSans_Regular',
                    fontWeight: FontWeight.w500),
              ),
            );
          },
          body: Column(
            children: [
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  'UE 1',
                  style: TextStyle(
                    fontSize: taille(12.0, context),
                    color: Colors.black,
                    fontFamily: 'OpenSans_Regular',
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  'UE 2',
                  style: TextStyle(
                    fontSize: taille(12.0, context),
                    color: Colors.black,
                    fontFamily: 'OpenSans_Regular',
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  'UE 3',
                  style: TextStyle(
                    fontSize: taille(12.0, context),
                    color: Colors.black,
                    fontFamily: 'OpenSans_Regular',
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  'UE 4',
                  style: TextStyle(
                    fontSize: taille(12.0, context),
                    color: Colors.black,
                    fontFamily: 'OpenSans_Regular',
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 219, 219, 219),
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
