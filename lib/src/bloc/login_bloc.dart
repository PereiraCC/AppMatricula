

import 'package:matricula/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  final _identificacionController = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get identificacionStream => _identificacionController.stream.transform(validarIdentificacion);

  //Insertar valores al Stream
  Function(String) get changeIndentificacion => _identificacionController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get identificacion => _identificacionController.value;

  //Cerrar los Stream
  dispose(){
    _identificacionController?.close();
  }



}