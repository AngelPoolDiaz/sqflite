import 'package:flutter/material.dart';




class Perfil extends StatelessWidget {
  static const String ROUTE = "/perfil";

  final _formKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final apController = TextEditingController();
  final amController = TextEditingController();
  final genController = TextEditingController();
  final ocuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar"),
      ),
      body: Container(
        child: _buildForm())
      
    );
  }

  

  Widget _buildForm( ) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                  "assets/logos/usuario.png",
                  height: 200,
                ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: nomController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Tiene que colocar data";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Nombre",
                    border:
                        OutlineInputBorder() //borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: apController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Tiene que colocar data";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Apellido Paterno",
                    border:
                        OutlineInputBorder() //borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: amController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Tiene que colocar data";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Apellido Materno",
                    border:
                        OutlineInputBorder() //borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: genController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Tiene que colocar data";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Genero",
                    border:
                        OutlineInputBorder() //borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: ocuController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Tiene que colocar data";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Ocupacion",
                    border:
                        OutlineInputBorder() //borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
              ),
              RaisedButton(
                child: Text("Guardar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    
                      // actualizacion
                     
                    } else {
                      // insercion
                      
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}