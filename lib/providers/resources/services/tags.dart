import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/resources/service/service_tag.dart';
import 'package:silvertime/providers/resources/services/services.dart';

class ServiceTags extends ServicesProvider {
  List<ServiceTag> _tags = [];
  List<ServiceTag> get tags => _tags;

  int _pages = 0;
  int get pages => _pages;

  void dismiss () {
    unloadTags();
  }

  Future<void> getServiceTags ({int skip = 0, int limit = 20}) async {
    const url = "$serverURL/api/resources/tags";

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
          _tags = decoded["tags"].map<ServiceTag> (
            (tag) => ServiceTag.fromJson (tag)
          ).toList ();
          
          if (limit > 0) {
            _pages = (decoded ['count'] / limit).ceil ();
          } else {
            _pages = 1;
          }
        break;
        default:
          throw HttpException (
            res.body, code: Code.request, status: res.statusCode, route: url
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

  void unloadTags () => _tags = [];
}