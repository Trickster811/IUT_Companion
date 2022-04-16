import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoCarde extends StatelessWidget {
  const InfoCarde({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size(10, context),
        // horizontal: size(10, context),
      ),
      child: Container(
        width: double.maxFinite,
        height: size(100, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
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
        child: Row(
          children: [
            Container(
              width: size(150, context),
              height: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/news.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              'Sport',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'OpenSans_Regular',
                fontSize: taille(14, context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard {
  static addInfo(title) {
    for (var i = 0; i < 2; i++) {
      return newsCard(title);
      // InfoCard(title: title);
    }
  }

  static newsCard(title) {
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: size(10, context),
          horizontal: size(10, context),
        ),
        child: Container(
          width: size(230, context),
          height: size(250, context),
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
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.maxFinite,
                  height: size(150, context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/news.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'OpenSans_Regular',
                      fontSize: taille(14, context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
