import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRepository {
  //make future function to create post request for authentication api in http://10.0.2.2:1337/api/auth/local
  Future<String> authenticate(String identifier, String password) async {
    //make the response variable
    //make the post request
    final response = await http.post(
      Uri.parse('http://10.0.2.2:1337/api/auth/local'),
      //add header
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'identifier': identifier,
        'password': password,
      }),
    );
    //print response body
    print(response.body);

    //add checking for the response
    if (response.statusCode == 200) {
      //return the response body
      return "Login Success";
    } else {
      //return the error message
      throw Exception('Failed to authenticate');
    }
  }
}
