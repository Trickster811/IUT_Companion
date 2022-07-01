import 'package:carousel_slider/carousel_slider.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final listImages = [
    'assets/images/actu7.png',
    'assets/images/actu1.png',
    'assets/images/actu4.png',
    'assets/images/actu2.png',
    'assets/images/actu3.png',
    'assets/images/actu5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/enspd.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ecole Nationale Supérieure Polytechnique de Douala',
            // softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'ArialRoundedBold',
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: size(130, context),
            height: size(5, context),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text(
                  'Actualités',
                  style: TextStyle(
                    fontFamily: 'ArialRoundedBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text(
                  'Une école de choix',
                  style: TextStyle(
                    fontFamily: 'ArialRoundedBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/enspd1.png',
            fit: BoxFit.cover,
            height: 300,
            width: double.maxFinite,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text(
                  'Des laboratoires de qualité',
                  style: TextStyle(
                    fontFamily: 'ArialRoundedBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
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
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text(
                  'Un enseignement pointu',
                  style: TextStyle(
                    fontFamily: 'ArialRoundedBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/actu4.png',
            fit: BoxFit.cover,
            height: 300,
            width: double.maxFinite,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text(
                  'Un personnel dévoué',
                  style: TextStyle(
                    fontFamily: 'ArialRoundedBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/actu1.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/images/enspd1.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "L'Ecole Nationale Supérieure Polytechnique de Douala en abbrégé ENSPD est un établissement supérieur ayant pour objectif de former des etudiants afin de leur octroyer les compétences accrues pour qu'il puisse s'inserer sans encombre dans le monde professionnel et ainsi obtenir un emploi ou en créer",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          // footer

          Container(
            padding: EdgeInsets.only(bottom: size(50, context)),
            width: double.maxFinite,
            height: size(100, context),
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
            fit: BoxFit.fill,
            height: 300,
            width: double.maxFinite,
          ),
        ),
      );
}
