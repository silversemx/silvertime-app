import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/history/status_update.dart';
import 'package:silvertime/models/status/maintenance/maintenance.dart';
import 'package:silvertime/providers/auth.dart';

class Maintenances extends AuthProvider {
  List<Maintenance> _maintenances = [];
  List<Maintenance> get maintenances => _maintenances;

  void dismiss () {
    _maintenances = [];
  }

  int _pages = 0;
  int get pages => _pages;

  Future<void> getMaintenances ({int skip = 0, int limit = 20}) async {
    const url = "$serverURL/api/state/maintenances";

    Map<String, String> queryParams = {
      "skip": skip.toString(),
      "limit": limit.toString(),
    };

    try {
      final res = await http.get(
        Uri.parse(url).replace(queryParameters: queryParams), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          _maintenances = decoded ['maintenances'].map<Maintenance> (
            (maintenance) => Maintenance.fromJson(maintenance)
          ).toList ();

          if (limit > 0) {
            _pages = (decoded ['count'] / limit).ceil ();
          } else {
            _pages = 1;
          }
          notifyListeners();
        break;
        default:
          throw HttpException(
            res.body, code: Code.request, status: res.statusCode, route: url
          );
      }
    } on HttpException {
      rethrow;
    } catch (error, bt) {
      if(runtime == "Development"){
        Completer().completeError(error, bt);
      }
      throw HttpException(error.toString(), code: Code.system, route: url);
    }
  }

  Future<List<StatusUpdate<MaintenanceStatus>>> getMaintenanceStatusHistory (
    String id
  ) async {
    final url = "$serverURL/api/state/maintenances/$id/status/history";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          return decoded.map<StatusUpdate<MaintenanceStatus>> (
            (statusUpdate) => StatusUpdate.fromJson(
              statusUpdate, MaintenanceStatus.values
            )
          ).toList ();
        default:
          throw HttpException(
            res.body, route: url, code: Code.request, status: res.statusCode
          );
      }
    } on HttpException {
      rethrow;
    } catch (error, bt) {
      if(runtime == "Development"){
        Completer().completeError(error, bt);
      }
      throw HttpException(error.toString(), code: Code.system, route: url);
    }
  }
}