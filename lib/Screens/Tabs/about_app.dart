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
                          fontFamily: 'OpenSans_Regular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "     IUT COMPANION, le companion de l'étudiant.\n\nIUT Companion, application mobile de l'Institu Universitaire de Technologie de l'Universite de Ngaoundere a été dans l'optique de resoudre certains problème tels que : La génération des lettres de recommandatiions qui s'avère être une source de dépenses à ne pas négliger et La comunication des informations au sein de l'administration de l'établissement ce qui fait de cette application un carefour des informations importantes. Néanmoins IUT Companion est là aussi pour rendre l'IUT de Ngaoundere plus visible parmi les autres établissement du Cameroun et premet aussi à d'éventuel personnes désireuses d'être étudiant dans cette école de pouvoir s'informer sur l'établissement, d'avoir toutes les infos en matière des filières pris en charge; la qualité de l'enseignement, des unités enseignées. Sans toutefois oublier, IUT Companion est aussi un companion pour les étudiants de l'IUT de Ngaoundéré car il leur permet de générer eux-mêmes leurs lettres de recommandations comme ils le souhaitent et de s'informer sur tout ce qui concerne la scolarité dans l'établissement.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: taille(14, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans_Regular',
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Developpers Team',
                        style: TextStyle(
                          fontSize: taille(18, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans_Regular',
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
                          fontFamily: 'OpenSans_Regular',
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
