import 'package:flutter/material.dart';
import 'package:flutter_login_ui/base/producto_model.dart';

class AnuncioDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductoModel productoModel =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppbar(productoModel),
        SliverList(
          delegate: SliverChildListDelegate([
            _posterTitulo(context, productoModel),
            _tiPropiedad(),
            _tipodepropiedad(productoModel),
            _capacidadper(),
            _capacidadp(productoModel),
            _habit(),
            _habitaciones(productoModel),
            _cbanos(),
            _banos(productoModel),
            _descr(),
            _descripcion(productoModel),
            _codi(),
            _codigopos(productoModel),
            _extr(),
            _extras(productoModel),
          ]),
        )
      ],
    ));
  }

  Widget _crearAppbar(ProductoModel productoModel) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          productoModel.nom,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: productoModel.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage(productoModel.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 30.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(productoModel.nom,
                    style: Theme.of(context).textTheme.title,
                    overflow: TextOverflow.ellipsis),
                Text(productoModel.ciu,
                    style: Theme.of(context).textTheme.subhead,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tiPropiedad() {
    return ListTile(
      subtitle: new Text('Tipo de Propiedad'),
    );
  }

  Widget _capacidadper() {
    return ListTile(
      subtitle: new Text('Capacidad de personas'),
    );
  }

  Widget _habit() {
    return ListTile(
      subtitle: new Text('total de habitaciones'),
    );
  }

  Widget _cbanos() {
    return ListTile(
      subtitle: new Text('Total de baños'),
    );
  }

  Widget _descr() {
    return ListTile(
      subtitle: new Text('Direccion'),
    );
  }

  Widget _codi() {
    return ListTile(
      subtitle: new Text('Codigo Postal'),
    );
  }

  Widget _extr() {
    return ListTile(
      subtitle: new Text('Extras del Anuncio'),
    );
  }

  Widget _descripcion(ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        productoModel.direc,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _habitaciones(ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Text(
        productoModel.habi,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _extras(ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        productoModel.extr,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _codigopos(ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Text(
        productoModel.post,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _banos(ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Text(
        productoModel.banos,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _tipodepropiedad(ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Text(
        productoModel.tip,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _capacidadp(ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        productoModel.per,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
