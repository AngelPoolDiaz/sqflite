import 'package:flutter/material.dart';
import 'package:flutter_login_ui/base/producto_model.dart';
import 'package:flutter_login_ui/providers/anuncios_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final anunciosProvider = new AnunciosProvider();

  final anuncios = [
    'Las guacamayas',
    'Ecotel valladolid',
    'Cuarto',
    'Casa Prueba',
    'Hotel Meson',
    'valladolid',
    'panaba',
    'merida',
    'popola',
    'casa',
    'Hotel',
  ];

  final anunciosRecientes = [
    'Cuarto',
    'Ecotel valladolid'
  ];
  

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }
   @override
   Widget buildSuggestions(BuildContext context) {
     // Son las sugerencias que aparecen cuando la persona escribe

     final listaSugerida = ( query.isEmpty )
                             ? anunciosRecientes
                             : anuncios.where(
                               (p)=> p.toLowerCase().startsWith(query.toLowerCase())
                             ).toList();

     return ListView.builder(
       itemCount: listaSugerida.length,
       itemBuilder: (context, i) {
         return ListTile(
           leading: Icon(Icons.movie),
           title: Text(listaSugerida[i]),
           onTap: (){
             seleccion = listaSugerida[i];
             showResults( context );
           },
         );
       },
     );
   }
}
 /* @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
        future: anunciosProvider.buscarPelicula(query),
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductoModel>> snapshot) {
          if (snapshot.hasData) {
            final anuncio = snapshot.data;
            return ListView(
                children: anuncio.map((anuncio) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(anuncio.getPosterImg()),
                  placeholder: AssetImage('assets/no-image.png'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(anuncio.nom),
                subtitle: Text(anuncio.ciu),
              );
            }).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }


        });*/
  



