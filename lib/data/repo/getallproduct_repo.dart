
import 'dart:convert';

import 'package:ecommerce/data/api/getall_category_api.dart';
import 'package:ecommerce/data/api/getallproducts_api.dart';

class GetAllProduct_Repo{
  static Future getallproduct()async{
    try{
      var response=await GetAllProduct_Api.getallproduct();

      return jsonDecode(response);
    }catch(e){
      rethrow;
    }
  }

}class GetProductByCategory_Repo{
  static Future getproductbycategory(int id)async{
    try{
      var response=await GetProductByCategory_Api.getproductbycategory(id);

      return jsonDecode(response);
    }catch(e){
      rethrow;
    }
  }

}class GetProductById_Repo{
  static Future getproductbyId(int id)async{
    try{
      var response=await GetProductById_Api.getproductbyId(id);

      return jsonDecode(response);
    }catch(e){
      rethrow;
    }
  }

}