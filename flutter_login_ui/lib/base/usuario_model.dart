//     final productoModel = productoModelFromJson(jsonString);
import 'dart:convert';
//import 'package:flutter/services.dart';
class UsuariosModel {

  List<UsuarioModel> items = new List();

  UsuariosModel();

  UsuariosModel.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final anuncio = new UsuarioModel.fromJson(item);
      items.add( anuncio );
    }

  }

}

UsuarioModel  usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {

    String id;
    String nom;
    String ap;
    String am;
    String email;
    String gen;
    String ocu;
   
    UsuarioModel({
        this.id,
        this.nom = '',
        this.ap  = '',
        this.am = '',
        this.email = '',
        this.gen = '',
        this.ocu = '',
        
    });

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => new UsuarioModel(
        id         : json["id"],
        nom     : json["nom"],
        ap      : json["ap"],
        am : json["am"],
        email     : json["email"],
        gen      : json["gen"],
        ocu      : json["ocu"],
       
    );

    Map<String, dynamic> toJson() => {
        // "id"         : id,
        "nom"     : nom,
        "ap"      : ap,
        "am" : am,
        "email"     : email,
        "gen"      : gen,
        "ocu" : ocu,
        
  };

}