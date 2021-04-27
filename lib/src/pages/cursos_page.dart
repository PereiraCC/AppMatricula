

import 'package:flutter/material.dart';
import 'package:matricula/src/Models/model_carreras.dart';
import 'package:matricula/src/widgets/botones_cursos.dart';
import 'package:matricula/src/widgets/fondo_app.dart';

class CursosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final CarrerasModel carrera = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          FondoApp(),
          _titulos(),
          
          Container(
            padding: EdgeInsets.only(top: 120),
            child: BotonesCursos(carrera: carrera,), 
          )
          
        ],
      ),
    );
  }

  Widget _titulos(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text('Universidad ABC', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text('Seleccione un curso', style: TextStyle(color: Colors.white, fontSize: 15.0)),
          ],
        ),
      ),
    );
  }
}