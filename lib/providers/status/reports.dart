import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/status/reports/report.dart';
import 'package:silvertime/providers/auth.dart';

class Reports extends AuthProvider {
  List<Report> _reports = [];
  List<Report> get reports => _reports;

  int _pages = 0;
  int get pages => _pages;
  int _skip = 0, _limit = 20;

  Future<void> getReports ({int skip = 0, int limit = 20}) async {
    const url = "$serverURL/api/state/reports";

    Map<String, String> queryParams = {
      "skip": skip.toString(),
      "limit": limit.toString(),
    };

    _skip = skip;
    _limit = limit;
    
    try {
      final res = await http.get(
        Uri.parse(url).replace(queryParameters: queryParams), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          _reports = decoded ['reports'].map<Report> (
            (report) => Report.fromJson(report)
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

  Future<void> _getReportsInternal () => getReports (
    skip: _skip, limit: _limit
  );

  Future<Report?> getReport (String id) async {
    Report? cacheReport = reports.firstWhereOrNull(
      (element) => element.id == id
    );
    if (cacheReport != null) {
      return cacheReport;
    } 

    final url = "$serverURL/api/reports/$id/info";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          return Report.fromJson (decoded);
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

  Future<void> createReport (
    Report report, {Uint8List? bytes, String? filename}
  ) async {
    const url = "$serverURL/api/state/reports/create";

    try {
      http.MultipartRequest request = http.MultipartRequest (
        "POST", Uri.parse (url)
      );
      request.headers ["Authorization"] = auth.token!;

      request.fields.addAll(report.toJson());


      if (bytes != null && filename != null) {
        request.files.add(
          http.MultipartFile.fromBytes (
            "image",
            bytes,
            filename: filename,
          )
        );
      }

      http.StreamedResponse response = await request.send();

      http.Response res = await http.Response.fromStream (response);

      switch(res.statusCode){
        case 200:
          _getReportsInternal();
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
}