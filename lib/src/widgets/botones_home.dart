
import 'dart:ui';

import 'package:flutter/material.dart';


class BotonesHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(  
        children: <Widget>[
          _titulos(),
          _botonesRedondeados(context),
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
            Text('Universidad ABC', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Seleccione una opcion', style: TextStyle(color: Colors.white, fontSize: 15.0)),
          ],
        ),
      ),
    );
  }

  Widget _botonesRedondeados(BuildContext context){
    return Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            _crearBotoneRedondeado(context, Colors.blue, Icons.ballot_sharp, 'Matricular', 'carreras'),
            _crearBotoneRedondeado(context, Colors.purpleAccent, Icons.pending_actions_outlined, 'Asistencia', 'login'),
          ]
        ),
      ],
    );
  }

  Widget _crearBotoneRedondeado(BuildContext context, Color color, IconData icono, String texto, String ruta){

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 5.0),
              RaisedButton(
                child: CircleAvatar( 
                  backgroundColor: color,
                  radius: 35.0,
                  child: Icon(icono, color: Colors.white, size: 30.0),
                ),
                color: Color.fromRGBO(62, 66, 107, 0.7),
                onPressed: () {
                  Navigator.pushNamed(context, ruta);
                },
              ),
              Text(texto, style: TextStyle(color: color)),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

}