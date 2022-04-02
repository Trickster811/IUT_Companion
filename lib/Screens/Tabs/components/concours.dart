import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class ConcoursPage extends StatelessWidget {
  const ConcoursPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size(30, context),
          ),
          cardConcours(title: "DUT"),
          SizedBox(
            height: size(30, context),
          ),
          cardConcours(title: "BTS"),
          SizedBox(
            height: size(30, context),
          ),
          cardConcours(title: "LyTech"),
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
      ),
    );
  }
}

class cardConcours extends StatelessWidget {
  const cardConcours({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: size(20, context)),
          child: Text(
            this.title,
            style: TextStyle(
              fontSize: taille(23, context),
              fontFamily: 'OpenSans_Regular',
            ),
          ),
        ),
        Card(
          color: Color.fromRGBO(249, 249, 249, 30),
          elevation: 10.0,
          margin: EdgeInsets.only(
              left: size(20, context),
              right: size(20, context),
              top: size(20, context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text(
                  'Concours',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans_Regular',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: size(40, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("- Conditions d'eligibilité"),
                    Text("- Frais de paiement"),
                    Text("- Dates"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => showInfoConcours()),
                        // );
                      }),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
