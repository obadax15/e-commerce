import 'dart:convert';

import 'package:ecommerce/constances/strings.dart';
import 'package:http/http.dart'as http;
class Register_Api {
  static Future register(String name, String address, String phoneNumber, String email, String role, String password,
      String confirmPassword) async {
    try {
var respone =await http.post(
  Uri.parse("${Strings.api}/user/register"),
headers:
{
  "Accept": "application/json",
  'Content-Type': 'application/json',
},
  body: jsonEncode({

            'name': name,
    'address':address,
    'phoneNumber':phoneNumber,
    'email':email,
    'role':role,
    'password':password,
    'password_confirmation':confirmPassword,
          })
);
print(respone.body);
if(respone.statusCode==200){
  return respone.body;
}
    }

    catch (e) {
      rethrow;
    }
  }
}
