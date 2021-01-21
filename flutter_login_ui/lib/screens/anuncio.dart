import 'package:flutter/material.dart';
import 'package:flutter_login_ui/base/producto_model.dart';
//import 'package:flutter_login_ui/pages/provider.dart';
import 'package:flutter_login_ui/providers/anuncios_provider.dart'; 
class Anuncio extends StatelessWidget {
  
  final anunciosProvider = new AnunciosProvider();
  
  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Anuncio')
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton( context ),
    );
  }


  Widget _crearListado() {

    return FutureBuilder(
      future: anunciosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if ( snapshot.hasData ) {

          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i] ),
          );

        } else {
          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto ) {

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: ( direccion ){
        anunciosProvider.borrarProducto(producto.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[

            ( producto.fotoUrl == null ) 
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                image: NetworkImage( producto.fotoUrl ),
                placeholder: AssetImage('assets/jar-loading.gif'),
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            
            ListTile(
              title: Text('${ producto.nom } - ${ producto.ciu }'),
              subtitle: Text( producto.id ),
              onTap: () => Navigator.pushNamed(context, '/formulario', arguments: producto ),
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
      onPressed: ()=> Navigator.pushNamed(context, '/formulario'),
    );
  }

}