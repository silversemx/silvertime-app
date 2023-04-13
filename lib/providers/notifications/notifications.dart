import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/notifications/notification_subject.dart';
import 'package:silvertime/providers/auth.dart';

class Notifications extends AuthProvider {
  List<NotificationSubject> _subjects = [];
  List<NotificationSubject> get subjects => _subjects;

  Future<List<NotificationSubject>> getSubjects () async {
    Map<String, String> queryParams = {};
    const url = "$serverURL/api/notifications/subjects?skip=0&limit=1000";

    // queryParams ["organization"] = auth.userValues!.organization;
    
    try {
      final res = await http.get(Uri.parse(url).replace (queryParameters: queryParams), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          _subjects = decoded ["subjects"].map<NotificationSubject> ((subject) => NotificationSubject.fromJson(subject)).toList ();
          notifyListeners();

          return _subjects;
        default:
          throw HttpException(res.body, code: Code.request, status: res.statusCode);
      }
    } on HttpException {
      rethrow;
    } catch (error, bt) {
      if(runtime == "Development"){
        Completer().completeError(error, bt);
      }
      throw HttpException(error.toString(), code: Code.system);
    }
  }

  Future<NotificationSubject?> getSubject (String id) async {
    final url = "$serverURL/api/notifications/subjects/$id/info";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          return NotificationSubject.fromJson(decoded);
        default:
          throw HttpException(res.body, code: Code.request, status: res.statusCode);
      }
    } on HttpException {
      rethrow;
    } catch (error, bt) {
      if(runtime == "Development"){
        Completer().completeError(error, bt);
      }
      throw HttpException(error.toString(), code: Code.system);
    }
  }
}