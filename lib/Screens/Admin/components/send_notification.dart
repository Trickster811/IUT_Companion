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
    ImageSource source = ImageSource.camera;
  @override
  Widget build(BuildContext context) {
    // Variables to get user entries
    final field_1 = TextEditingController();
    final field_2 = TextEditingController();

    // Form key
    final _formKey = GlobalKey<FormState>();

    // image source

    return Scaffold(
      // backgroundColor: kPrimaryColor,
      body: Stack(
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
                      'Send us a message',
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
                            top: size(40, context),
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
                                    SizedBox(
                                      height: size(12, context),
                                    ),
                                    textStyle(context, 'Titre'),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: taille(10, context),
                                        height: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'titre',
                                      ),
                                      controller: field_1,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez mentionner le titre'),
                                    ),

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
                                        hintText: 'description',
                                      ),
                                      controller: field_1,
                                      validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner du contenu'),
                                    ),

                                    SizedBox(
                                      height: size(12, context),
                                    ),
                                    textStyle(context, 'Picture'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 25.0,
                                            horizontal: 10.0,
                                          ),
                                          height: 75,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 153, 115, 156),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            'load an image for you message...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'OpenSans_Regular',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 25.0,
                                            horizontal: 10.0,
                                          ),
                                          height: 75,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Expanded(
                                                    child: AlertDialog(
                                                      title: Text('Hi!!'),
                                                      content: Text(
                                                        'Pick from',
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              setState(() {
                                                            this.source =
                                                                ImageSource
                                                                    .camera;
                                                          }),
                                                          child: Text(
                                                            'Camera',
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryColor),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              setState(() {
                                                            this.source =
                                                                ImageSource
                                                                    .gallery;
                                                          }),
                                                          child: Text(
                                                            'Galery',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );

                                              final image = PicturePicker
                                                  .imageGallerypicker(
                                                source,
                                                context,
                                              );
                                              NotificationApi.showNotification(
                                                id: 0,
                                                title: field_1.text,
                                                body: field_2.text,
                                                payload:
                                                    'IUT_Companion_notification',
                                                bigPicturePath: image,
                                                largeIconPath: image,
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 0.0,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                            ),
                                            child: Text(
                                              'Choose',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'OpenSans_Regular',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size(12, context),
                                    ),

                                    // Submit Button

                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final data = [
                                              field_1.text,
                                              field_2.text,
                                            ];
                                          }
                                        },
                                        child: Text(
                                          'Send',
                                          style: TextStyle(
                                            fontSize: 20,
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
      ),
    );
  }
}