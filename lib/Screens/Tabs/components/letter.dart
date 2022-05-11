import 'package:iut_companion/Screens/Tabs/components/generer.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:open_file/open_file.dart';

class Letter extends StatelessWidget {
  final int index;
  const Letter({
    Key? key,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_rounded),
                        iconSize: 30,
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                        // onPressed: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ToolScreen(),
                        //   ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/logo_iut.png',
                              width: size(35, context),
                            ),
                            Image.asset(
                              'assets/images/AppName_light.png',
                              width: size(130, context),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.account_circle_sharp),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
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
              child: index == 1 ? Forms1() : Forms2(),
            ),
          ),
        ],
      ),
    );
  }
}

class Forms1 extends StatefulWidget {
  @override
  State<Forms1> createState() => _Forms1State();
}

class _Forms1State extends State<Forms1> {
  letter(List idmat) async {
    // QuerySnapshot querySnapshot;
    List docs = [];
    try {
      // querySnapshot = await FirebaseFirestore.instance
      //     .collection('Student')
      //     .where('matricule', isEqualTo: idmat[3])
      //     .get();

      print(idmat);
      FirebaseFirestore.instance
          .collection('Student')
          .doc(idmat[0])
          .get()
          .then((DocumentSnapshot doc) {
        print(doc.data());
        if (doc.exists) {
          docs.add(doc['nom']);
          docs.add(doc['prenom']);
          docs.add(doc['sex']);
          docs.add(doc['mention']);
          docs.add(doc['parcours']);
          docs.add(doc['level']);
          idmat.remove(my_con_1);
          for (var i in idmat) {
            docs.add(i);
          }
          docs.add(doc['matricule']);
          print(docs);

          _openMyLetter(docs);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Expanded(
                child: AlertDialog(
                  title: Text('Oups!!'),
                  content: Text(
                    'Student with this id not exists',
                  ),
                ),
              );
            },
          );
        }
        // if (querySnapshot.docs.isNotEmpty) {
        //   for (var doc in querySnapshot.docs.toList()) {
        //     List a = [
        //       doc['name'],
        //       doc['prenom'],
        //       doc['sex'],
        //       doc['mention'],
        //       doc['parcours'],
        //       doc['level'],
        //     ];
        //     // idmat.remove(my_con_1.text);
        //     // print('yoyo');
        //     for (var i in idmat) {
        //       a.add(i);
        //     }
        //     print(a);
        //     // docs = a;
        //     // print(docs);
        //     // return a;
        //     // print(docs);
        //     final pdfFile = await PdfParagraphApi.generate(a);
        //     PdfParagraphApi.openFile(pdfFile);
        //   }
        // }
      });
    } catch (e) {
      print(e);
    }
  }

  _openMyLetter(List docs) async {
    final pdfFile = await PdfParagraphApi.generate(docs);
    PdfParagraphApi.openFile(pdfFile);
  }

  // Variables to get user entries
  final my_con_1 = TextEditingController();
  final my_con_3 = TextEditingController();

  int id = 1;

  // Form key
  final _dropdownFormKey = GlobalKey<FormState>();

  // Initial Selected Value
  String? dropdownvalue_4;

  String? dropdownvalue_5;

  // String _radioValue = 'Male';
  List<DropdownMenuItem<String>> get items_vil {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'MAROUA'),
        value: 'MAROUA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'GAROUA'),
        value: 'GAROUA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'NGAOUNDERE'),
        value: 'NGAOUNDERE',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'YAOUNDE'),
        value: 'YAOUNDE',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BERTOUA'),
        value: 'BERTOUA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'EBOLOWA'),
        value: 'EBOLOWA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'DOUALA'),
        value: 'DOUALA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BAFOUSSAM'),
        value: 'BAFOUSSAM',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BAMENDA'),
        value: 'BAMENDA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BUEA'),
        value: 'BUEA',
      ),
    ];
    return items;
  }

  // List of items in our dropdown menu for levels
  List<DropdownMenuItem<String>> get items_dr {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'Directeur'),
        value: 'Directeur',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Directrice'),
        value: 'Directrice',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Commandant'),
        value: 'Commandant',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Autre'),
        value: 'X',
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: size(-100, context),
          bottom: 0,
          child: Image.asset(
            'assets/images/logo_iut.png',
            color: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.2),
            colorBlendMode: BlendMode.modulate,
            width: size(250, context),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header

                Center(
                  child: Text(
                    'Please fill this Form',
                    style: TextStyle(
                      fontSize: taille(16, context),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans_Regular',
                    ),
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size(40, context),
                        ),
                      ),
                      Container(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Form(
                              key: _dropdownFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Personal Informations Section

                                  Center(
                                    child: Text(
                                      'Personal Informations : ',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        // decoration: TextDecoration.combine(TextDecoration.overline, TextDecoration.underline,),
                                        fontSize: taille(14, context),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans_Regular',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Matricule : '),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'entrer votre matricule',
                                      ),
                                      controller: my_con_1,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner votre matricule')),
                                  SizedBox(
                                    height: size(12, context),
                                  ),

                                  // Company Informations Section

                                  Center(
                                    child: Text(
                                      'Informations Entreprise : ',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        // decoration: TextDecoration.combine(TextDecoration.overline, TextDecoration.underline,),
                                        fontSize: taille(14, context),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans_Regular',
                                        // fontFamily: 'OpenSans_Regular',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Nom : '),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'entrer nom entreprise',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: my_con_3,
                                      validator: RequiredValidator(
                                          errorText:
                                              "Veuillez renseigner le nom de l'entrprise")),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Ville : '),
                                  DropdownButtonFormField(
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 0.5,
                                    ),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person),
                                      hintText: 'choose',
                                    ),
                                    value: dropdownvalue_4,
                                    validator: (value) => value == null
                                        ? 'Veuillez choisir un dirgeant'
                                        : null,
                                    items: items_vil,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_4 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Dirigeant : '),
                                  DropdownButtonFormField(
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 0.5,
                                    ),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person),
                                      hintText: 'choose',
                                    ),
                                    value: dropdownvalue_5,
                                    validator: (value) => value == null
                                        ? 'Veuillez choisir une dirigeant'
                                        : null,
                                    items: items_dr,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_5 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(30, context),
                                  ),

                                  // Submit Button

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_dropdownFormKey.currentState!
                                            .validate()) {
                                          final data = [
                                            my_con_1.text,
                                            my_con_3.text,
                                            dropdownvalue_4,
                                            dropdownvalue_5,
                                            // my_con_1.text,
                                          ];

                                          letter(data);
                                        }
                                      },
                                      child: Text(
                                        'Generate',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'OpenSans_Regular',
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                        // elevation: 0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //  Footer

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
        ),
      ],
    );
  }
}

