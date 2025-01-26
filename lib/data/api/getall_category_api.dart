import 'package:ecommerce/constances/strings.dart';
import 'package:http/http.dart' as http;

class GetAllCategory_Api {
  static Future getallcategory() async {
    try {
      var response = await http.get(
        Uri.parse('${Strings.api}/category'),
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