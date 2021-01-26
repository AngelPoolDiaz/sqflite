//     final productoModel = productoModelFromJson(jsonString);
import 'dart:convert';
//import 'package:flutter/services.dart';
class ProductosModel {

  List<ProductoModel> items = new List();

  ProductosModel();

  ProductosModel.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final anuncio = new ProductoModel.fromJson(item);
      items.add( anuncio );
    }

  }

}

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {

    String id;
    String nom;
    String tip;
    String per;
    String habi;
    String banos;
    String direc;
    String ciu;
    String post;
    String extr;
    String fotoUrl;
    ProductoModel({
        this.id,
        this.nom = '',
        this.tip  = '',
        this.per = '',
        this.habi = '',
        this.banos  = '',
        this.direc = '',
        this.ciu = '',
        this.post  = '',
        this.extr = '',
        this.fotoUrl,
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => new ProductoModel(
        id         : json["id"],
        nom     : json["nom"],
        tip      : json["tip"],
        per : json["per"],
        habi     : json["habi"],
        banos      : json["banos"],
        direc : json["direc"],
        ciu     : json["ciu"],
        post      : json["post"],
        extr : json["extr"],
        fotoUrl    : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        // "id"         : id,
        "nom"     : nom,
        "tip"      : tip,
        "per" : per,
        "habi"     : habi,
        "banos"      : banos,
        "direc" : direc,
        "ciu"     : ciu,
        "post"      : post,
        "extr" : extr,
        "fotoUrl"    : fotoUrl,
  };
getPosterImg() {

    if ( fotoUrl == null ) {
      return 'assets/no-image.png';
    } else {
      return '$fotoUrl';
    }

  }
}