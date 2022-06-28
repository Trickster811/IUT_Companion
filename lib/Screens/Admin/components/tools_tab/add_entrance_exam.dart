import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/send_notification.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/notification_Api.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:iut_companion/manage_db.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:path/path.dart';

class EntranceExam extends StatefulWidget {
  @override
  State<EntranceExam> createState() => _EntranceExamState();
}

class _EntranceExamState extends State<EntranceExam> {
  UploadTask? task;

  File? file;

  // This variable will store the iage source
  ImageSource source = ImageSource.camera;

  // Variables to get user entries
  final field_1 = TextEditingController();
  final field_3 = TextEditingController();
  final field_2 = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Initial Selected Value
  String? dropdownvalue_1;
  String? dropdownvalue_2;

  // List of items in our dropdown menu for mention
  List<DropdownMenuItem<String>> get typeOfNews {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, "Concours d'entrée en cycle DUT"),
        value: "Concours d'entrée en cycle DUT",
      ),
      DropdownMenuItem(
        child: textStyle(context, "Concours d'entrée en cycle BTS"),
        value: "Concours d'entrée en cycle BTS",
      ),
      DropdownMenuItem(
        child: textStyle(
            context, "Concours d'entrée en cycle Licence Technologique"),
        value: "Concours d'entrée en cycle Licence Technologique",
      ),
    ];
    return items;
  }

// List of items in our dropdown menu for mention
  List<DropdownMenuItem<String>> get session {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, "January ${time.year}"),
        value: "January ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "Febuary ${time.year}"),
        value: "Febuary ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "March ${time.year}"),
        value: "March ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "April ${time.year}"),
        value: "April ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "May ${time.year}"),
        value: "May ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "June ${time.year}"),
        value: "June ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "July ${time.year}"),
        value: "July ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "August ${time.year}"),
        value: "August ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "September ${time.year}"),
        value: "September ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "October ${time.year}"),
        value: "October ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "November ${time.year}"),
        value: "November ${time.year}",
      ),
      DropdownMenuItem(
        child: textStyle(context, "December ${time.year}"),
        value: "December ${time.year}",
      ),
    ];
    return items;
  }

  final time = DateTime.now();
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? file!.path : 'No file selected';

    // image source
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
                    'Schedule an Entrance Exam',
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
                                  textStyle(context, 'Exam Name'),
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
                                  textStyle(context, 'Session'),
                                  // DropdownButtonFormField(
                                  //   style: TextStyle(
                                  //     fontSize: taille(10, context),
                                  //     height: 0.5,
                                  //   ),
                                  //   decoration: InputDecoration(
                                  //     // icon: Icon(Icons.person),
                                  //     hintText: 'select a month',
                                  //   ),
                                  //   value: dropdownvalue_2,
                                  //   validator: (value) => value == null
                                  //       ? 'Veuillez choisir une session'
                                  //       : null,
                                  //   items: session,
                                  //   onChanged: (String? newValue) {
                                  //     setState(() {
                                  //       dropdownvalue_2 = newValue!;
                                  //     });
                                  //   },
                                  // ),

                                  // SizedBox(
                                  //   height: size(12, context),
                                  // ),
                                  DateTimeField(
                                    controller: field_3,
                                    format: format,
                                    decoration: InputDecoration(
                                      hintText: 'date picker',
                                    ),
                                    onShowPicker: (context, currentValue) {
                                      return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Conditions'),
                                  TextFormField(
                                    maxLines: 10,
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 1.5,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'admitives conditions',
                                    ),
                                    controller: field_1,
                                    validator: RequiredValidator(
                                        errorText:
                                            "Veuillez renseigner les conditions d'éligibilité"),
                                  ),

                                  SizedBox(
                                    height: size(12, context),
                                  ),
                                  textStyle(context, 'Payments feeds'),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: taille(10, context),
                                      height: 1.5,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'feeds',
                                    ),
                                    controller: field_2,
                                    validator: RequiredValidator(
                                        errorText:
                                            'Veuillez mentionner la somme'),
                                  ),

                                  SizedBox(
                                    height: size(12, context),
                                  ),

                                  textStyle(context, 'Upload Document'),
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
    if (field_1.text != '' &&
        field_2.text != '' &&
        dropdownvalue_1 != null &&
        field_3.text != '') {
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
        dropdownvalue_1,
        field_3.text,
        field_1.text,
        field_2.text,
        urlDownload,
      ];
      Exam.createExam(data);
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
