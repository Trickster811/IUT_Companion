import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Admin/components/tools_tab/toolsTabConstructor.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

class ToolsAdmin extends StatelessWidget {
  const ToolsAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdminCard(
            icon: Icons.new_label_rounded,
            title: 'Add News',
            description: "Let's be Updated.",
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Color.fromARGB(255, 252, 50, 35),
                Color.fromRGBO(255, 115, 115, 1)
              ],
            ),
            index: 0,
          ),
          AdminCard(
            icon: Icons.telegram_rounded,
            title: 'Send Notifications',
            description: "Send a notifications or message.",
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Color.fromARGB(255, 0, 68, 255),
                Colors.blueAccent,
              ],
            ),
            index: 1,
          ),
          AdminCard(
            icon: Icons.book_rounded,
            title: 'Update Letter',
            description: "Get modifying Letter of recommanations Informations.",
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Colors.orange,
                Color.fromARGB(255, 255, 185, 94),
              ],
            ),
            index: 2,
          ),
          AdminCard(
            icon: Icons.file_open,
            title: 'Add Entrance Exam',
            description: "Schedule an Entrance Examination.",
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Colors.green,
                Colors.greenAccent,
              ],
            ),
            index: 3,
          ),
          AdminCard(
            icon: Icons.copy_all_rounded,
            title: 'Update Interships',
            description: "Schedule an InterShip.",
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
            ),
            index: 4,
          ),
          AdminCard(
            icon: Icons.school_rounded,
            title: 'Update Majors',
            description: "Update Informations on Major.",
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomStart,
              colors: [
                kPrimaryColor,
                Colors.purple,
              ],
            ),
            index: 5,
          ),
          Container(
            padding: EdgeInsets.only(bottom: size(75, context)),
            width: double.maxFinite,
            // height: size(20, context),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright',
                  style: TextStyle(
                      fontSize: taille(12, context), color: kPrimaryColor),
                ),
                Icon(
                  Icons.copyright_rounded,
                  color: kPrimaryColor,
                ),
                Text(
                  '2022 | Daily Learning',
                  style: TextStyle(
                      fontSize: taille(12, context), color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class AdminCard extends StatelessWidget {
//   final icon;
//   final title;
//   final index;
//   const AdminCard({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 216, 216, 216),
//               // blurStyle: BlurStyle.solid,
//               blurRadius: 2,
//               // spreadRadius: 1.0,
//               offset: Offset(0, 5),
//               blurStyle: BlurStyle.inner,
//             ),
//             BoxShadow(
//               color: Color.fromARGB(255, 216, 216, 216),
//               // blurStyle: BlurStyle.solid,
//               blurRadius: 2,
//               // spreadRadius: 1.0,
//               offset: Offset(0, 5),
//               blurStyle: BlurStyle.outer,
//             ),
//           ]),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Spacer(),
//           icon,
//           // Spacer(),
//           ElevatedButton(
//             onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => Constructor(index: index))),
//             style: TextButton.styleFrom(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 0.0,
//               ),
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//             ),
//             child: textStyle(context, title),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AdminCard extends StatelessWidget {
  final icon, title, description, gradient, index;
  const AdminCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Constructor(index: index),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    gradient: gradient,
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: size(40, context),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    // top: BorderSide(width: 1, color: Colors.black12),
                    bottom: BorderSide(width: 1, color: Colors.black12),
                  ),
                ),
                height: size(65, context),
                width: 225,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        // letterSpacing: 20,
                        color: Colors.black,
                        fontSize: taille(15, context),
                        fontFamily: 'ArialRoundedBold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   height: size(2, context),
                    // ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: taille(12, context),
                        fontFamily: 'ArialRoundedBold',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                    child: Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.black26,
                )),
              )
            ],
          ),
          SizedBox(
            height: size(25, context),
          ),
        ],
      ),
    );
  }
}
