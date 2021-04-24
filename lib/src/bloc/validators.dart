

import 'dart:async';

class Validators {

  final validarIdentificacion = StreamTransformer<String, String>.fromHandlers(
    handleData: (identificacion, sink) {

      final isDigitsOnly = int.tryParse(identificacion);
      
      if(isDigitsOnly != null){
        sink.add(identificacion);
      }
      else{
        sink.addError('La identificacion solamente debe contener numeros');
      }
    }
  );

}