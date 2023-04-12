import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/overview/overview.dart';
import 'package:silvertime/providers/auth.dart';

class Overviews extends AuthProvider {
  DateTimeRange range = DateTimeRange (
    end: DateTime.now (),
    start: DateTime.now ().subtract (
      const Duration (days: 30)
    )
  );

  Future<Overview> getOverviewState (
    String service
  ) async {
    const url = "$serverURL/api/state/overview";

    Map<String, String> queryParams = {
      "service": service,
      "start": range.start.millisecondsSinceEpoch.toString(),
      "end": range.end.millisecondsSinceEpoch.toString()
    };
    
    try {
      final res = await http.get(
        Uri.parse(url).replace(queryParameters: queryParams), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          return Overview.fromJson (decoded);
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
}