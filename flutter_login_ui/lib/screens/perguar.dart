import 'package:flutter/material.dart';
//import 'package:path/path.dart';
import 'package:flutter_login_ui/base/note1.dart';
import 'package:flutter_login_ui/db/operation1.dart';
import 'package:flutter_login_ui/screens/Perfil.dart';

class Perguar extends StatelessWidget {
  static const String ROUTE = "/perguar";

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
  List<Note1> notes = [];
  
  @override
  void initState() {
    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, Perfil.ROUTE,
                    arguments: Note1.empty())
                .then((value) => setState(() {
                      _loadData();
                    }));
          },
        ),
        appBar: AppBar(
          title: Text("Perfiles"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, i) => _createItem(i),
          ),
        ),
        );
  }

  _loadData() async {
    List<Note1> auxNote = await Operation1.notes();

    setState(() {
      notes = auxNote;
    });
  }

  _createItem(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        print(direction);
        Operation1.delete(notes[i]);
      },
      child: ListTile(
        title: Text(notes[i].nom),
        trailing: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Perfil.ROUTE,
                      arguments: notes[i])
                  .then((value) => setState(() {
                        _loadData();
                      }));
            },
            child: Icon(Icons.edit)),
      ),
    );
  }
}
