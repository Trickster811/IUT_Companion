import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iut_companion/Screens/Tabs/components/generer.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/notification_Api.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iut_companion/manage_db.dart';
import 'package:open_file/open_file.dart';

class SendNotifications extends StatefulWidget {
  const SendNotifications({
    Key? key,
  }) : super(key: key);

  @override
  State<SendNotifications> createState() => _SendNotificationsState();
}

class _SendNotificationsState extends State<SendNotifications> {
  UploadTask? task;
  File? file;
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
    final fileName = file != null ? file!.path : 'No file selected';
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
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // textStyle(context, 'Upload an image'),
                                      // SizedBox(
                                      //   width: size(150, context),
                                      //   child: ElevatedButton(
                                      //     onPressed: () async {
                                      //       final source =
                                      //           await showImageSource(context);
                                      //       print(source);
                                      //       PicturePicker.imageGallerypicker(
                                      //         source,
                                      //         context,
                                      //       );
                                      //     },
                                      //     child: Text(
                                      //       'Upload here',
                                      //       style: TextStyle(
                                      //         fontSize: taille(14, context),
                                      //         fontFamily: 'ArialRoundedBold',
                                      //       ),
                                      //     ),
                                      //     style: TextButton.styleFrom(
                                      //       backgroundColor: kPrimaryColor,
                                      //       // elevation: 0,
                                      //     ),
                                      //   ),
                                      // )
                                      ButtonWidget(
                                        text: 'Choose a file',
                                        icon: Icons.attach_file,
                                        onClicked: selectFile,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: Border(
                                            top: BorderSide(
                                              color: kPrimaryColor,
                                              width: 2,
                                            ),
                                            bottom: BorderSide(
                                              color: kPrimaryColor,
                                              width: 2,
                                            ),
                                            right: BorderSide(
                                              color: kPrimaryColor,
                                              width: 2,
                                            ),
                                            left: BorderSide(
                                              color: kPrimaryColor,
                                              width: 2,
                                            ),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Text(
                                          fileName,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'ArialRoundedBold',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size(30, context),
                                  ),

                                  // Submit Button
                                  ButtonWidget(
                                    icon: Icons.cloud_upload_outlined,
                                    text: 'Send',
                                    onClicked: uploadFile,
                                  ),
                                  SizedBox(
                                    height: size(30, context),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size(20, context),
                                      ),
                                      width: size(150, context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: Border(
                                          top: BorderSide(
                                            color: kPrimaryColor,
                                            width: 2,
                                          ),
                                          bottom: BorderSide(
                                            color: kPrimaryColor,
                                            width: 2,
                                          ),
                                          right: BorderSide(
                                            color: kPrimaryColor,
                                            width: 2,
                                          ),
                                          left: BorderSide(
                                            color: kPrimaryColor,
                                            width: 2,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: task != null
                                          ? buildUploadStatus(task!)
                                          : Container(),
                                    ),
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

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (field_1.text != '' && field_2.text != '') {
      if (file == null) return;

      final fileName = file!.path;
      final destination = 'notifications_images/$fileName';

      task = FirebaseApi.uploadFile(destination, file!);
      setState(() {});

      if (task == null) return;
      final snapshot = await task!.whenComplete(
        () => showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: Text(
              'Success!!',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'ArialRoundedBold',
              ),
            ),
            message: Text(
              'Your message have been sent.\n Good Job!!!',
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
        ),
      );
      final urlDownload = await snapshot.ref.getDownloadURL();

      print('Download Link: $urlDownload');
      final data = [
        field_1.text,
        field_2.text,
        urlDownload,
      ];
      MessageCenter.createMessageCenter(data);
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
            'Please fill out Title and the description of your message.',
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

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final percentage = (progress * 100).toStringAsFixed(1);

          return Text(
            'Status: $percentage %',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'ArialRoundedBold',
            ),
          );
        } else {
          return Container();
        }
      });
}

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          minimumSize: Size.fromHeight(40),
        ),
        child: buildContext(context),
        onPressed: onClicked,
      );
  Widget buildContext(context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: size(25, context)),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'ArialRoundedBold',
            ),
          ),
        ],
      );
}
