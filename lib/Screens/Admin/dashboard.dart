import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Admin/components/dashboard_constructor.dart';
import 'package:iut_companion/Screens/Admin/tools.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';

class DashboardAdmin extends StatelessWidget {
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
          DashboardCard(
            icon: Text(
              '67',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans_Regular',
                color: Colors.redAccent,
              ),
            ),
            title: 'Letter Generated',
            index: 0,
          ),
          DashboardCard(
            icon: Text(
              '07',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans_Regular',
                color: Colors.blueAccent,
              ),
            ),
            title: 'Send Notifications',
            index: 1,
          ),
          DashboardCard(
            icon: Text(
              '14',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans_Regular',
                color: Colors.green,
              ),
            ),
            title: 'Update Letter',
            index: 2,
          ),
          DashboardCard(
            icon: Text(
              '29',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans_Regular',
                color: kPrimaryColor,
              ),
            ),
            title: 'Add Entrance Exam',
            index: 3,
          ),
          DashboardCard(
            icon: Text(
              '23',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans_Regular',
                color: Colors.brown,
              ),
            ),
            title: 'Update Interships',
            index: 4,
          ),
          DashboardCard(
            icon: Text(
              '42',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans_Regular',
                color: Colors.amber,
              ),
            ),
            title: 'Update Filieres',
            index: 5,
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final icon;
  final title;
  final index;
  const DashboardCard({
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
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DashboardConstructor(index: index),
              ),
            ),
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
