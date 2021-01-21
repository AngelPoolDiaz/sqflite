import 'package:flutter/material.dart';
//import 'package:path/path.dart';
//import 'package:flutter_login_ui/db/operation.dart';
//import 'package:flutter_login_ui/screens/anuncio.dart';
//import 'package:flutter_login_ui/screens/formulario.dart';
//import 'package:flutter_login_ui/screens/perguar.dart';
import 'package:flutter_login_ui/screens/Perfil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
/*
  @override
  void initState() {
    _loadData();

    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ANUNCIOS"),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("roomi").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<DocumentSnapshot> docs = snapshot.data.docs;

              return Container(
                child: ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (_, i) {
                      Map<String, dynamic> data = docs[i].data();
                      print("____");
                      print(data);

                      return ListTile(
                        title: Text(data['title']),
                      );
                    }),
              );
            }),
/* Container(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, i) => _createItem(i),
          ),
        ),*/
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
              title: Text('Formulario'),
              leading: Icon(Icons.speaker_group),
            ),
            ListTile(
              title: Text('Agregaregar Habitacion'),
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
/*
  _loadData() async {
    List<Note> auxNote = await Operation.notes();

    setState(() {
      notes = auxNote;
    });
  }

  _createItem(int i) {
    return ListTile(
      key: Key(i.toString()),
      //direction: DismissDirection.startToEnd,

      title: Text(notes[i].title),
    );
  }*/
}
