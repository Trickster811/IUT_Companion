import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class PdfParagraphApi {
  static Future<File> generate(userData_1) async {
    final pdf = Document();

    final imgHead = MemoryImage(
      (await rootBundle.load('assets/images/imgHead.png')).buffer.asUint8List(),
    );
    final imgLogo = MemoryImage(
      (await rootBundle.load('assets/images/logo_iut_1.png'))
          .buffer
          .asUint8List(),
    );

    final delay = [
      ' ',
      '01 a 02 mois',
      '02 a 03 mois',
      '03 mois',
    ];

    final name_filiere = {
      ' ',
      'Informatique',
      'Electrique',
      'Maintenance',
      'Maintenance Industrielle',
      'Geni Civil',
      'Biomedical',
      'Industrie Alimentaire',
      'Analyse Biochimique et Biologique',
      'Thermique',
      'Environnement',
    };

    final type_stage = [
      ' ',
      'stage ouvrier',
      'stage académique',
      'stage académique',
    ];

    DateTime now = DateTime.now();
    final customFont = Font.ttf(
      await rootBundle.load('assets/fonts/OpenSans_Regular.ttf'),
    );

    final _month = [
      ' ',
      'Janvier',
      'Fevrier',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Aout',
      'Septembre',
      'Octobre',
      'Novembre',
      'Decmebre'
    ];

    pdf.addPage(
      Page(
          build: (context) => Column(
                children: [
                  // Header(
                  //   child: Text('My headline'),
                  // ),
                  Positioned(
                    top: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          imgLogo,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 90,
                        ),
                        Image(
                          imgHead,
                          width: 350,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Le Chef de Division',
                        style: TextStyle(
                          font: customFont,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Ngaoundere, le ${now.day} ${_month[now.month]} ${now.year}.',
                        style: TextStyle(font: customFont, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'N/Ref.:________________/DSFPRMP/SSRMP/${now.year}',
                        style: TextStyle(font: customFont, fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(top: 0.5 * PdfPageFormat.cm, right: 50),
                    child: Column(
                      children: [
                        userData_1[8] == 'Directeur'
                            ? Column(children: [
                                Text(
                                  "A",
                                  style:
                                      TextStyle(font: customFont, fontSize: 12),
                                ),
                                Text(
                                  "Monsieur le ${userData_1[8]} General",
                                  style:
                                      TextStyle(font: customFont, fontSize: 12),
                                ),
                              ])
                            : userData_1[8] == 'Directrice'
                                ? Column(children: [
                                    Text(
                                      "A",
                                      style: TextStyle(
                                          font: customFont, fontSize: 12),
                                    ),
                                    Text(
                                      "Madame la ${userData_1[8]} Generale",
                                      style: TextStyle(
                                          font: customFont, fontSize: 12),
                                    ),
                                  ])
                                : Column(children: [
                                    Text(
                                      "Au",
                                      style: TextStyle(
                                          font: customFont, fontSize: 12),
                                    ),
                                    Text(
                                      "${userData_1[8]}",
                                      style: TextStyle(
                                          font: customFont, fontSize: 12),
                                    ),
                                  ]),
                        Text(
                          " de ${userData_1[6]}",
                          style: TextStyle(font: customFont, fontSize: 12),
                        ),
                        Text(
                          "${userData_1[7]}.",
                          style: TextStyle(
                            font: customFont,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Objet: ',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Text(
                        "Recommandation de la demande de stage de ",
                        style: TextStyle(font: customFont, fontSize: 12),
                      ),
                    ],
                    // textAlign: TextAlign.justify,
                  ),
                  Row(children: [
                    Text(
                      "               l'étudiant(e) ${userData_1[0]} ${userData_1[1]}",
                      style: TextStyle(font: customFont, fontSize: 12),
                    ),
                  ]),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      userData_1[7] == 'Directeur'
                          ? Text(
                              "             Monsieur le ${userData_1[8]} General,",
                              style: TextStyle(font: customFont, fontSize: 12),
                            )
                          : userData_1[8] == 'Directrice'
                              ? Text(
                                  "             Madame la ${userData_1[8]} Generale,",
                                  style:
                                      TextStyle(font: customFont, fontSize: 12),
                                )
                              : Text('            Monsieur,')
                    ],
                    // textAlign: TextAlign.justify,
                  ),
                  userData_1[2] == 'Female'
                      ? Column(
                          children: [
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "             Nous avons l'honneur de vous soumettre avec avis favorable, la demande de ${type_stage[int.parse(userData_1[5])]} de madame ${userData_1[0]} ${userData_1[1]} étudiante inscrite au niveau ${userData_1[5]} de la mention ${userData_1[3]} de l'IUT de N’Gaoundéré.",
                            ),
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "             En effet, ${type_stage[int.parse(userData_1[5])]} sollicite par cette étudiante a une durée de ${delay[int.parse(userData_1[5])]} dans la période allant du 04 avril 2022 au 28 juin 2022 selon le calendrier académique de l'IUT de N’Gaoundéré. Ce séjour en milieu industriel lui permettra non seulement de répondre a une de vos préoccupation en ${userData_1[3]}, mais aussi de compléter la solide formation qu’elle a reçue dans les différents enseignements en ${userData_1[4]}.",
                            ),
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "              Ce faisant, votre entreprise renforcera davantage l'excellente collaboration avec l'IUT construite au fil des années et participera à son imprégnation dans les milieux professionnels.",
                            ),
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "           Compte tenu de ce qui précède et des performances de l'étudiante au cours de son cursus, nous recommandons sans réserve que sa demande de stage soit agrée.",
                            ),
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "             En vous souhaitant bonne réception, nous restons à votre entière disposition pour plus d'ample renseignement que vous jugerez utile. Veuillez agréer, Monsieur ${userData_1[8]} l'expression de notre parfaite considération.",
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "             Nous avons l'honneur de vous soumettre avec avis favorable, la demande de ${type_stage[int.parse(userData_1[5])]} de monsieur ${userData_1[0]} ${userData_1[1]} étudiant inscrit au niveau ${userData_1[5]} de la mention ${userData_1[3]} de l'IUT de N’Gaoundéré.",
                            ),
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "             En effet, ${type_stage[int.parse(userData_1[5])]} sollicite par cet étudiant a une durée de ${delay[int.parse(userData_1[5])]} dans la période allant du 04 avril 2022 au 28 juin 2022 selon le calendrier académique de l'IUT de N’Gaoundéré. Ce séjour en milieu industriel lui permettra non seulement de répondre a une de vos préoccupation en ${userData_1[3]}, mais aussi de compléter la solide formation qu’il a reçu dans les différents enseignements du ${userData_1[4]}.",
                            ),
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "              Ce faisant, votre entreprise renforcera davantage l'excellente collaboration avec l'IUT construite au fil des années et participera à son imprégnation dans les milieux professionnels.",
                            ),
                            Paragraph(
                               textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "           Compte tenu de ce qui précède et des performances de l'étudiant au cours de son cursus, nous recommandons sans réserve que sa demande de stage soit agrée.",
                            ),
                            Paragraph(
                              textAlign: TextAlign.justify,
                              style: TextStyle(font: customFont, fontSize: 12),
                              text:
                                  "             En vous souhaitant bonne réception, nous restons à votre entière disposition pour plus d'ample renseignement que vous jugerez utile. Veuillez agréer, Monsieur ${userData_1[8]} l'expression de notre parfaite considération.",
                            ),
                          ],
                        ),

                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(top: 0.5 * PdfPageFormat.cm),
                    child: Text(
                      "LE CHEF DE DIVISION",
                      style: TextStyle(font: customFont, fontSize: 12),
                    ),

                    // textAlign: TextAlign.justify,
                  ),
                ],
              )),
    );
    return saveDocument(
        name:
            'Lettre_de_Recommandation_${userData_1[9]}_${userData_1[3]}_${userData_1[4]}_niveau_${userData_1[5]}.pdf',
        pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    //final file = File('$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
