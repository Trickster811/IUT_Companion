import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';

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
        'date': data[2],
        'image': data[3],
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
        'image': data[3],
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
      FirebaseFirestore.instance.collection('Student').doc().set({
        // 'matricule': data[0],
        'nom': data[1],
        'prenom': data[2],
        // 'sexe': data[3],
        // 'mention': data[4],
        // 'parcours': data[5],
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
