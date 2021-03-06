import 'package:flutter/rendering.dart';
import 'package:iut_companion/Screens/Tabs/components/news/constructor.dart';
import 'package:iut_companion/Screens/Tabs/components/news/sport.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> tab = [1, 2, 3];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            color: Colors.white,
            height: double.maxFinite,
            width: 100,
            child: Column(
              children: [
                Stack(children: [],),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Color(0xFF535353)),
                      children: [
                        TextSpan(
                          text: "12/27/2021, 6:00 PM",
                          style: TextStyle(
                            fontSize: taille(14, context),
                            fontFamily: 'ArialRoundedBold',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Text(
                'This week',
                style: TextStyle(
                  fontSize: taille(18, context),
                  fontFamily: 'ArialRoundedBold',
                  fontWeight: FontWeight.bold,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          // ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) {
          //     return InfoCard(
          //       title: 'Transport',
          //     );
          //   },
          //   itemCount: 4,
          // ),

          ...(tab).map(
            (e) {
              print("test");
              return InfoCard(
                image: Image.asset(
                  'assets/images/actu6.png',
                  fit: BoxFit.cover,
                ),
                title:
                    "Le Directeur de l'Institut Universitaire de Technologie informe que la rentr??e est pr??vue pour le 04 septembre prochain",
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Last week',
                style: TextStyle(
                  fontSize: taille(18, context),
                  fontFamily: 'ArialRoundedBold',
                  fontWeight: FontWeight.bold,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          InfoCard(
            image: Image.asset(
              'assets/images/actu1.png',
              fit: BoxFit.cover,
            ),
            title:
                "Le Directeur de l'Institut Universitaire de Technologie informe que la rentr??e est pr??vue pour le 04 septembre prochain",
          ),
          SizedBox(
            height: 30,
          ),
          InfoCard(
            image: Image.asset(
              'assets/images/actu2.png',
              fit: BoxFit.cover,
            ),
            title:
                "Le Directeur de l'Institut Universitaire de Technologie informe que la rentr??e est pr??vue pour le 04 septembre prochain",
          ),
          SizedBox(
            height: 30,
          ),
          InfoCard(
            image: Image.asset(
              'assets/images/actu3.png',
              fit: BoxFit.cover,
            ),
            title:
                "Le Directeur de l'Institut Universitaire de Technologie informe que la rentr??e est pr??vue pour le 04 septembre prochain",
          ),
          InfoCard(
            image: Image.asset(
              'assets/images/actu4.png',
              fit: BoxFit.cover,
            ),
            title:
                "Le Directeur de l'Institut Universitaire de Technologie informe que la rentr??e est pr??vue pour le 04 septembre prochain",
          ),
          InfoCard(
            image: Image.asset(
              'assets/images/actu5.png',
              fit: BoxFit.cover,
            ),
            title:
                "Le Directeur de l'Institut Universitaire de Technologie informe que la rentr??e est pr??vue pour le 04 septembre prochain",
          )
        ],
      ),
    );
  }
}
