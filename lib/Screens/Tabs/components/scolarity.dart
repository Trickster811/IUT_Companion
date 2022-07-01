import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
// import 'package:iut_companion/Screens/Tabs/components/informationsFiliere.dart';

class Scolarite extends StatelessWidget {
  const Scolarite({Key? key}) : super(key: key);
  final index = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: size(50, context),
        ),
        carteScolarity("Frais Universitaire"),
        carteScolarity("Carte d'etudiant"),
        carteScolarity("Certificat de scolarite"),
        carteScolarity("Releve de notes"),
        carteScolarity("Visites medicales"),
      ],
    ));
  }
}

class carteScolarity extends StatelessWidget {
  String title = "";
  carteScolarity(titre) {
    this.title = titre;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      margin: EdgeInsets.only(bottom: size(20, context)),
      padding: EdgeInsets.symmetric(
          vertical: size(15, context), horizontal: size(20, context)),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 250, 244, 253),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 187, 187, 187),
              blurRadius: 10,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: taille(16, context),
            fontFamily: 'ArialRoundedBold',
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
