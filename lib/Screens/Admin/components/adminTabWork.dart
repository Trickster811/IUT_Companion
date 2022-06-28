import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AdminWorkSpace extends StatelessWidget {
  final index;
  const AdminWorkSpace({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tabs = [
      Info(),
      Info(),
      Info(),
      Info(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        // leading: BackButton
        actions: [
          Icon(
            Icons.account_circle_sharp,
            size: 30,
          )
        ],
        title: Image.asset(
          'assets/images/AppName_light.png',
          width: size(150, context),
          height: size(100, context),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Container(
        // padding: padding_h,
        height: double.maxFinite,
        width: double.maxFinite,

        child: Stack(
          children: [
            Positioned(
              right: -120,
              bottom: 0,
              child: Image.asset(
                'assets/images/logo_iut.png',
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
                width: 350,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'Admin Workspace',
                          style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "Let's add something our application.",
                          style: TextStyle(
                            fontFamily: 'ArialRoundedBold',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: tabs[index],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  // image for news variable
  File? image;

  // Variables to get user entries
  final my_con_1 = TextEditingController();
  final my_con_2 = TextEditingController();

  int id = 1;

  // Form key
  final _dropdownFormKey = GlobalKey<FormState>();

  // Initial Selected Value
  String? dropdownvalue_1;

  // List of items in our dropdown menu for mention
  List<DropdownMenuItem<String>> get items_mn {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: textStyle(context, 'News'),
        value: 'News',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Departments'),
        value: 'Departments',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Concours'),
        value: 'Concours',
      ),
      DropdownMenuItem(
        child: textStyle(context, 'Sport'),
        value: 'Sport',
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: size(40, context),
          ),
        ),
        Form(
          key: _dropdownFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size(12, context),
              ),
              textStyle(context, 'Title : '),
              TextFormField(
                style: TextStyle(
                  fontSize: taille(10, context),
                  height: 1.5,
                ),
                decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  hintText: 'enter a title',
                ),
                // value: dropdownvalue_1,
                controller: my_con_1,
                validator: RequiredValidator(
                    errorText: 'Veuillez renseigner un titre'),
              ),
              SizedBox(
                height: size(12, context),
              ),
              textStyle(context, 'Image : '),
              ElevatedButton(
                onPressed: () {},
                child: image == null
                    ? ImageWidget(
                        image: image!,
                        onClicked: (source) =>
                            PicturePicker.imageGallerypicker(source, context),
                      )
                    : TextFormField(
                        keyboardType: TextInputType.url,
                        style: TextStyle(
                          fontSize: taille(10, context),
                          height: 1.5,
                        ),
                        decoration: InputDecoration(
                          // icon: Icon(Icons.person),
                          hintText: 'add an image',
                        ),
                        // value: dropdownvalue_1,
                        controller: my_con_2,
                        validator: RequiredValidator(
                            errorText: 'Please pick an image'),
                      ),
              ),
              TextFormField(
                keyboardType: TextInputType.url,
                style: TextStyle(
                  fontSize: taille(10, context),
                  height: 1.5,
                ),
                decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  hintText: 'add an image',
                ),
                // value: dropdownvalue_1,
                controller: my_con_2,
                validator: RequiredValidator(errorText: 'Please pick an image'),
              ),
              textStyle(context, 'Content : '),
              TextFormField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: taille(10, context),
                  height: 1.5,
                ),
                decoration: InputDecoration(
                  // icon: Icon(Icons.person),
                  hintText: 'enter a content',
                ),
                // value: dropdownvalue_1,
                controller: my_con_2,
                validator:
                    RequiredValidator(errorText: 'Veuillez mettre du contenu'),
              ),
              SizedBox(
                height: size(12, context),
              ),
              SizedBox(
                height: size(12, context),
              ),
              textStyle(context, 'Category : '),
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
                validator: (value) =>
                    value == null ? 'Veuillez choisir une category' : null,
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

              // Submit Button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_dropdownFormKey.currentState!.validate()) {
                      final userInputs = [
                        my_con_1.text,
                        my_con_2.text,
                        dropdownvalue_1,
                        // _radioValue,
                      ];
                    }
                  },
                  child: Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'ArialRoundedBold',
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
    );
  }
}

class ImageWidget extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onClicked;

  const ImageWidget({
    Key? key,
    required this.image,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: Container(),
            // buildEditIcon(color),
          )
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          height: 160,
          width: 160,
          child: InkWell(
            onTap: () async {
              final source = await showImageSource(context);
              if (source == null) return;

              onClicked(source);
            },
          ),
        ),
      ),
    );
  }
}

Future<ImageSource?> showImageSource(BuildContext context) async {
  if (Platform.isIOS) {
    return showCupertinoModalPopup(
      context: context,
      builder: ((context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                child: Text('Camera'),
                onPressed: () => Navigator.of(context).pop(ImageSource.camera),
              ),
              CupertinoActionSheetAction(
                child: Text('Galery'),
                onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
              )
            ],
          )),
    );
  } else {
    return showModalBottomSheet(
      context: context,
      builder: ((context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_outlined),
                title: Text('Camera'),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
              ListTile(
                leading: Icon(Icons.image_rounded),
                title: Text('Camera'),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
            ],
          )),
    );
  }
}
