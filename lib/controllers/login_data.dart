import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginData {
  var status;
  String token;
  static String baseUrl = 'http://ipda3-tech.com/blood-bank/api/v1';
  var data;

  void loginData(String email, String password) async {
    String url = '$baseUrl/login';
    http.Response response = await http.post(url, body: {
      'phone': email,
      'password': password,
    }, headers: {
      "Accept": "application/json"
    });

    data = jsonDecode(response.body);
//    var stat = response.statusCode;
    status = data['msg'];
    try {
      if (status == 'بيانات الدخول غير صحيحة') {
        print('failed login');
      } else {
        String token = data['data']['api_token'];
        print('token is : $token');
        _save(token);
      }
    } catch (e) {
      print('error Login: ${throw Exception(e)}');
    }
  }

  _save(var token) async {
    final pref = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    pref.setString(key, value);
  }

  read() async {
    final pref = await SharedPreferences.getInstance();
    final key = 'token';
    final value = pref.get(key) ?? 0;
    print(' token value in read fun : $value');
  }
}

//Future registerData(
//    String name,
//    String email,
//    String birthDate,
//    String phone,
//    String donationLastDate,
//    String password,
//    String passwordConfirmation,
//    ) async {
//  String url = '$baseUrl/signup';
//  http.Response response = await http.post(url, body: {
//    'name': name,
//    'email': email,
//    'birth_date': birthDate,
//    'phone': phone,
//    'donation_last_date': donationLastDate,
//    'password': password,
//    'password_confirmation': passwordConfirmation,
//  });
//
//  var data = jsonDecode(response.body);
//  status = data['msg'];
//  print('login data : $data');
//  print('json status : ${response.statusCode}');
//  if (status == 'بيانات الدخول غير صحيحة') {
//    print('failed login');
//  } else {
//    String token = data['data']['api_token'];
//    print('token is : $token');
//    _save(token);
//  }
//}
