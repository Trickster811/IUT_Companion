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
                        //   ),),
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
                              'assets/images/AppName_light.png',
                              width: size(130, context),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        ),
                        icon: Icon(Icons.notifications),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(
                            widget.fil.intitule,
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
                    CarouselSlider.builder(
                      itemCount: listImages.length,
                      options: CarouselOptions(
                        autoPlayInterval: Duration(
                          seconds: 4,
                        ),
                        // viewportFraction: 1,
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
                      padding: EdgeInsets.all(size(20, context)),
                      child: Text(
                        widget.fil.description,
                        style: TextStyle(
                          fontSize: taille(12.0, context),
                          fontFamily: 'OpenSans_Regular',
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       left: 20, right: 20, top: 3, bottom: 10),
                    //   child: Text(
                    //       "Elle offre de nombreux débouchées parmis lesquels :",
                    //       style: TextStyle(fontSize: 20.0)),
                    // ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: listDeb,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: size(20, context),
                        right: size(20, context),
                        top: size(3, context),
                        bottom: size(20, context),
                      ),
                      child: Text(
                        "Notre formation visant a rendre l'etudiant compétent tout en le familiarisant avec la vie en entreprise, s'articule ainsi :",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: taille(12.0, context),
                          fontFamily: 'OpenSans_Regular',
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: size(15, context), right: size(15, context)),
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
                              backgroundColor:
                                  Color.fromARGB(255, 248, 216, 130),
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
                      padding: EdgeInsets.only(
                        right: size(20, context),
                        left: size(20, context),
                        top: size(20, context),
                        bottom: size(20, context),
                      ),
                      child: Text(
                        "Vous désirez nous rejoindre ? N'hésitez plus, regardez les conditions d'entrer et rejoignez nous sans plus attendre.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: taille(12.0, context),
                          fontFamily: 'OpenSans_Regular',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size(30, context),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(
    String img,
    int index,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
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
