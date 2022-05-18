import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iut_companion/Screens/Admin/components/adminTabWork.dart';

class ProfileAdmin extends StatelessWidget {
  final List data;
  const ProfileAdmin({
    Key? key,
    required this.data,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        ClipOval(
          child: Image.asset(
            'assets/images/admin.png',
            fit: BoxFit.cover,
            width: 160,
            height: 160,
          ),
        ),
        Text(
          'Mr ${data[0]}!!',
          style: TextStyle(
            // color: Colors.white,
            fontFamily: 'OpenSans_Regular',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
