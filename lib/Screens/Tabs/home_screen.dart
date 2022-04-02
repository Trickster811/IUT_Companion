import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, top: 40, bottom: 40),
                    width: MediaQuery.of(context).size.width / 4,
                    height: 160,
                    child: Image.asset("assets/images/_3.png"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    margin: EdgeInsets.only(top: 45, bottom: 45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 235, 235, 235),
                              blurRadius: 5,
                              offset: Offset(0, 5))
                        ],
                        color: Colors.orangeAccent),
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: 170,
                    child: Text(
                      "Salut a tous, Je me nomme Sci et je serai votre guide durant tout votre parcours au sein de l'IUT",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: size(30, context)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: size(10, context)),
                              height: size(150, context),
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 204, 204, 204),
                                        offset: Offset(0, 3),
                                        blurRadius: 5)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 240, 240, 240)),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                child: Stack(
                                  children: <Widget>[
                                    Image.asset("assets/images/_1.png",
                                        fit: BoxFit.cover, width: 1000.0),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: size(5, context)),
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
                      Container(
                        margin: EdgeInsets.only(bottom: size(30, context)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: size(10, context)),
                              child: Text(
                                "Mot du directeur",
                                style: TextStyle(fontSize: taille(20, context)),
                              ),
                            ),
                            circleInfos(
                              title: "Name of the person",
                              height: size(80, context),
                              width: size(80, context),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Text(
                                "Le directeur de l'IUT vous adresse dhf sdjfh dgjk dfgjdfkjfjgfk gh,,f n,gdfkg fdg hdfg ndfkgl k fg  dfgk dfg dfkgj dfg ;fdgj fg fgk fdmgk m,gl fjdogj dgjfj gj lfj g ùdgklfg ",
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size(20, context)),
                          child: Text(
                            "Membres de l'administration",
                            style: TextStyle(fontSize: taille(20, context)),
                          )),
                      circleInfos(
                          title: "Name of the person",
                          height: size(80.0, context),
                          width: size(80.0, context)),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size(5, context)),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3.1,
                                child: circleInfos(
                                    title: "Name of the person",
                                    height: size(60.0, context),
                                    width: size(60.0, context)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.1,
                                child: circleInfos(
                                    title: "Name of the person",
                                    height: size(60.0, context),
                                    width: size(60.0, context)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.1,
                                child: circleInfos(
                                    title: "Name of the person",
                                    height: size(60.0, context),
                                    width: size(60.0, context)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size(5, context)),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3.1,
                                child: circleInfos(
                                    title: "Name of the person",
                                    height: size(60.0, context),
                                    width: size(60.0, context)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.1,
                                child: circleInfos(
                                    title: "Name of the person",
                                    height: size(60.0, context),
                                    width: size(60.0, context)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3.1,
                                child: circleInfos(
                                    title: "Name of the person",
                                    height: size(60.0, context),
                                    width: size(60.0, context)),
                              )
                            ],
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
                                  fontSize: taille(12, context),
                                  color: kPrimaryColor),
                            ),
                            Icon(
                              Icons.copyright_rounded,
                              color: kPrimaryColor,
                            ),
                            Text(
                              '2022 | IUT Ngaoundere',
                              style: TextStyle(
                                  fontSize: taille(12, context),
                                  color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
