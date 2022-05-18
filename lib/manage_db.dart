import 'dart:io';

import 'package:path/path.dart';
// import 'package:excel/excel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:path_provider/path_provider.dart';

final firebase = FirebaseFirestore.instance;

// Functions to manage Exam/Concours
class Exam {
  // create
  static createExam(data) async {
    try {
      FirebaseFirestore.instance.collection('Concours').doc().set({
        'intitule': data[0],
        'arrete': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateExam(data) async {
    try {
      firebase.collection('Concours').doc(data[0]).update({
        'arrete': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteExam(data) async {
    try {
      firebase.collection('Concours').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Functions to manage Result
class Result {
  // create
  static createResult(data) async {
    try {
      FirebaseFirestore.instance.collection('Concours').doc().set({
        'intitule': data[0],
        'bill': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateResult(data) async {
    try {
      firebase.collection('Concours').doc(data[0]).update({
        'bill': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteResult(data) async {
    try {
      firebase.collection('Concours').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Functions to manage News
class News {
  // create
  static createNews(data) async {
    try {
      FirebaseFirestore.instance.collection('Actualites').doc().set({
        'titre': data[0],
        'contenu': data[1],
        'date': DateTime.now(),
        'image': data[2],
        'type': data[3],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateNews(data) async {
    try {
      firebase.collection('Actualites').doc(data[0]).update({
        'titre': data[0],
        'contenu': data[1],
        'date': data[2],
        'image': DateTime.now(),
        'type': data[3],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteNews(data) async {
    try {
      firebase.collection('Actualites').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Functions to manage Stage

class Stage {
  // create
  static createStage(data) async {
    try {
      FirebaseFirestore.instance.collection('Stage').doc().set({
        'nom': data[0],
        'date_Deb': data[1],
        'date_Fin': data[2],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateStage(data) async {
    try {
      firebase.collection('Stage').doc(data[0]).update({
        'nom': data[0],
        'date_Deb': data[1],
        'date_Fin': data[2],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteStage(data) async {
    try {
      firebase.collection('Stage').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Functions to Stage_type
class Stage_type {
  // create
  static createStage_type(data) async {
    try {
      FirebaseFirestore.instance.collection('Concours').doc().set({
        'intitule': data,
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateStage_type(data) async {
    try {
      firebase.collection('Concours').doc(data).update({
        'intitule': data,
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteStage_type(data) async {
    try {
      firebase.collection('Concours').doc(data).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Function to manage Users
class Student {
  // create
  static createStudent(data) async {
    try {
      FirebaseFirestore.instance.collection('Student').doc(data[0]).set({
        'matricule': data[0],
        'nom': data[1],
        'prenom': data[2],
        'sexe': data[3],
        'mention': data[4],
        'parcours': data[5],
        'level': data[6],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateStudent(data) async {
    try {
      firebase.collection('Student').doc(data[0]).update({
        'matricule': data[0],
        'nom': data[1],
        'prenom': data[2],
        'sexe': data[3],
        'mention': data[4],
        'parcours': data[5],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteStudent(data) async {
    try {
      firebase.collection('Student').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Function to manage admin  account
class Admin {
  // create
  static createAdmin(data) async {
    try {
      FirebaseFirestore.instance.collection('Admin').doc(data[0]).set({
        'username': data[0],
        'password': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateAdmin(data) async {
    try {
      firebase.collection('Admin').doc(data[0]).update({
        'nom': data[0],
        'password': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteAdmin(data) async {
    try {
      firebase.collection('Admin').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Function to manage info for letter of recommandations
class Letter_info {
  // create
  static createLetter_info(data) async {
    try {
      FirebaseFirestore.instance.collection('Letter_info').doc(data[0]).set({
        'email': data[0],
        'phone': data[1],
        'pobox': data[2],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateLetter_info(data) async {
    try {
      firebase.collection('Letter_info').doc(data[0]).update({
        'email': data[0],
        'phone': data[1],
        'pobox': data[2],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteLetter_info(data) async {
    try {
      firebase.collection('Letter_info').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// Function to manage info for letter of recommandations
class Filiere {
  // create
  static createFiliere(data) async {
    try {
      FirebaseFirestore.instance.collection('Filiere').doc(data[0]).set({
        'intitule': data[0],
        'cycle': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // update
  static updateFiliere(data) async {
    try {
      firebase.collection('Filiere').doc(data[0]).update({
        'intitule': data[0],
        'cycle': data[1],
      });
    } catch (e) {
      print(e);
    }
  }

  // delete
  static deleteFiliere(data) async {
    try {
      firebase.collection('Filiere').doc(data[0]).delete();
    } catch (e) {
      print(e);
    }
  }
}

// var file = "Path_to_pre_existing_Excel_File/excel_file.xlsx";
//     var bytes = File(file).readAsBytesSync();
//     var excel = Excel.decodeBytes(bytes);

//     for (var table in excel.tables.keys) {
//       print(table); //sheet Name
//       print(excel.tables[table].maxCols);
//       print(excel.tables[table].maxRows);
//       for (var row in excel.tables[table].rows) {
//         print("$row");
//       }
//     }

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}

Future<int> readFile() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0
    return 0;
  }
}
