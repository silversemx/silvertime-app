import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';

class PushNotification {
  String id = "";
  String subject = "";
  String title = "";
  String body = "";
  String? imageUrl;
  bool read = false;
  Map<String, dynamic> data = {};
  DateTime date = DateTime.now ();
  DateTime sentDate = DateTime.now ();

  PushNotification ({
    required this.id,
    required this.subject,
    required this.title,
    required this.body,
    required this.data,
    this.imageUrl,
    required this.read,
    required this.date,
    required this.sentDate
  });

  factory PushNotification.fromJson (dynamic json) {
    return PushNotification (
      id: jsonField<String> (json, ["id"], nullable: false),
      subject: jsonField<String> (json, ["subject"], nullable: false),
      title: jsonField<String> (json, ["title",],  nullable: false),
      body: jsonField<String> (json, ["body"],  nullable: false),
      imageUrl: jsonField<String> (json, ["image",]),
      read: jsonField<bool> (json, ["read",], defaultValue: false),
      data: json ["data"] ?? {},
      date: DateTime.fromMillisecondsSinceEpoch(jsonField<int> (json, ["date"])),
      sentDate: dateTimefromMillisecondsNoZero(
        jsonField<int> (json, ["sent_date",],),
        defaultNow: true
      )!
    );
  }

  factory PushNotification.fromRemoteMessage (RemoteMessage message) {
    return PushNotification (
      id: jsonField<String> (message.data, ["id",], defaultValue: "No_id"),
      subject:  jsonField<String> (message.data, ["subject",], defaultValue: "No_subject"),
      title: message.notification?.title ?? "No Title",
      body: message.notification?.body ?? "No body",
      data: message.data,
      imageUrl: jsonField<String> (message.data, ["image",]),
      read: false,
      date: DateTime.now (),
      sentDate: dateTimefromMillisecondsNoZero(
        jsonField<int> (message.data, ["sent_date",]),
        defaultNow: true
      )!
    );
  }

  String? get image {
    if (imageUrl != null) {
      return serverURL + imageUrl!;
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson () {
    return {
      "id": id,
      "subject": subject,
      "title": title,
      "read": read,
      "body": body,
      "date": date.millisecondsSinceEpoch,
      "sent_date": sentDate.millisecondsSinceEpoch,
      "data": data
    };
  }
}