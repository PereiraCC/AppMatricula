

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:matricula/src/Models/model_cursos.dart';
import 'package:matricula/src/Models/model_grupos.dart';
import 'package:matricula/src/bloc/provider.dart';

class BotonesGrupos extends StatelessWidget {

  final CursosModel curso;

  const BotonesGrupos({this.curso});
  
  @override
  Widget build(BuildContext context) {

    final gruposBloc = Provider.gruposbloc(context);
    gruposBloc.cargarGrupos(curso.nombre);

    return StreamBuilder(
        stream: gruposBloc.carrerasStream,
        builder: (BuildContext context, AsyncSnapshot<List<GruposModel>> snapshot) {
          if ( snapshot.hasData ){

            final grupos = snapshot.data;

            return ListView.builder(
                itemCount: grupos.length,
                itemBuilder: (context, i) => _crearBotoneRedondeado(context, Colors.blue, Icons.filter_frames_rounded, grupos[i]),
            );
             

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  }

  Widget _crearBotoneRedondeado(BuildContext context, Color color, IconData icono, GruposModel carrera){

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
                  Navigator.pushNamed(context, 'home');
                },
              ),
              Text(carrera.numero, style: TextStyle(color: Colors.white)),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

}

