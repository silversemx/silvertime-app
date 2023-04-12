import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/history/status_update.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/providers/auth.dart';

class ServicesProvider extends AuthProvider {
  late Services _services;

  Services get services => _services;


  void updateServices (Auth auth, Services services) {
    update (auth);
    _services = services;
  }
}

class Services extends AuthProvider {
  List<Service> _services = [];
  List<Service> get services => _services;
  Service? _service;
  Service? get service => _service;

  void dismiss () {
    unloadServices ();
    unloadService();
    // notifyListeners();
  }

  Future<void> nullCheck () async {
    int failedTimes = 0;
    while (_service == null) {
      await Future.delayed(const Duration (milliseconds: 100));

      failedTimes ++;
      if (failedTimes > 10) {
        throw HttpException("Missing service info");
      }
    }
  }

  int _pages = 0;
  int get pages => _pages;

  Future<void> getServices ({int skip = 0, int limit = 20}) async {
    const  url = "$serverURL/api/resources/services";

    Map<String, String> queryParams = {
      "skip": skip.toString(),
      "limit": limit.toString()
    };

    try {
      final res = await http.get(
        Uri.parse(url).replace(queryParameters: queryParams),
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          _services = decoded['services'].map<Service> (
            (service) => Service.fromJson(service)
          ).toList();
          if (limit > 0) {
            _pages = (decoded ['count'] / limit).ceil ();
          } else {
            _pages = 1;
          }
        break;
        default:
          throw HttpException(
            res.body, route: url, code: Code.request, status: res.statusCode
          );
      }
      notifyListeners();
    } on HttpException {
      rethrow;
    } catch (error, bt) {
      if(runtime == "Development"){
        Completer().completeError(error, bt);
      }
      throw HttpException(error.toString(), code: Code.system, route: url);
    }
  }

  void unloadServices () => _services = [];

  void sort (int filter, int sort) {
    if(filter == 0) {
      _services.sort((a,b) => a.name.compareTo(b.name) * sort);
    } else if (filter == 1) {
      _services.sort(
        (a,b) => a.date.compareTo(b.date) * sort
      );
    }
    notifyListeners();
  }

  Future<Service?> getService (String id) async {
    Service? cacheService = services.firstWhereOrNull((element) => element.id == id);

    if (cacheService != null) {
      _service = cacheService;
      notifyListeners();
      return cacheService;
    }

    final url = "$serverURL/api/resources/services/$id/info";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          _service = Service.fromJson(decoded);
          notifyListeners();
          return _service;
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

  void unloadService () => _service = null;

  Future<List<StatusUpdate<ServiceStatus>>> getServiceStatusHistory (
    String? service
  ) async {
    final url = "$serverURL/api/resources/services/$service/history";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          return decoded.map<StatusUpdate<ServiceStatus>> (
            (statusUpdate) => StatusUpdate.fromJson(
              statusUpdate, ServiceStatus.values
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