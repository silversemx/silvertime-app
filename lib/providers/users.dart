import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/user/user.dart';
import 'package:silvertime/providers/auth.dart';

class Users extends AuthProvider {
  List<User> _users = [];
  List<User> get users => _users;

  int _userPages = 0;
  int get userPages => _userPages;

  Future<void> getUsers ({
    int skip = 0, int limit = 20,
    UserStatus? status, String? role
  }) async {
    const url = "$serverURL/api/users";
    
    Map<String, String> queryParams = {
      "skip": skip.toString(),
      "limit": limit.toString()
    };

    if (status != null) {
      queryParams ['status'] = status.index.toString();
    }
    if (role != null) {
      queryParams ['role'] = role;
    }

    try {
      final res = await http.get(
        Uri.parse(url).replace(
          queryParameters: queryParams
        ), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          _users = decoded ['users'].map<User> (
            (user) => User.fromJson (user)
          ).toList ();

          if (limit > 0) {
            _userPages = (decoded ['count'] / limit).ceil ();
          } else {
            _userPages = 1;
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

  Future<User?> getUser (String? id) async {
    final url = "$serverURL/api/users/$id/info";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": auth.token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          return User.fromJson (decoded);
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