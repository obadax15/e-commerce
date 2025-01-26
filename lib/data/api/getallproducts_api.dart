import 'package:ecommerce/constances/strings.dart';
import 'package:http/http.dart' as http;

class GetAllProduct_Api {
  static Future getallproduct() async {
    try {
      var response = await http.get(
          Uri.parse('${Strings.api}/product'),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "*/*",

          }
      );
      print(response.body) ;
      if (response.statusCode==200) {
        print(response.body);

        return response.body ;
      }
    }catch(e){rethrow;}
  }

}class GetProductByCategory_Api {
  static Future getproductbycategory(int id) async {
    try {
      var response = await http.get(
          Uri.parse('${Strings.api}/product/${id}'),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "*/*",

          }
      );
      print(response.body) ;
      if (response.statusCode==200) {
print(response.body);
        return response.body ;
      }
    }catch(e){rethrow;}
  }

}class GetProductById_Api {
  static Future getproductbyId(int id) async {
    try {
      var response = await http.get(
          Uri.parse('${Strings.api}/product/byid/${id}'),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "*/*",

          }
      );
      print(response.body) ;
      if (response.statusCode==200) {
print(response.body);
        return response.body ;
      }
    }catch(e){rethrow;}
  }

}