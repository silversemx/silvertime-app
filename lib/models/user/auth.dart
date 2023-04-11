
import 'package:diacritic/diacritic.dart';
import 'package:flutter_work_utils/flutter_utils.dart';

class AuthInfo {
  String _email = "";
  String get email => _email;
  String _password = "";
  String get password => _password;
  String _confirmPassword = "";
  String get confirmPassword => _confirmPassword;

  set email (String email) {
    _email = removeDiacritics(email.toLowerCase()).replaceAll(RegExp(r"\s+"), "");
  }

  set password (String password) {
    _password = password.diggest;
  }

  set confirmPassword(String password) {
    _confirmPassword = password.diggest;
  }

  AuthInfo.empty();

  Map<String, dynamic> toJsonSignup(){
    return {
      "email": email,
      "password": password,
      "confirm": confirmPassword
    };
  }

  Map<String, dynamic> toJsonLogin(){
    return {
      "email": email,
      "password": password,
    };
  }
}