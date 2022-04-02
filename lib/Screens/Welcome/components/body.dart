import 'package:iut_companion/Screens/Welcome/components/background.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Backgound(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo_iut.png',
            height: size.height * 0.13,
          ),
          const Text(
            'KALI',
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 50,
              fontFamily: 'algerian',
            ),
          ),

          // const SizedBox(
          //   height: 20,
          // ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(4),
          //   child: Stack(
          //     children: <Widget>[
          //       Positioned.fill(
          //         child: Container(
          //             decoration: const BoxDecoration(
          //           gradient: LinearGradient(colors: <Color>[
          //             Color(0xFF0D47A1),
          //             Color(0xFF395F06),
          //             Color(0xFF0DE7A1),
          //           ]),
          //         )),
          //       ),
          //     ],
          //   ),
          // ),

          TextButton(
            // style: TextButton.styleFrom(
            //   padding: const EdgeInsets.all(16.0),
            //   primary: Color.fromRGBO(154, 0, 141, 0),
            //   // backgroundColor: Color(0x009A008D),
            //   // onSurface: Color(0x009A008D),
            //   // shape: const BeveledRectangleBorder(
            //   //   borderRadius: BorderRadius.all(Radius.circular(5)),
            //   // ),
            // ),
            child: const Text(
              'Start',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                kPrimaryColor,
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                 backgroundColor: Color(0x009A008D)
              ),
              child: Text('Start'),
            ),
          )
        ],
      ),
    );
  }
}
