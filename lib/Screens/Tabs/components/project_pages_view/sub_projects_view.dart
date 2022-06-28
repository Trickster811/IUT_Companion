import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Tabs/components/generer.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/page_view.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/sub_projects_screen.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/notifications_center.dart';
import 'package:iut_companion/Screens/Tabs/side_bar_menu.dart';
import 'package:iut_companion/constants.dart';

class SubProjectView extends StatelessWidget {
  final String headTitle;
  final info_tab;
  const SubProjectView({
    Key? key,
    required this.headTitle,
    required this.info_tab,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 247, 247, 247),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: CupertinoSearchTextField(
          // decoration: BoxDecoration(),
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          borderRadius: BorderRadius.circular(30),
          onChanged: (String value) {
            print('The text has changed to: $value');
          },
          onSubmitted: (String value) {
            print('Submitted text: $value');
          },
        ),
      ),
      // drawer: SideBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size(100, context),
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          headTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'OpenSans_Regular',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: size(2.5, context),
                          width: size(150, context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Daily Learning',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'OpenSans_Regular',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var items in info_tab!) items,
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: size(25, context)),
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
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  final Livret livret;
  const Tabs({
    Key? key,
    required this.livret,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 2,
            colors: [
              livret.color,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
            child: Container(
              height: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        livret.title_1,
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'OpenSans_Regular',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        livret.title_2,
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'OpenSans_Regular',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Text(
                        "Application Companion\nde l'etudiant de l'Institut\nUniversitaire de Technologie\nde Ngaoundere",
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'OpenSans_Regular',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Hero(
                      tag: '${livret.id}',
                      child: Image.asset(
                        livret.image,
                        // width: 175,
                        // height: 240,
                        // fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  height: 40,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: livret.color,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.file_download_outlined,
                      size: 25,
                    ),
                    onPressed: () async {
                      final pdfFile = await PdfParagraphApi.generateLivret(livret.title_1, livret.title_2);
                      PdfParagraphApi.openFile(pdfFile);
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectView(livret: livret),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: livret.color,
                    ),
                    child: Text(
                      "More",
                      style: TextStyle(
                        fontSize: taille(17, context),
                        fontFamily: 'OpenSans_Regular',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

final List listImages = [
  'assets/images/actu1.png',
  'assets/images/gin-01.png',
  'assets/images/gin-02.png',
  'assets/images/gbio-01.png',
  'assets/images/gbio-02.png',
  'assets/images/gbio-03.png',
  'assets/images/iut.png',
];

class Livret {
  final image, title_1, title_2, description, price, size, id, color, images;
  Livret({
    this.images,
    this.id,
    this.image,
    this.title_1,
    this.title_2,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

String dummyText =
    "IUT COMPANION, le companion de l'étudiant.\n\nIUT Companion, application mobile de l'Institu Universitaire de Technologie de l'Universite de Ngaoundere a été dans l'optique de resoudre certains problème tels que : La génération des lettres de recommandatiions qui s'avère être une source de dépenses à ne pas négliger et La comunication des informations au sein de l'administration de l'établissement ce qui fait de cette application un carefour des informations importantes.";
