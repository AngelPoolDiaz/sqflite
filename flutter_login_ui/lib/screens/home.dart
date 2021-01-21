import 'package:flutter/material.dart';
import 'package:flutter_login_ui/base/producto_model.dart';
//import 'package:path/path.dart';
//import 'package:flutter_login_ui/screens/perguar.dart';
import 'package:flutter_login_ui/screens/Perfil.dart';
import 'package:flutter_login_ui/providers/anuncios_provider.dart';

class Home extends StatelessWidget {
  static const String ROUTE = "/home";

  @override
  Widget build(BuildContext context) {
    return _MyList();
  }
}

class _MyList extends StatefulWidget {
  @override
  __MyListState createState() => __MyListState();
}

class __MyListState extends State<_MyList> {
  final anunciosProvider = new AnunciosProvider();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ANUNCIOS"),
        ),
        body: _crearListado(),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Jose'),
              accountEmail: Text('jose@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('J', style: TextStyle(fontSize: 40.0)),
              ),
            ),
            ListTile(
                title: Text('Tu perfil'),
                leading: Icon(Icons.supervised_user_circle),
                onTap: () {
                  Navigator.pushNamed(context, Perfil.ROUTE);
                }),
            ListTile(
              title: Text('Mis anuncios'),
              leading: Icon(Icons.speaker_group),
            ),
            ListTile(
              title: Text('Agregar Habitacion'),
              leading: Icon(Icons.question_answer_outlined),
              onTap: () {
                Navigator.pushNamed(context, '/anuncio');
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión'),
              leading: Icon(Icons.arrow_back),
              onTap: () {
                Navigator.pushNamed(context, '/login'); //modificación
              },
            )
          ],
        )));
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: anunciosProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    
    return Container(
        child: Card(
          child: Column(
            children: <Widget>[
              (producto.fotoUrl == null)
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      image: NetworkImage(producto.fotoUrl),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                title: Text('${producto.nom} - ${producto.ciu}'),
                subtitle: Text(producto.id),
              ),
            ],
          ),
        ));
  }
}
