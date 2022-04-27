import 'package:flutter/material.dart';
import 'package:iut_companion/Screens/Tabs/components/notifications/notification_Api.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/Screens/Tabs/new_screen.dart';
import 'package:iut_companion/constants.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();

    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => NewScreen(),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => NotificationApi.showNotification(
                title: 'Joachim Nedaouka',
                body: "Hey! I'm your companion",
                payload: 'Ndam Njoya',
              ),
              child: Text(
                'Simple notification',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'OpenSans_Regular',
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor,
                // elevation: 0,
              ),
            ),
          ),
        ),
      );
}
