import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/send_notification.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:iut_companion/manage_db.dart';

class UpdateLetter extends StatefulWidget {
  @override
  State<UpdateLetter> createState() => _UpdateLetterState();
}

class _UpdateLetterState extends State<UpdateLetter> {
  // Variables to get user entries
  final field_1 = TextEditingController();

  final field_2 = TextEditingController();

  final field_3 = TextEditingController();

  int id = 1;

  // Form key
  final _formKey = GlobalKey<FormState>();

  // image
  Future<dynamic>? image;

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
                      fontFamily: 'ArialRoundedBold',
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
                                  textStyle(context, 'Email'),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: 'entrer un email',
                                      ),
                                      controller: field_1,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner un email')),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Phone'),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'saisir un numero',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: field_2,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez saisir un numero de telephone')),
                                  SizedBox(
                                    height: size(20, context),
                                  ),
                                  textStyle(context, 'PO BOX'),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'po box',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: field_3,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez saisir un po box')),
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
    if (field_1.text != '' && field_2.text != '' && field_3.text != '') {
      final data = [
        field_1.text,
        field_2.text,
        field_3.text,
      ];
      try {
        Letter_info.createLetter_info(data);
        return showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: Text(
              'Success!!',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
                fontFamily: 'ArialRoundedBold',
              ),
            ),
            message: Text(
              'Good Job!!\nLetter of Recommandation model was well updated.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'ArialRoundedBold',
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
                fontFamily: 'ArialRoundedBold',
              ),
            ),
            message: Text(
              'Sorry some error occured.\nPlease retry.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'ArialRoundedBold',
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
              fontFamily: 'ArialRoundedBold',
            ),
          ),
          message: Text(
            'Please fill out all the fields of this form.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'ArialRoundedBold',
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