class Forms2 extends StatefulWidget {
  @override
  State<Forms2> createState() => _Forms2State();
}

class _Forms2State extends State<Forms2> {
  // Variables to get user entries
  final my_con_0 = TextEditingController();
  final my_con_1 = TextEditingController();
  final my_con_2 = TextEditingController();
  final my_con_3 = TextEditingController();

  int id = 1;

  // Form key
  final _dropdownFormKey = GlobalKey<FormState>();

  // Initial Selected Value
  String? dropdownvalue_1;
  String? dropdownvalue_2;
  String? dropdownvalue_3;
  String? dropdownvalue_4;
  String? dropdownvalue_5;
  String _radioValue = 'Male';

  // List of items in our dropdown menu for levels
  List<DropdownMenuItem<String>> get items_lv {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, '1'),
        value: '1',
      ),
      DropdownMenuItem(
        child: textStyle(context, '2'),
        value: '2',
      ),
      DropdownMenuItem(
        child: textStyle(context, '3'),
        value: '3',
      ),
    ];
    return items;
  }

  // List of items in our dropdown menu for mention
  List<DropdownMenuItem<String>> get items_mn {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'Genie Informatique'),
        value: 'Genie Informatique (GIN)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Genie Biologique'),
        value: 'Genie Biologique (GBIO)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Genie Industriel et Maintenance'),
        value: 'Genie Industriel et Maintenance (GIM)',
      ),
    ];
    return items;
  }

  // List of items in our dropdown menu for cursus
  List<DropdownMenuItem<String>> get items_pr {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'Genie Informatique'),
        value: 'Genie Informatique (GIN)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Reseautique Internet'),
        value: 'Reseautique Internet (RIN)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Genie Logiciel'),
        value: 'Genie Logiciel (GLO)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Analyse Biologique et Biochimique'),
        value: 'Analyse Biologique et Biochimique (ABB)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Industrie Alimentaire et BioTechnologique'),
        value: 'Industrie Alimentaire et BioTechnologique (IAB)',
      ),
      DropdownMenuItem(
        child: textStyle(context, "Genie de l'Environnement"),
        value: "Genie de l'Environnement (GEN)",
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Maintenqce Industrielle et Productique'),
        value: 'Maintenqce Industrielle et Productique (MIP)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Genie Electrique'),
        value: 'Genie Electrique (GEL)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Genie Thermique'),
        value: 'Genie Thermique (GTE)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Genie Civil et construction Durable'),
        value: 'Genie Civil et construction Durable (GCD)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Genie Mecanique et Productique'),
        value: 'Genie Mecanique et Productique (GMP)',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Maintenance des Equipements Biomediacaux'),
        value: 'Maintenance des Equipements Biomediacaux (MEB)',
      ),
    ];
    return items;
  }

  // List of items in our dropdown menu for cursus
  List<DropdownMenuItem<String>> get items_vil {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'MAROUA'),
        value: 'MAROUA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'GAROUA'),
        value: 'GAROUA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'NGAOUNDERE'),
        value: 'NGAOUNDERE',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'YAOUNDE'),
        value: 'YAOUNDE',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BERTOUA'),
        value: 'BERTOUA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'EBOLOWA'),
        value: 'EBOLOWA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'DOUALA'),
        value: 'DOUALA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BAFOUSSAM'),
        value: 'BAFOUSSAM',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BAMENDA'),
        value: 'BAMENDA',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'BUEA'),
        value: 'BUEA',
      ),
    ];
    return items;
  }

  // List of items in our dropdown menu for levels
  List<DropdownMenuItem<String>> get items_dr {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'Directeur'),
        value: 'Directeur',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Directrice'),
        value: 'Directrice',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Commandant'),
        value: 'Commandant',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Autre'),
        value: 'X',
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: size(-100, context),
          bottom: 0,
          child: Image.asset(
            'assets/images/logo_iut.png',
            color: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.2),
            colorBlendMode: BlendMode.modulate,
            width: size(250, context),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header

                Center(
                  child: Text(
                    'Please fill this Form',
                    style: TextStyle(
                      fontSize: taille(16, context),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans_Regular',
                    ),
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: size(40, context),
                        ),
                      ),
                      Container(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Form(
                              key: _dropdownFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Personal Informations Section

                                  Center(
                                    child: Text(
                                      'Personal Informations : ',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        // decoration: TextDecoration.combine(TextDecoration.overline, TextDecoration.underline,),
                                        fontSize: taille(14, context),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans_Regular',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Matricule : '),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'entrer votre matricule',
                                      ),
                                      controller: my_con_0,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner votre matricule')),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Nom : '),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'entrer votre nom',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: my_con_1,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner votre nom')),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Prenom : '),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'entrer votre prenom',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: my_con_2,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner votre prenom')),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  Row(children: [
                                    textStyle(context, 'Sexe : '),
                                    // Radio 1
                                    Radio(
                                      value: 1,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          _radioValue = 'Male';
                                          id = 1;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Male',
                                      style: new TextStyle(fontSize: 17.0),
                                    ),
                                    // Radio 2
                                    Radio(
                                      value: 2,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          _radioValue = 'Female';
                                          id = 2;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Female',
                                      style: new TextStyle(fontSize: 17.0),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Mention : '),
                                  DropdownButtonFormField(
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 0.5,
                                    ),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person),
                                      hintText: 'choose',
                                    ),
                                    value: dropdownvalue_1,
                                    validator: (value) => value == null
                                        ? 'Veuillez choisir une mention'
                                        : null,
                                    items: items_mn,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_1 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Pacours : '),
                                  DropdownButtonFormField(
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 0.5,
                                    ),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person),
                                      hintText: 'choose',
                                    ),
                                    value: dropdownvalue_2,
                                    validator: (value) => value == null
                                        ? 'Veuillez choisir un niveau'
                                        : null,
                                    items: items_pr,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_2 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Level : '),
                                  DropdownButtonFormField(
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 0.5,
                                    ),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person),
                                      hintText: 'choose',
                                    ),
                                    value: dropdownvalue_3,
                                    validator: (value) => value == null
                                        ? 'Veuillez choisir un niveau'
                                        : null,
                                    items: items_lv,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_3 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(50, context),
                                  ),

                                  // Company Informations Section

                                  Center(
                                    child: Text(
                                      'Informations Entreprise : ',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        // decoration: TextDecoration.combine(TextDecoration.overline, TextDecoration.underline,),
                                        fontSize: taille(14, context),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans_Regular',
                                        // fontFamily: 'OpenSans_Regular',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Nom : '),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'entrer nom entreprise',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: my_con_3,
                                      validator: RequiredValidator(
                                          errorText:
                                              "Veuillez renseigner le nom de l'entrprise")),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Ville : '),
                                  DropdownButtonFormField(
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 0.5,
                                    ),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person),
                                      hintText: 'choose',
                                    ),
                                    value: dropdownvalue_4,
                                    validator: (value) => value == null
                                        ? 'Veuillez choisir un dirgeant'
                                        : null,
                                    items: items_vil,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_4 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Dirigeant : '),
                                  DropdownButtonFormField(
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 0.5,
                                    ),
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.person),
                                      hintText: 'choose',
                                    ),
                                    value: dropdownvalue_5,
                                    validator: (value) => value == null
                                        ? 'Veuillez choisir une dirigeant'
                                        : null,
                                    items: items_dr,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_5 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(30, context),
                                  ),

                                  // Submit Button

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_dropdownFormKey.currentState!
                                            .validate()) {
                                          final userInputs = [
                                            my_con_1.text,
                                            my_con_2.text,
                                            _radioValue,
                                            dropdownvalue_1,
                                            dropdownvalue_2,
                                            dropdownvalue_3,
                                            my_con_3.text,
                                            dropdownvalue_4,
                                            dropdownvalue_5,
                                            my_con_0.text,
                                          ];

                                          final pdfFile =
                                              await PdfParagraphApi.generate(
                                                  userInputs);
                                          PdfParagraphApi.openFile(pdfFile);
                                        }
                                      },
                                      child: Text(
                                        'Generate',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'OpenSans_Regular',
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                        // elevation: 0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //  Footer

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
        ),
      ],
    );
  }
}

// final snackBar = SnackBar(
//             content: const Text('Hi, I am a SnackBar!'),
//             backgroundColor: (Colors.black12),
//             action: SnackBarAction(
//               label: 'dismiss',
//               onPressed: () {
//               },
//             ),
//           );
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);