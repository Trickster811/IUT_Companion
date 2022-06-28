import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:rxdart/subjects.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController? _animationController;
  StreamController<bool>? isSideBarOpenedStreamController;
  Stream<bool>? isSideBarOpenedStream;
  StreamSink<bool>? isSideBarOpenedSink;
  // final bool isSideBarOpened = true;

  final _animationDuration = Duration(
    milliseconds: 500,
  );

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController!.stream;
    isSideBarOpenedSink = isSideBarOpenedStreamController!.sink;
  }

  @override
  void dispose() {
    _animationController!.dispose();
    isSideBarOpenedStreamController!.close();
    isSideBarOpenedSink!.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController!.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSideBarOpenedSink!.add(false);
      _animationController!.reverse();
    } else {
      isSideBarOpenedSink!.add(true);
      _animationController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream!,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenWidth - 30,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 20,
                  // ),
                  color: Color.fromARGB(255, 255, 254, 222),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        ListTile(
                          title: Text(
                            'Julie',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'ArialRoundedBold',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'simple_user',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              // fontFamily: 'ArialRoundedBold',
                              // fontWeight: FontWeight.w800,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            child: Image.asset(
                              'assets/images/logo_iut.png',
                              width: 35,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.black26,
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.hdr_weak_rounded,
                          title: 'IUT web',
                        ),
                        MenuItem(
                          icon: Icons.notifications,
                          title: 'Notifications',
                        ),
                        MenuItem(
                          icon: Icons.work_rounded,
                          title: 'Projets',
                        ),
                        MenuItem(
                          icon: Icons.format_quote_rounded,
                          title: 'FAQ',
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.black26,
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.account_tree_rounded,
                          title: 'Alumni IUT',
                        ),
                        MenuItem(
                          icon: Icons.screen_search_desktop_rounded,
                          title: 'Sigi',
                        ),
                        MenuItem(
                          icon: Icons.troubleshoot_sharp,
                          title: 'Plagiarism Dectector Tool',
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.black26,
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.logout_rounded,
                          title: 'Exit',
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: size(60, context)),
                          width: double.maxFinite,
                          // height: size(20, context),
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Copyright',
                                style: TextStyle(
                                    fontSize: taille(12, context),
                                    color: kPrimaryColor),
                              ),
                              Icon(
                                Icons.copyright_rounded,
                                color: kPrimaryColor,
                              ),
                              Text(
                                '2022 | Daily Learning',
                                style: TextStyle(
                                    fontSize: taille(12, context),
                                    color: kPrimaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.3),
                child: GestureDetector(
                  onTap: () => onIconPressed(),
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      height: 110,
                      width: 30,
                      color: sampleColorBtn,
                      alignment: Alignment.center,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_arrow,
                        progress: _animationController!.view,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black87,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                // fontFamily: 'ArialRoundedBold',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
