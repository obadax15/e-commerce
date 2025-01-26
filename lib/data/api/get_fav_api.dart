import 'dart:convert';

import 'package:ecommerce/constances/strings.dart';
import 'package:ecommerce/constances/token.dart';
import 'package:http/http.dart' as http;

class Get_Fav_Api {
  static Future getfav() async {
    try {
      var response = await http.get(Uri.parse('${Strings.api}/favorite'), headers: {
        'Content-Type': 'application/json',
        "Accept": "*/*",
        'token': Token.token,
      });
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);

        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future addproducttofav(String id) async {
    try {
      var response = await http.post(
        Uri.parse('${Strings.api}/favorite/${id}'),
        headers: {
          'Content-Type': 'application/json',
          "Accept": "*/*",
          'token': Token.token,
        },
        body: jsonEncode({'id': id}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
