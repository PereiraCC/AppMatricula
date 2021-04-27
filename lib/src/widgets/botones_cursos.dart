

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:matricula/src/Models/model_carreras.dart';
import 'package:matricula/src/Models/model_cursos.dart';
import 'package:matricula/src/bloc/provider.dart';

class BotonesCursos extends StatelessWidget {

  final CarrerasModel carrera;

  const BotonesCursos({this.carrera});
  
  @override
  Widget build(BuildContext context) {

    final cursosBloc = Provider.cursosbloc(context);
    cursosBloc.cargarCarreras(carrera.codigo);

    return StreamBuilder(
        stream: cursosBloc.carrerasStream,
        builder: (BuildContext context, AsyncSnapshot<List<CursosModel>> snapshot) {
          if ( snapshot.hasData ){

            final cursos = snapshot.data;

            return ListView.builder(
                itemCount: cursos.length,
                itemBuilder: (context, i) => _crearBotoneRedondeado(context, Colors.blue, Icons.filter_frames_rounded, cursos[i]),
            );
             

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  }

  Widget _crearBotoneRedondeado(BuildContext context, Color color, IconData icono, CursosModel curso){

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
                  Navigator.pushNamed(context, 'grupos', arguments: curso);
                },
              ),
              Text(curso.nombre, style: TextStyle(color: Colors.white)),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

}

