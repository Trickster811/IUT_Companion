import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

class AboutAppScren extends StatelessWidget {
  const AboutAppScren({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo_iut.png',
                              width: size(35, context),
                            ),
                            Image.asset(
                              'assets/images/AppName_light.png',
                              width: size(130, context),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.adjust_rounded),
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
              padding: padding_h,
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
                    Center(
                      child: Text(
                        'About the app',
                        style: TextStyle(
                          fontSize: taille(18, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArialRoundedBold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "     IUT COMPANION, le companion de l'??tudiant.\n\nIUT Companion, application mobile de l'Institu Universitaire de Technologie de l'Universite de Ngaoundere a ??t?? dans l'optique de resoudre certains probl??me tels que : La g??n??ration des lettres de recommandatiions qui s'av??re ??tre une source de d??penses ?? ne pas n??gliger et La comunication des informations au sein de l'administration de l'??tablissement ce qui fait de cette application un carefour des informations importantes. N??anmoins IUT Companion est l?? aussi pour rendre l'IUT de Ngaoundere plus visible parmi les autres ??tablissement du Cameroun et premet aussi ?? d'??ventuel personnes d??sireuses d'??tre ??tudiant dans cette ??cole de pouvoir s'informer sur l'??tablissement, d'avoir toutes les infos en mati??re des fili??res pris en charge; la qualit?? de l'enseignement, des unit??s enseign??es. Sans toutefois oublier, IUT Companion est aussi un companion pour les ??tudiants de l'IUT de Ngaound??r?? car il leur permet de g??n??rer eux-m??mes leurs lettres de recommandations comme ils le souhaitent et de s'informer sur tout ce qui concerne la scolarit?? dans l'??tablissement.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: taille(14, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArialRoundedBold',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Developpers Team',
                        style: TextStyle(
                          fontSize: taille(18, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArialRoundedBold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'IUT Companion is powered by',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: taille(14, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArialRoundedBold',
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/daily_learning_logo.png',
                      width: size(50, context),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/Daily_learning_black.png',
                      width: size(130, context),
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
