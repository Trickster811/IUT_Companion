import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/send_notification.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/notification_Api.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:iut_companion/manage_db.dart';

class AddNews extends StatefulWidget {
  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  UploadTask? task;
  File? file;
  // This variable will store the iage source
  ImageSource source = ImageSource.camera;

  // Variables to get user entries
  final field_1 = TextEditingController();
  final field_2 = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Initial Selected Value
  String? dropdownvalue_1;

  // List of items in our dropdown menu for mention
  List<DropdownMenuItem<String>> get typeOfNews {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'Sport'),
        value: 'Sport',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Department'),
        value: 'Department',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Concours'),
        value: 'Concours',
      ),
    ];
    return items;
  }

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
                    'Time to be updated',
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
                                  textStyle(context, 'Type'),
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
                                    items: typeOfNews,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue_1 = newValue!;
                                      });
                                    },
                                  ),

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
                                    controller: field_2,
                                    validator: RequiredValidator(
                                        errorText:
                                            'Veuillez renseigner du contenu'),
                                  ),

                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Picture'),
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
                                      //         fontFamily: 'OpenSans_Regular',
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
                                            fontFamily: 'OpenSans_Regular',
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
    if (field_1.text != '' && field_2.text != '' && dropdownvalue_1 != null) {
      if (file == null) return;

      final fileName = file!.path;
      final destination = 'news_images/$fileName';

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
                fontFamily: 'OpenSans_Regular',
              ),
            ),
            message: Text(
              'Your message have been sent.\n Good Job!!!',
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
        ),
      );
      final urlDownload = await snapshot.ref.getDownloadURL();

      print('Download Link: $urlDownload');
      final data = [
        field_1.text,
        field_2.text,
        urlDownload,
        dropdownvalue_1,
      ];
      News.createNews(data);
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
            'Please fill out Title and the description of your message.',
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
              fontFamily: 'OpenSans_Regular',
            ),
          );
        } else {
          return Container();
        }
      });
}
