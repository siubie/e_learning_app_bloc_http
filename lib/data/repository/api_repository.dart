import 'dart:convert';

import 'package:e_learning/data/response/login_response/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiRepository {
  //make future function to create post request for authentication api in http://10.0.2.2:1337/api/auth/local
  Future<LoginResponse> authenticate(String identifier, String password) async {
    //make the response variable
    //make the post request
    final response = await http.post(
      // kalo mau konek pake emulator
      // Uri.parse('http://10.0.2.2:1337/api/auth/local'),
      //kalo mau konek pake chrome
      Uri.parse('http://192.168.1.114:1337/api/auth/local'),
      //add header
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'identifier': identifier,
        'password': password,
      }),
    );

    //add checking for the response
    if (response.statusCode == 200) {
      //return the response body
      return LoginResponse.fromJson(response.body);
    } else {
      //return the error message
      throw Exception('Failed to authenticate');
    }
  }

  //make future function to set the token in shared preferences
  Future<void> saveTokenToPrefs(String token) async {
    //get shared preferences instance
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  //make future function to get the token from shared preferences
  Future<String?> getTokenFromPrefs() async {
    //get shared preferences instance
    final prefs = await SharedPreferences.getInstance();
    //get the token
    return prefs.getString('token');
  }
}
