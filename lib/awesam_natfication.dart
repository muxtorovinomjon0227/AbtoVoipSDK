import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class FirebaseService {
  Future<void> firebaseNetificationDesign();
  Future<void> bacgroundHendler(String phone);
  Future<void> sendPushFromDevice(String title, String body, String toToken);
  Future<void> getTokenFirebase();
  Future<void> awesamListner();
  Future<void> onOppenApp();
  Future<void> userInitAndRegisterSip();
}

class FirebaseMain extends FirebaseService {

  @override
  Future<void> firebaseNetificationDesign() async {
    AwesomeNotifications().initialize(
        'resource://drawable/notification_icon_push',
        [
          NotificationChannel(
            channelKey: "call_channel",
            channelName: "Call Channel",
            channelDescription: "Channel of calling",
            defaultColor: Colors.red,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            locked: true,
            defaultRingtoneType: DefaultRingtoneType.Ringtone,
            playSound: true,
            icon: 'resource://drawable/notification_icon_push',
          )
        ],
        debug: true);
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  Future<void> bacgroundHendler(String phone) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 123213,
        channelKey: 'call_channel',
        title: "AloVoice",
        body: phone.toString(),
        wakeUpScreen: true,
        fullScreenIntent: true,
        autoDismissible: false,
        category: NotificationCategory.Call,
        locked: true,
        displayOnForeground: true,
        icon: "resource://drawable/notification_icon_push",
        displayOnBackground: true,
      ),
      actionButtons: [
        NotificationActionButton(
            isDangerousOption: true,
            key: 'REJECT',
            label: 'Reject',
            color: Colors.red),
        NotificationActionButton(
            key: 'ACCEPT', label: 'Accept', color: Colors.green),
      ],
    );
  }

  @override
  Future<void> sendPushFromDevice(
      String title, String body, String toToken) async {
    try {
      http.Response response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
          'key=AAAAxi0OIhY:APA91bFBKh4b2JkndnJ3aRi_SzHQLHPYPJ12kkuZUcYvSEDpnX9wmaRi2pp5kZQ9NFn6RPHOQF04vFRsUWen3hp3PK8eve-mI-Vv-ws5DA2Z73dcyskvAeayKFW04udWVW3WXtgmXiPf',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": toToken
          },
        ),
      );
      response;
    } catch (e) {
      e;
    }
  }

  @override
  Future<void> getTokenFirebase() async {
    String? token = await FirebaseMessaging.instance.getToken();
  }


  @override
  Future<void> awesamListner() async {
  }

  @override
  Future<void> onOppenApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }

  @override
  Future<void> userInitAndRegisterSip() async {
  }
}
