import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({
    Key? key,
  
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          child: Image.asset(
            'assets/images/bg_img.png',
            fit: BoxFit.fitWidth,
            height: size.height * .45,
          ),
        ),
        SafeArea(
            child: Column(
          children: [
            Text(
              'Good Morning\nMr Joachim!!',
              style: TextStyle(
                color: kPrimaryColor,
                fontFamily: 'OpenSans_Regular',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CupertinoSearchTextField(
              borderRadius: BorderRadius.circular(30),
              onChanged: (String value) {
                print('The text has changed to: $value');
              },
              onSubmitted: (String value) {
                print('Submitted text: $value');
              },
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: .85,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  AdminCard(
                      cardPicture: 'assets/images/letter.png',
                      title: 'Add News'),
                ],
              ),
            )
          ],
        ))
      ],
    );
  }
}

class AdminCard extends StatelessWidget {
  final cardPicture;
  final title;
  const AdminCard({
    Key? key,
    required this.cardPicture,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 216, 216, 216),
              // blurStyle: BlurStyle.solid,
              blurRadius: 5.0,
              // spreadRadius: 1.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(5, 0),
            ),
          ]),
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            cardPicture,
            fit: BoxFit.cover,
          ),
          Spacer(),
          TextTitle.textTitle(title),
        ],
      ),
    );
  }
}
