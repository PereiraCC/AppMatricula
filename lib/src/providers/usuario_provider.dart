import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider {


  Future<Map<String, dynamic>> login(String identificacion) async{

    var  url = Uri.parse('http://10.0.0.6/WebApiMatricula/api/Usuarios/Login?id=' + identificacion);

    final resp = await http.post(
      url
    );

    //Map<String, dynamic> decodedResp = json.decode(resp.body);

    //print(decodedResp);

    if(resp.statusCode == 200){

      return { 'ok' : true, 'mensaje' : '' };

    } else if(resp.statusCode == 404){

      return { 'ok' : false, 'mensaje' : 'El usuario no existe'};

    }else{

      return { 'ok' : false, 'mensaje' : 'TODO MARIANA'};
      //decodedResp['ExceptionMessage']
    }

    
  }

  

}