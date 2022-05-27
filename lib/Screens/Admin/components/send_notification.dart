import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iut_companion/Screens/Tabs/components/generer.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/notification_Api.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:open_file/open_file.dart';

class SendNotifications extends StatefulWidget {
  const SendNotifications({
    Key? key,
  }) : super(key: key);

  @override
  State<SendNotifications> createState() => _SendNotificationsState();
}

class _SendNotificationsState extends State<SendNotifications> {
  // Variables to get user entries
  final field_1 = TextEditingController();
  final field_2 = TextEditingController();

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
                                  textStyle(context, 'Titre'),
                                  TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'entrer un titre',
                                      ),
                                      controller: field_1,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner un titre')),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Description'),
                                  TextFormField(
                                      maxLines: 10,
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        // icon: Icon(Icons.person),
                                        hintText: 'saisir une description',
                                      ),
                                      // value: dropdownvalue_1,
                                      controller: field_2,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez saisir une description')),
                                  SizedBox(
                                    height: size(20, context),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      textStyle(context, 'Upload an image'),
                                      SizedBox(
                                        width: size(150, context),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final source =
                                                await showImageSource(context);
                                            print(source);
                                            PicturePicker.imageGallerypicker(
                                              source,
                                              context,
                                            );
                                          },
                                          child: Text(
                                            'Upload here',
                                            style: TextStyle(
                                              fontSize: taille(14, context),
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
                                  SizedBox(
                                    height: size(30, context),
                                  ),

                                  // Submit Button

                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          final userInputs = [
                                            field_1.text,
                                            field_2.text,
                                          ];
                                        }
                                      },
                                      child: Text(
                                        'Send',
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
