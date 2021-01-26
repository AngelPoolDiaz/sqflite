/*import 'package:flutter_login_ui/base/producto_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';



class AnuncioProvider {
  String _apikey = 'roomitum';
  String _url = 'https://roomitum-default-rtdb.firebaseio.com';
  String _language = 'es-ES';

  Future<List<ProductoModel>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new ProductosModel.fromJsonList(decodedData['results']);

    return peliculas.items;
  }


  Future<List<ProductoModel>>buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/roomitum',
        {'api_key': _apikey, 'language': _language, 'query': query});

    return await _procesarRespuesta(url);
  }
}
*/