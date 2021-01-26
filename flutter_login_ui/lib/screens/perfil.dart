import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/base/usuario_model.dart';
import 'package:flutter_login_ui/providers/usuario_provider.dart';
//import 'package:flutter_login_ui/providers/utils.dart' as utils;
//import 'package:image_picker/image_picker.dart';
//import 'package:formvalidation/src/models/producto_model.dart';
//import 'package:flutter_login_ui/providers/anuncios_provider.dart';
//import 'package:formvalidation/src/utils/utils.dart' as utils;

class Perfil extends StatefulWidget {
  @override
  _Perfil createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final usuarioProvider = new UsuarioProvider();

  UsuarioModel usuario = new UsuarioModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    final UsuarioModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      usuario = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('formulario'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/logos/usuario.png",
                  height: 200,
                ),
                _crearNombre(),
                _crearApellidop(),
                _crearApellidom(),
                _crearemail(),
                _creargenero(),
                _crearocupacion(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: usuario.nom,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) => usuario.nom = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese su Nombre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearApellidop() {
    return TextFormField(
      initialValue: usuario.ap,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido Paterno'),
      onSaved: (value) => usuario.ap = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese su Apellido Paterno';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearApellidom() {
    return TextFormField(
      initialValue: usuario.am,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido Materno'),
      onSaved: (value) => usuario.am = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese su Apellido Materno';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearemail() {
    return TextFormField(
        initialValue: usuario.email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(labelText: 'Email'),
        onSaved: (value) => usuario.email = value,
        validator: (value) {
        if (value.length < 3) {
          return 'Ingrese su Email';
        } else {
          return null;
        }
      },);
  }

  Widget _creargenero() {
    return TextFormField(
      initialValue: usuario.gen,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Genero'),
      onSaved: (value) => usuario.gen = value,
      validator: (value)  {
        if (value.length < 3) {
          return 'Ingrese su Genero';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearocupacion() {
    return TextFormField(
      initialValue: usuario.ocu,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Ocupacion'),
      onSaved: (value) => usuario.ocu = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese su Ocupacion';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if (usuario.id == null) {
     usuarioProvider.crearProducto(usuario);
    } else {
      usuarioProvider.editarProducto(usuario);
    }

    // setState(() {_guardando = false; });
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
