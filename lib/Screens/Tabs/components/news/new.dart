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
          Row(
            children: [
              Text(
                'This week',
                style: TextStyle(
                  fontSize: taille(18, context),
                  fontFamily: 'OpenSans_Regular',
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

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...(tab).map(
                  (e) {
                    print("test");
                    return InfoCard(
                      title: 'Transport',
                    );
                  },
                )
              ],
            ),
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
                  fontFamily: 'OpenSans_Regular',
                  fontWeight: FontWeight.bold,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCarde(),
                InfoCarde(),
                InfoCarde(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
