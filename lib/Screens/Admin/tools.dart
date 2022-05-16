import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Admin/components/constructor.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';


class ToolsAdmin extends StatelessWidget {
  const ToolsAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          AdminCard(
            icon: Icon(
              Icons.new_label_rounded,
              size: 30,
            ),
            title: 'Add News',
            index: 0,
          ),
          AdminCard(
            icon: Icon(
              Icons.telegram_rounded,
              size: 30,
            ),
            title: 'Send Notifications',
            index: 1,
          ),
          AdminCard(
            icon: Icon(
              Icons.book_rounded,
              size: 30,
            ),
            title: 'Update Letter',
            index: 2,
          ),
          AdminCard(
            icon: Icon(
              Icons.book_rounded,
              size: 30,
            ),
            title: 'Add Entrance Exam',
            index: 3,
          ),
          AdminCard(
            icon: Icon(
              Icons.insert_drive_file_sharp,
              size: 30,
            ),
            title: 'Update Interships',
            index: 4,
          ),
          AdminCard(
            icon: Icon(
              Icons.school,
              size: 30,
            ),
            title: 'Update Filieres',
            index: 5,
          ),
        ],
      ),
    );
  }
}

class AdminCard extends StatelessWidget {
  final icon;
  final title;
  final index;
  const AdminCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.index,
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
              blurRadius: 2,
              // spreadRadius: 1.0,
              offset: Offset(0, 5),
              blurStyle: BlurStyle.inner,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 216, 216, 216),
              // blurStyle: BlurStyle.solid,
              blurRadius: 2,
              // spreadRadius: 1.0,
              offset: Offset(0, 5),
              blurStyle: BlurStyle.outer,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacer(),
          icon,
          // Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Constructor(index: index))),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: textStyle(context, title),
          ),
        ],
      ),
    );
  }
}
