/*import 'dart:convert';
import 'package:flutter_login_ui/base/producto_model.dart';
import 'package:http/http.dart' as http;

 
class Services {
  static const String url = 'https://roomitum-default-rtdb.firebaseio.com/producto';
 
  static Future<List<ProductoModel>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<ProductoModel> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
 
  static List<ProductoModel> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ProductoModel>((json) => ProductoModel.fromJson(json)).toList();
  }
}
*/