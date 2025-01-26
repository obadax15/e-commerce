import 'dart:convert';

import 'package:ecommerce/constances/strings.dart';
import 'package:http/http.dart' as http;

class LogIn_Api {
  static Future login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('${Strings.api}/user/login'),
        headers: {
          "Accept": "*/*",
          'Content-Type': 'application/json',
        },
      body: jsonEncode({'email': email, 'password': password})
      );
      print(response.body);
      if(response.statusCode==200){
        return response.body;
      }
      
    } catch (e) {
      rethrow;
    }
  }
}
