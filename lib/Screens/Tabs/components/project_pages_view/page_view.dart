import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/components/generer.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/sub_projects_screen.dart';
import 'package:iut_companion/Screens/Tabs/components/project_pages_view/sub_projects_view.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

class ProjectView extends StatelessWidget {
  final Livret livret;
  const ProjectView({Key? key, required this.livret}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: livret.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              final pdfFile = await PdfParagraphApi.generateLivret(
                  livret.title_1, livret.title_2);
              PdfParagraphApi.openFile(pdfFile);
            },
            icon: Icon(
              Icons.file_download_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20.0,
                    right: 20.0,
                  ),
                  // height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0 / 2),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Color(0xFF535353)),
                                children: [
                                  TextSpan(text: "Author\n"),
                                  TextSpan(
                                    text: "Joachim Nedaouka",
                                    style: TextStyle(
                                      fontSize: taille(14, context),
                                      fontFamily: 'OpenSans_Regular',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Color(0xFF535353)),
                                children: [
                                  TextSpan(text: "Date\n"),
                                  TextSpan(
                                    text: "Juin 25, 2022.",
                                    style: TextStyle(
                                      fontSize: taille(14, context),
                                      fontFamily: 'OpenSans_Regular',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      CarouselSlider.builder(
                        itemCount: livret.images.length,
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
                          final image = livret.images[index];
                          return buildImage(image, index);
                        },
                      ),
                      SizedBox(height: 20.0 / 2),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          livret.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      SizedBox(height: 20.0 / 2),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 20.0),
                              height: 50,
                              width: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: livret.color,
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.file_download_outlined,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  final pdfFile =
                                      await PdfParagraphApi.generateLivret(
                                          livret.title_1, livret.title_2);
                                  PdfParagraphApi.openFile(pdfFile);
                                },
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextButton(
                                  onPressed: () async {
                                    final pdfFile =
                                        await PdfParagraphApi.generateLivret(
                                            livret.title_1, livret.title_2);
                                    PdfParagraphApi.openFile(pdfFile);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: livret.color,
                                  ),
                                  child: Text(
                                    "Get Documentation".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: taille(17, context),
                                      fontFamily: 'OpenSans_Regular',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        livret.title_1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: taille(20, context),
                          fontFamily: 'OpenSans_Regular',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        livret.title_2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: taille(15, context),
                          fontFamily: 'OpenSans_Regular',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Powered by\n",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: taille(8, context),
                                    fontFamily: 'OpenSans_Regular',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "Daily Learning",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: taille(12, context),
                                    fontFamily: 'OpenSans_Regular',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            child: Container(
                              width: 10,
                              height: 200,
                              child: Hero(
                                tag: "${livret.id}",
                                child: Image.asset(
                                  livret.image,
                                  // width: 20,
                                  // height: 200,
                                  // fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
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
            fit: BoxFit.cover,
          ),
        ),
      );
}
