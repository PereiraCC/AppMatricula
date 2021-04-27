import 'package:flutter/material.dart';
import 'package:matricula/src/bloc/cursos_bloc.dart';
import 'package:matricula/src/bloc/login_bloc.dart';

import 'carreras_bloc.dart';
import 'grupos_bloc.dart';


class Provider extends InheritedWidget{

  final loginBloc = new LoginBloc();
  final carreraBloc =  new CarrerasBloc();
  final cursosBloc =  new CursosBloc();
  final gruposBloc = new GruposBloc();

  static Provider _instancia;

  factory Provider({ Key key, Widget child }) {

    if( _instancia == null){
      _instancia = new Provider._(key: key, child: child);
    }

    return _instancia;
  }

  Provider._({ Key key, Widget child })
    : super(key: key, child: child);


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static CarrerasBloc carrerasbloc ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().carreraBloc;
  }

  static CursosBloc cursosbloc ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().cursosBloc;
  }

  static GruposBloc gruposbloc ( BuildContext context ){
    return context.dependOnInheritedWidgetOfExactType<Provider>().gruposBloc;
  }


}