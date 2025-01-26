
import 'dart:convert';

import 'package:ecommerce/data/api/getall_category_api.dart';

class GetAllCategory_Repo{
  static Future getallcategory()async{
    try{
      var response=await GetAllCategory_Api.getallcategory();

      return jsonDecode(response);
    }catch(e){
      rethrow;
    }
  }

}