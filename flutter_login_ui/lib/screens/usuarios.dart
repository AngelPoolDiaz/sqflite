import 'package:flutter/material.dart';
import 'package:flutter_login_ui/base/usuario_model.dart';
//import 'package:flutter_login_ui/pages/provider.dart';
import 'package:flutter_login_ui/providers/usuario_provider.dart';

class Usuarios extends StatelessWidget {
  
  final usuarioProvider = new UsuarioProvider();
  
  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario')
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton( context ),
    );
  }


  Widget _crearListado() {

    return FutureBuilder(
      future: usuarioProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<UsuarioModel>> snapshot) {
        if ( snapshot.hasData ) {

          final usuarios = snapshot.data;

          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, i) => _crearItem(context, usuarios[i] ),
          );

        } else {
          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, UsuarioModel usuarios ) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( direccion ){
        usuarioProvider.borrarProducto(usuarios.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            ( usuarios.id == null ) 
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                image: NetworkImage( usuarios.id ),
                placeholder: AssetImage('assets/logos/usuario.png'),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),            
            ListTile(
              title: Text('${ usuarios.nom } - ${ usuarios.email }'),
              subtitle: Text( usuarios.ocu),
              onTap: () => Navigator.pushNamed(context, '/perfil',  arguments: usuarios ),
            ),

          ],
        ),
      )
    );


    

  }


  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.add ),
      backgroundColor: Colors.deepPurple,
      onPressed: ()=> Navigator.pushNamed(context, '/perfil'),
    );
  }

}