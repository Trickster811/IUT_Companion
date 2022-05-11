import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';

class ToolsAdmin extends StatelessWidget {
  const ToolsAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/images/bg_img.png',
          fit: BoxFit.fitWidth,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans_Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Mr Joachim!!',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans_Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CupertinoSearchTextField(
                      backgroundColor: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      onChanged: (String value) {
                        print('The text has changed to: $value');
                      },
                      onSubmitted: (String value) {
                        print('Submitted text: $value');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.white,
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        AdminCard(
                          cardPicture: 'assets/images/letter.png',
                          title: 'Add News',
                        ),
                        AdminCard(
                          cardPicture: 'assets/images/letter.png',
                          title: 'Add News',
                        ),
                        AdminCard(
                          cardPicture: 'assets/images/letter.png',
                          title: 'Add News',
                        ),
                        AdminCard(
                          cardPicture: 'assets/images/letter.png',
                          title: 'Add News',
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ]),
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
          textStyle(context, title),
        ],
      ),
    );
  }
}
