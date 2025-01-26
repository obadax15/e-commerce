import 'dart:convert';

import 'package:ecommerce/data/api/get_fav_api.dart';

class GetFavRepo {
  static Future getfav() async {
    try {
      var response = await Get_Fav_Api.getfav();

      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
  static Future addproducttofav(String id)async{
    try{
      var response=await Get_Fav_Api.addproducttofav(id);
      return jsonDecode(response);
    }catch(e){rethrow;}

  }
}
