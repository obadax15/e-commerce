import 'dart:convert';

import 'package:ecommerce/data/api/register_api.dart';

class Register_Repo{
static Future register(String name, String address, String phoneNumber, String email, String role, String password,
    String confirmPassword)async{

try{
  var response=await Register_Api.register(name, address, phoneNumber, email, role, password, confirmPassword);
return jsonDecode(response);
}catch (e){rethrow;}
}
}