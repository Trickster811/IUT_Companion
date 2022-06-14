import 'dart:async';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
// import 'package:image/image.dart' as image;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails(
    String bigPicturePath,
    String largeIconPath,
  ) async {
    // final String largeIconPath = await _downloadAndSaveFile(
    //     'https://firebasestorage.googleapis.com/v0/b/iut-companion-nedaoukajoachim0.appspot.com/o/logo_iut.png?alt=media&token=540d7665-364f-4096-8d03-a601295fd36c',
    //     'largeIcon');
    // final String bigPicturePath = await _downloadAndSaveFile(
    //     'https://firebasestorage.googleapis.com/v0/b/iut-companion-nedaoukajoachim0.appspot.com/o/340971-things-to-consider-when-looking-for-a-web-design-agency.jpg?alt=media&token=4308e45e-0ca9-4d35-a055-728ec9a37939',
    //     'bigPicture');

    final sound = 'iut_companion_notification_sound.wav';

    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          channelDescription: 'channel description',
          styleInformation: BigPictureStyleInformation(
            FilePathAndroidBitmap(bigPicturePath),
            largeIcon: FilePathAndroidBitmap(largeIconPath),
          ),
          // playSound: true,
          sound: RawResourceAndroidNotificationSound(sound.split('.').first),
          importance: Importance.max,
          fullScreenIntent: true,
          priority: Priority.high,
          ticker: 'ticker'),
      iOS: IOSNotificationDetails(
        // presentSound: true,
        sound: sound,
      ),
    );
  }

  static Future init({bool initSheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    // When app is closed
    final details = await _notifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }
    // When app is open
    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );
  }

  static Future showNotification({
    required int id,
    required String? title,
    required String? body,
    required String? payload,
    // required final  bigPicturePath,
    // required final largeIconPath,
  }) async {
    final bigPicturePath = await _downloadAndSaveFile(
        'https://firebasestorage.googleapis.com/v0/b/iut-companion-nedaoukajoachim0.appspot.com/o/notifications_images%2FScreenshot%20from%202022-05-20%2019-11-17.png?alt=media&token=ec5fb3ed-7a55-4d76-afe0-f9ca73cebb21',
        'bigPicture');
        final largeIconPath = await _downloadAndSaveFile(
        'https://firebasestorage.googleapis.com/v0/b/iut-companion-nedaoukajoachim0.appspot.com/o/notifications_images%2FScreenshot%20from%202022-05-20%2019-11-17.png?alt=media&token=ec5fb3ed-7a55-4d76-afe0-f9ca73cebb21',
        'largeIcon');
    _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(bigPicturePath, largeIconPath),
      payload: payload,
    );
  }
}

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final http.Response response = await http.get(Uri.parse(url));
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}
