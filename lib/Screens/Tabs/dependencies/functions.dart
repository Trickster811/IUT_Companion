import 'dart:io';
// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

// class User {
//   final String login;
//   final String pwd;
//   User(this.login, this.pwd);
// }

// class Actualite {
//   final String titre;
//   final String contenu;
//   final DateTime datePost;
//   final String img;
//   Actualite(this.titre, this.contenu, this.datePost, this.img);
// }

// class Stage {
//   final String intitule;
//   final String dateDeb;
//   final String dateFin;
//   Stage(this.intitule, this.dateDeb, this.dateFin);
// }

// class Concours {
//   final String intitule;
//   final String arrete;
//   Concours(this.intitule, this.arrete);
// }

// class Faq {
//   final String theme;
//   final String question;
//   final String reponse;
//   Faq(this.theme, this.question, this.reponse);
// }

// class Cycle {
//   final String intitule;
//   Cycle(this.intitule);
// }

// class TexteSt extends StatelessWidget {
//   const TexteSt({Key? key, required this.title, required this.styl})
//       : super(key: key);
//   final String title;
//   final TextStyle styl;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: styl,
//     );
//   }
// }

// class Texte extends StatelessWidget {
//   const Texte(
//       {Key? key,
//       required this.title,
//       this.font = 18,
//       this.color = Colors.black,
//       this.weight = FontWeight.normal})
//       : super(key: key);
//   final String title;
//   final double font;
//   final Color color;
//   final FontWeight weight;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: TextStyle(
//           fontSize: font,
//           fontWeight: weight,
//           color: color,
//           decoration: TextDecoration.none),
//     );
//   }
// }

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
