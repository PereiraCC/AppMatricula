

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:matricula/src/Models/model_carreras.dart';
import 'package:matricula/src/bloc/carreras_bloc.dart';
import 'package:matricula/src/bloc/provider.dart';

class BotonesCarreras extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    final carrerasBloc = Provider.carrerasbloc(context);
    carrerasBloc.cargarCarreras();

    return StreamBuilder(
        stream: carrerasBloc.carrerasStream,
        builder: (BuildContext context, AsyncSnapshot<List<CarrerasModel>> snapshot) {
          if ( snapshot.hasData ){

            final carreras = snapshot.data;

            return ListView.builder(
                itemCount: carreras.length,
                itemBuilder: (context, i) => _crearBotoneRedondeado(context, Colors.blue, Icons.cast_for_education, carreras[i]),
            );
             

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );

  }

  Widget _crearBotoneRedondeado(BuildContext context, Color color, IconData icono, CarrerasModel carrera){

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
              Text(carrera.nombre, style: TextStyle(color: Colors.white)),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }

}