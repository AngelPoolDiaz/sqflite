import 'dart:convert';
//import 'dart:io';
import 'package:flutter_login_ui/base/usuario_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'package:http_parser/http_parser.dart';
//import 'package:mime_type/mime_type.dart';
//import 'dart:async';

class UsuarioProvider {
  String _url = 'https://roomitum-default-rtdb.firebaseio.com';
  

  

  Future<bool> crearProducto(UsuarioModel usuario) async {
    final url = '$_url/usuario.json';

    final resp = await http.post(url, body: usuarioModelToJson(usuario));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarProducto(UsuarioModel usuario) async {
    final url = '$_url/usuario/${usuario.id}.json';

    final resp = await http.put(url, body: usuarioModelToJson(usuario));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<UsuarioModel>> cargarProductos() async {
    final url = '$_url/usuario.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<UsuarioModel> productos = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = UsuarioModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
    });

    // print( productos[0].id );

    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/usuario/$id.json';
    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }

 
}
