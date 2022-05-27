import 'dart:io';
// import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AdaptiveSizes {
  const AdaptiveSizes();

  getadaptiveSize(BuildContext context, dynamic value) {
// 720 is medium screen height
    // return (value / 720) * MediaQuery.of(context).size.height;
    return (value / 300) * MediaQuery.of(context).size;
  }
}

class AdaptiveSize {
  const AdaptiveSize();

  getadaptiveSize(BuildContext context, dynamic value) {
// 720 is medium screen height
    // return (value / 720) * MediaQuery.of(context).size.height;
    return (value * 2.05) *
        (MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height);
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
// 720 is medium screen height
    // return (value / 720) * MediaQuery.of(context).size.height;
    return (value * 2.1) *
        (MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height);
  }
}

double sizes(val, context) {
  return AdaptiveSizes().getadaptiveSize(context, val);
}

double size(double val, context) {
  return AdaptiveSize().getadaptiveSize(context, val);
}

double taille(double val, context) {
  return AdaptiveTextSize().getadaptiveTextSize(context, val);
}

Padding textStyle(BuildContext context, title) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: size(10, context),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        fontSize: taille(12, context),
        fontFamily: 'OpenSans_Regular',
      ),
    ),
  );
}

class PicturePicker {
  static Future imageGallerypicker(ImageSource source, context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      // final imageTemporaly = File(image.path);
      final imagePermanently = await saveImagePermanently(image.path);
      return imagePermanently;
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text('Oups!!'),
              content: Text(
                'Failed to pick image',
              ),
            ),
          );
        },
      );
      print('Failed to pick image: $e');
    }
  }

  static Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}

Future showImageSource(BuildContext context) async {
  if (Platform.isIOS) {
    return showCupertinoModalPopup<ImageSource>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            // onPressed: () => imageGallerypicker(ImageSource.camera, context),
            onPressed: () => Navigator.of(context).pop(ImageSource.camera),
            child: Text('Camera'),
          ),
          CupertinoActionSheetAction(
            // onPressed: () => imageGallerypicker(ImageSource.galery, context),
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
            child: Text('Galery'),
          ),
        ],
      ),
    );
  } else {
    return showModalBottomSheet(
      context: context,
      builder: (contex) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt_rounded),
            title: Text('Camera'),
            onTap: () => Navigator.of(context).pop(ImageSource.camera),
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Galery'),
            onTap: () => Navigator.of(context).pop(ImageSource.gallery),
          )
        ],
      ),
    );
  }
}
