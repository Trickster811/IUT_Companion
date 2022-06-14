import 'package:iut_companion/Screens/Tabs/components/news/new_view.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/constants.dart';

class InfoCard extends StatelessWidget {
  final title;
  final image;
  const InfoCard({
    Key? key,
    required this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
        // minimumSize: Size.fromHeight(40),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewView(),
        ),
      ),
      child: Container(
        width: double.maxFinite,
        // height: size(280, context),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 216, 216, 216),
              // blurStyle: BlurStyle.solid,
              blurRadius: 5.0,
              // spreadRadius: 1.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(5, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            image,
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'OpenSans_Regular',
                fontSize: taille(14, context),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      // color: kPrimaryColor,
                      size: 20,
                      semanticLabel: 'Views',
                    ),
                    Text(
                      '275',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'OpenSans_Regular',
                        fontSize: taille(10, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse_rounded,
                      // color: kPrimaryColor,
                      size: 20,
                      semanticLabel: 'date',
                    ),
                    Text(
                      'posted at 07 pm',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'OpenSans_Regular',
                        fontSize: taille(10, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
