import 'dart:convert';
import 'package:ecommerce/data/api/login_api.dart';

class LogIn_Repo {
  static Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      // Make the API call using LogIn_Api
      var response = await LogIn_Api.login(email, password);

      // Print raw response for debugging
      print('Raw response from API: $response');

      // Check if the response is null
      if (response != null) {
        // Decode the response
        var decodedResponse = jsonDecode(response);

        // Print decoded response for debugging
        print('Decoded response: $decodedResponse');

        // Return the decoded JSON as a Map
        return decodedResponse;
      } else {
        print('Error: Response from API is null');
        return null;
      }

    } catch (e) {
      print('Error during login: $e');
      return null;  // Return null in case of an error
    }
  }
}
