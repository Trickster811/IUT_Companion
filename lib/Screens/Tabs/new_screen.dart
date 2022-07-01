import 'package:carousel_slider/carousel_slider.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  int index = 1;

  final theme = [
    [
      kPrimaryColor,
      Colors.blue,
    ],
    [
      Colors.red,
      Colors.redAccent,
    ],
  ];
  final title = [
    'Actualités',
    'Decouvrez',
  ];
  final numGradient = [0, 1];

  final newsItems = [
    [
      'assets/images/enspd1.png',
      "Journées portes ouvertes de l'ENSP de Douala",
    ],
    [
      'assets/images/actu2.png',
      "Lancement des activités culturelles",
    ],
    [
      'assets/images/actu3.png',
      "Concours d'entrée en première année",
    ],
    [
      'assets/images/actu1.png',
      "Installation du personnel",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider.builder(
            itemCount: numGradient.length,
            options: CarouselOptions(
              viewportFraction: 1,
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
              final indexGradient = numGradient[index];
              return buildImage(indexGradient, index);
            },
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: padding_h,
            child: CupertinoSearchTextField(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(50),
              onChanged: (String value) {
                print('The text has changed to: $value');
              },
              onSubmitted: (String value) {
                print('Submitted text: $value');
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // News display zone __start__

          for (var items in newsItems) NewsBox(items: items),

          // News display zone __end__

          Container(
            padding: EdgeInsets.only(bottom: size(50, context)),
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
    );
  }

  Widget buildImage(
    int indexGradient,
    int index,
  ) =>
      Container(
        height: size(250, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomStart,
            colors: theme[indexGradient],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title[indexGradient],
                style: TextStyle(
                  letterSpacing: 15,
                  color: Color.fromARGB(255, 255, 255, 255),
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
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Text(
                'Daily Learning',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 10,
                  fontFamily: 'ArialRoundedBold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}

class NewsBox extends StatelessWidget {
  final items;
  const NewsBox({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          height: size(200, context),
          width: double.maxFinite,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 140,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        items[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SafeArea(
                      bottom: false,
                      top: false,
                      child: Container(
                        // height: double.maxFinite,
                        // width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomStart,
                            colors: [
                              Colors.transparent,
                              Color.fromARGB(139, 0, 0, 0),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: padding_h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                items[1],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.remove_red_eye_rounded,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '261',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: 30,
                child: Text(
                  '02/15/2022, 6:45 PM',
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
