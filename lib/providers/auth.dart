import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:http_request_utils/body_utils.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/user/auth.dart';
import 'package:silvertime/models/user/user.dart';

class AuthProvider extends ChangeNotifier {
  late Auth _auth;

  Auth get auth => _auth;

  void update (Auth auth) {
    _auth = auth;
  }
}

class Auth extends ChangeNotifier {
  String? _token;
  bool get isAuth => _token != null;

  String? get token => _token;

  User? _userValues;
  User? get userValues => _userValues;
  bool _checkingAccess = false;

  Future<void> checkToken() async {
    if(token == null) {
      return;
    }
    const url = "$serverURL/api/users/auth";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": token!}
      );
    
      switch(res.statusCode){
        case 401:
          locator<SharedPreferences>().remove (jwtKey);
          _token = null;
          _userValues = null;
          notifyListeners();
        break;

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

  Future<void> checkAccess () async {
    if (_checkingAccess) {
      return;
    }
    _checkingAccess = true;
    const url = "$serverURL/api/apps/access?app=$alias";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": token!}
      );

      _checkingAccess = false;
    
      switch(res.statusCode){
        case 200:
        break;
        default:
          printWarning ("Not authorized, redirecting!");
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

  void _setToken(String body) {
    final decoded = json.decode(body);
    _token = decoded["token"];
    if(_token != null){
      Map<String, dynamic> values = Jwt.parseJwt(_token!);
      _userValues = User.fromToken(values);
      SharedPreferences prefs = locator<SharedPreferences>();
      prefs.setString(jwtKey, _token!);
    }
  }

  bool tryAutoLogin() {
    _token = locator<SharedPreferences>().getString (jwtKey);
    if (_token == null && forcedBearerToken.isNotEmpty) {
      _token = "Bearer $forcedBearerToken";
      locator<SharedPreferences>().setString (jwtKey, _token!);
    }
    
    if(_token == null) {
      return false;
    }

    printSuccess("Authenticated");
    _userValues = User.fromToken(Jwt.parseJwt(_token!));
    // checkAccess();

    return true;
  }

  Future<void> sendFirebase() async {
    const url =  "$serverURL/api/users/firebase";

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    
    try {
      final res = await http.post(Uri.parse(url), 
        headers: {"Authorization": token!},
        body: json.encode({
          "firebase": await messaging.getToken()
        })
      );
    
      switch(res.statusCode){
        case 200:
        break;
        default:
          throw HttpException(res.body, status: res.statusCode, code: Code.request);
      }
      notifyListeners();
    } on HttpException {
      rethrow;
    } catch (error) {
      throw HttpException(error.toString(), code: Code.system);
    }
  }

  Future<void> login (AuthInfo authInfo) async {
    const url = "$serverURL/api/users/login";
    
    try {
      final res = await http.post(
        Uri.parse(url),
        body: json.encode (
          authInfo.toJsonLogin()
        )
      );
    
      switch(res.statusCode){
        case 200:
          _setToken (res.body);
          await sendFirebase();
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

  Future<void> getInfo([String? id]) async {
    final url = "$serverURL/api/users/${id??_userValues?.id??"NoId"}/info";

    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": token!}
      );
    
      switch(res.statusCode){
        case 200:
          final decoded = json.decode(res.body);
          _userValues = User.fromJson(decoded);
          notifyListeners();
        break;
        default:
          throw HttpException(
            res.body, route: url, status: res.statusCode, code: Code.request
          );
      }
    } on HttpException {
      rethrow;
    } catch (error) {
      throw HttpException(error.toString(), code: Code.system, route: url);
    }
  }

  Future<void> _internalLogout () async {
    const url = "$serverURL/api/users/logout";
    
    try {
      final res = await http.get(Uri.parse(url), 
        headers: {"Authorization": token!}
      );
    
      switch(res.statusCode){
        case 200:
        break;
        default:
          //ERROR LOGGING OUT
        break;
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

  void logout () async{
    await _internalLogout();
    locator<SharedPreferences>().remove (jwtKey);
  }

}