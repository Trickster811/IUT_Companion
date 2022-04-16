import 'package:flutter/material.dart';

class Backgound extends StatelessWidget {
  final Widget child;
  const Backgound({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
          // fit: StackFit.expand,
          // alignment: Alignment.center,
          children: <Widget>[
            // fit: StackFit.expand,
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/1.png',
                width: size.width * 0.3,
              ),
            ),
            // Positioned(
            //     top: 0,
            //     right: 0,
            //     child: Image.asset(
            //       'assets/images/3.png',
            //       // width: size.width * 0.5,
            //     )),
            // Positioned(
            //     top: 0,
            //     right: 0,
            //     child: Image.asset(
            //       'assets/images/up_1.png',
            //       width: size.width * 0.5,
            //     )),
            // Positioned(
            //     bottom: 0,
            //     left: 0,
            //     child: Image.asset(
            //       'assets/images/down_1.png',
            //       width: size.width * 0.9,
            //     )),
            // Positioned(
            //     top: 100,
            //     left: 50,
            //     child: Image.asset(
            //       'assets/images/waves.png',
            //       width: size.width * 0.05,
            //     )),

            child,
          ]),
    
    );
  }
}
