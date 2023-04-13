import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silvertime/firebase_options.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/notifications/notification.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<PushNotification> _notificationController= StreamController.broadcast();
  static Stream<PushNotification> get notifications => _notificationController.stream;

  void close () {
    _notificationController.close();
  }

  static Future<void> _notificationHandler (RemoteMessage message) async {
    NotificationsManager.instance.addNotification(message);
    _notificationController.sink.add(PushNotification.fromRemoteMessage(message));
  }

  static Future<void> _backgroundHandler( RemoteMessage message ) async {
    _notificationHandler(message);
  }

  static Future<void> _onMessageHandler( RemoteMessage message ) async {
    _notificationHandler(message);
  }

  static Future<void> _onOpenMessageHandler( RemoteMessage message ) async {
    _notificationHandler(message);
  }

  static Future<void> initializeApp() async {
    // Push Notifications
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        name: DefaultFirebaseOptions.currentPlatform.projectId,
        options: DefaultFirebaseOptions.currentPlatform
      );
    } else {
      Firebase.app();
    }
    await requestPermissions();
    token = await messaging.getToken();

    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onOpenMessageHandler );
    // Local Notifications
  }

  static requestPermissions() async {
    await messaging.requestPermission(
      alert: false,
      badge: true,
      sound: false,
      carPlay: false,
      criticalAlert: false,
      announcement: false
    );
  }

}

class NotificationsManager {
  NotificationsManager._internal () {
    loadNotifications ();
  }

  final List<PushNotification> _localNotifications = [];
  final StreamController<List<PushNotification>> _notifications = StreamController.broadcast();
  Stream<List<PushNotification>> get notificationStream => _notifications.stream;
  static final NotificationsManager _instance = NotificationsManager._internal();
  
  void close() {
    _notifications.close();
  }

  static NotificationsManager get instance {
    return _instance;
  }

  void loadNotifications() async {
    SharedPreferences prefs = locator<SharedPreferences> ();
    List<String> cacheNotifications = prefs.getStringList("notifications")??[];
    _localNotifications.clear();
    for(String notification in cacheNotifications) {
      _localNotifications.add(
        PushNotification.fromJson(json.decode(notification))
      );
    }
    _localNotifications.sort((b,a) => a.date.compareTo(b.date));
    _notifications.sink.add(_localNotifications);
  }

  void addNotification(RemoteMessage message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PushNotification newNotification = PushNotification.fromRemoteMessage(message);

    //Add to stream
    _localNotifications.add(newNotification);
    _localNotifications.sort((b,a) => a.date.compareTo(b.date));
    _notifications.sink.add(_localNotifications);

    //Save in cache
    List<String>? cacheNotifications = prefs.getStringList("notifications")??[];
    cacheNotifications.add(json.encode(
      newNotification.toJson()
    ));
    prefs.setStringList("notifications", cacheNotifications);
  }

  int getUnreadNotificationsLength({String subject = ""}) {
    bool checkForSubject (PushNotification e) => (subject.isEmpty ) || e.subject == subject;

    return _localNotifications.where((e) => !e.read && checkForSubject(e)).length;
  }

  void changeNotificationReadState(String id) {
    SharedPreferences prefs = locator<SharedPreferences>();

    _localNotifications.firstWhere((element) => element.id == id).read = true;

    prefs.setStringList("notifications",
      _localNotifications.map<String>(
        (n) => json.encode(n.toJson())
      ).toList()
    );

    _notifications.add(_localNotifications);

  }

  void changeNotificationsReadState() {
    SharedPreferences prefs = locator<SharedPreferences>();

    for(PushNotification notification in _localNotifications.where((element) => !element.read)) {
      notification.read = true;
    }

    prefs.setStringList("notifications", 
      _localNotifications.map<String>(
        (n) => json.encode(n.toJson())
      ).toList()
    );

    _notifications.add(_localNotifications);
  }

  void deleteNotification(String id) {
    SharedPreferences prefs = locator<SharedPreferences>();
    
    _localNotifications.removeWhere((element) => element.id == id);

    prefs.setStringList("notifications", 
      _localNotifications.map<String>(
        (n) => json.encode(n.toJson())
      ).toList()
    );

    _notifications.add(_localNotifications);
  }
}