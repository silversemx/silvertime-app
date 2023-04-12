import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/resources/service/service_instance.dart';
import 'package:silvertime/providers/resources/services/services.dart';

class ServiceInstances extends ServicesProvider {
  List<ServiceInstance> _instances = [];
  List<ServiceInstance> get instances => _instances;
  
  int _pages = 0;
  int get pages => _pages;

  void dismiss () {
    _instances = [];
  }

  Future<void> getInstances ({String? service, int skip = 0, int limit = 20}) async {
    if (service == null) {
      await services.nullCheck();
    }
    
    String url = "$serverURL/api/resources/instances?service=${
      service ?? services.service?.id
    }";

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
          _instances = decoded["instances"].map<ServiceInstance>(
            (instance) => ServiceInstance.fromJson(instance)
          ).toList ();
          if (limit > 0) {
            _pages = (decoded ["count"] / limit).ceil ();
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
  void unloadInstances () => _instances = [];

 
}