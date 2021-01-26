import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/anuncio.dart';
import 'package:flutter_login_ui/screens/anuncio_detalle.dart';
import 'package:flutter_login_ui/screens/home.dart';
import 'package:flutter_login_ui/screens/login_screen.dart';
import 'package:flutter_login_ui/screens/perfil.dart';
import 'package:flutter_login_ui/screens/formulario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple[300],
        accentColor: Colors.deepPurple[300],
      ),
      title: 'Roomitum',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginScreen(),
        '/catalogo': (context) => Home(),
        Perfil.ROUTE: (_) => Perfil(),
        '/anuncio': (BuildContext context) => Anuncio(),
        '/home': (BuildContext context) => Home(),
        '/formulario': (BuildContext context) => Formulario(),
        '/anunciodetalle': (BuildContext context) => AnuncioDetalle()
      },
      initialRoute: '/login',
    );
  }
}
