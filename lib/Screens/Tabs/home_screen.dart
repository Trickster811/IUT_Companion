import 'package:carousel_slider/carousel_slider.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final listImages = [
    'assets/images/admin.png',
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/letter.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/letter.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Institut Universitaire de Technologie',
            style: TextStyle(
              fontFamily: 'OpenSans_Regular',
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
                    fontFamily: 'OpenSans_Regular',
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
                    fontFamily: 'OpenSans_Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/2.png',
            fit: BoxFit.cover,
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
                    fontFamily: 'OpenSans_Regular',
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
                    fontFamily: 'OpenSans_Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/3.png',
            fit: BoxFit.cover,
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
                    fontFamily: 'OpenSans_Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/letter.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: size(30, context)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: size(10, context)),
                      height: size(150, context),
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 204, 204, 204),
                            offset: Offset(0, 3),
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 240, 240, 240),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/_1.png",
                              fit: BoxFit.cover,
                              width: 1000.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: size(5, context)),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Text(
                        "L'Institut Universitaire de Technologie en abbrégé IUT est un établissement supérieur ayant pour objectif de former des etudiants afin de leur octroyer les compétences requises pour qu'il puisse s'inserer sans encombre dans le monde professionnel et ainsi obtenir un emploi ou en créer",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
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
                      '2022 | IUT Ngaoundere',
                      style: TextStyle(
                          fontSize: taille(12, context), color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImage(String img, int index) => Padding(
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

class circleInfos extends StatelessWidget {
  const circleInfos(
      {Key? key,
      required this.title,
      required this.height,
      required this.width})
      : super(key: key);

  final title;
  final height;
  final width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
        )
      ],
    );
  }
}
