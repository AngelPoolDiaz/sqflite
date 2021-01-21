import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/base/producto_model.dart';
import 'package:flutter_login_ui/providers/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';


//import 'package:formvalidation/src/models/producto_model.dart';
import 'package:flutter_login_ui/providers/anuncios_provider.dart';
//import 'package:formvalidation/src/utils/utils.dart' as utils;


class Formulario extends StatefulWidget {

  @override
  _Formulario createState() => _Formulario();
}

class _Formulario extends State<Formulario> {
  
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final anunciosProvider = new AnunciosProvider();

  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if ( prodData != null ) {
      producto = prodData;
    }
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('formulario'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.photo_size_select_actual ),
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon( Icons.camera_alt ),
            onPressed: _tomarFoto,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPropiedad(),
                _crearPersonas(),
                _crearHabitacion(),
                _crearBanos(),
                _crearDireccion(),
                _crearCiudad(),
                _crearCodigo(),
                _crearExtras(),
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
      initialValue: producto.nom,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre'
      ),
      onSaved: (value) => producto.nom = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre de la propiedad';
        } else {
          return null;
        }
      },
    );

  }

  Widget _crearCiudad() {

    return TextFormField(
      initialValue: producto.ciu,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Ciudad'
      ),
      onSaved: (value) => producto.ciu = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre dela  ciudad';
        } else {
          return null;
        }
      },
    );

  }
  Widget _crearExtras() {

    return TextFormField(
      initialValue: producto.extr,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Extras'
      ),
      onSaved: (value) => producto.extr = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );

  }

  Widget _crearHabitacion() {
    return TextFormField(
      initialValue: producto.habi,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'N° de Habitaciones'
      ),
      onSaved: (value) => producto.habi = value,
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }
 
 Widget _crearPersonas() {
    return TextFormField(
      initialValue: producto.per,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Capacidad de Personas'
      ),
      onSaved: (value) => producto.per= value,
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }

Widget _crearCodigo() {
    return TextFormField(
      initialValue: producto.post,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Codigo Postal'
      ),
      onSaved: (value) => producto.post = value,
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }

  Widget _crearPropiedad() {

    return TextFormField(
      initialValue: producto.tip,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Tipo de propiedad'
      ),
      onSaved: (value) => producto.tip = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );

  }
   Widget _crearDireccion() {

    return TextFormField(
      initialValue: producto.direc,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        labelText: 'Direccion'
      ),
      onSaved: (value) => producto.direc = value,
      validator: (value) {
        if ( value.length < 3 ) {
          return 'Ingrese la direccion';
        } else {
          return null;
        }
      },
    );

  }
  

 Widget _crearBanos() {
    return TextFormField(
      initialValue: producto.banos,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'N° de Baños'
      ),
      onSaved: (value) => producto.banos = value,
      validator: (value) {

        if ( utils.isNumeric(value)  ) {
          return null;
        } else {
          return 'Sólo números';
        }

      },
    );
  }





  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon( Icons.save ),
      onPressed: ( _guardando ) ? null : _submit,
    );
  }

  void _submit() async {

    

    if ( !formKey.currentState.validate() ) return;

    formKey.currentState.save();

    setState(() {_guardando = true; });

    if ( foto != null ) {
      producto.fotoUrl = await anunciosProvider.subirImagen(foto);
    }



    if ( producto.id == null ) {
      anunciosProvider.crearProducto(producto);
    } else {
      anunciosProvider.editarProducto(producto);
    }


    // setState(() {_guardando = false; });
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);

  }


  void mostrarSnackbar(String mensaje) {

    final snackbar = SnackBar(
      content: Text( mensaje ),
      duration: Duration( milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);

  }


  Widget _mostrarFoto() {

    if ( producto.fotoUrl != null ) {
      
      return FadeInImage(
        image: NetworkImage( producto.fotoUrl ),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        fit: BoxFit.contain,
      );

    } else {

      return Image(

        image: AssetImage( foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,

      );

    }

  }


  _seleccionarFoto() async {

    _procesarImagen( ImageSource.gallery );

  }
  
  
  _tomarFoto() async {

    _procesarImagen( ImageSource.camera );

  }

  _procesarImagen( ImageSource origen ) async {

    foto = await ImagePicker.pickImage(
      source: origen
    );

    if ( foto != null ) {
      producto.fotoUrl = null;
    }

    setState(() {});

  }


}



