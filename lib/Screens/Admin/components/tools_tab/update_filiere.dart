import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/send_notification.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:iut_companion/manage_db.dart';

class UpdateFiliere extends StatefulWidget {
  @override
  State<UpdateFiliere> createState() => _UpdateFiliereState();
}

class _UpdateFiliereState extends State<UpdateFiliere> {
  // Variables to get user entries
  final field_1 = TextEditingController();
  final field_2 = TextEditingController();

  int id = 1;

  // Form key
  final _formKey = GlobalKey<FormState>();

// Initial Selected Value
  String? dropdownvalue_1;

  // List of items in our dropdown menu for mention
  List<DropdownMenuItem<String>> get cycle {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'Diplôme Universitaire de Technologie'),
        value: 'Diplôme Universitaire de Technologie',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Brevet de Technicien Supérieur'),
        value: 'Brevet de Technicien Supérieur',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Licence Technologique'),
        value: 'Licence Technologique',
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
                    'Send a  message',
                    style: TextStyle(
                      fontSize: taille(20, context),
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
                          top: size(30, context),
                        ),
                      ),
                      Container(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textStyle(context, 'Name'),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: 'enter a designation',
                                      ),
                                      controller: field_1,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner un nom')),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Phone'),
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
                                    items: cycle,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_1 = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: size(20, context),
                                  ),
                                  textStyle(context, 'Description'),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'description',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: field_2,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez saisir une description')),
                                  SizedBox(
                                    height: size(20, context),
                                  ),

                                  // Submit Button
                                  ButtonWidget(
                                    icon: Icons.cloud_upload_outlined,
                                    text: 'Send',
                                    onClicked: uploadFile,
                                  ),
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
                        '2022 | Daily Learning',
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

  Future uploadFile() async {
    if (field_1.text != '' && field_2.text != '' && dropdownvalue_1 != '') {
      final data = [
        field_1.text,
        dropdownvalue_1,
        field_2.text,
      ];
      try {
        Filiere.createFiliere(data);
        return showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: Text(
              'Success!!',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontFamily: 'OpenSans_Regular',
              ),
            ),
            message: Text(
              'Good Job!!\nLetter of Recommandation model was well updated.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'OpenSans_Regular',
              ),
            ),
            actions: [
              CupertinoActionSheetAction(
                // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      } catch (e) {
        return showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: Text(
              'Error!!',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
                fontFamily: 'OpenSans_Regular',
              ),
            ),
            message: Text(
              'Sorry some error occured.\nPlease retry.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'OpenSans_Regular',
              ),
            ),
            actions: [
              CupertinoActionSheetAction(
                // onPressed: () => imageGallerypicker(ImageSource.camera, context),
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      }
    } else {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: Text(
            'Warning!!',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 14,
              fontFamily: 'OpenSans_Regular',
            ),
          ),
          message: Text(
            'Please fill out all the fields of this form.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'OpenSans_Regular',
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              // onPressed: () => imageGallerypicker(ImageSource.camera, context),
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    }
  }
}
