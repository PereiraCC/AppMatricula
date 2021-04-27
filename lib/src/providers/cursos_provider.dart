

import 'dart:convert';

import 'package:matricula/src/Models/model_cursos.dart';
import 'package:http/http.dart' as http;


class CursosProvider {

  Future<List<CursosModel>> getCursosxCarreras(String idCarrera) async{

    var  url = Uri.parse('http://10.0.0.7/WebApiMatricula/api/Cursos/CursosxCarreras?id=' + idCarrera);

    final resp = await http.get(url);

    final List<dynamic> decodedResp = json.decode(resp.body);
    final List<CursosModel> cursos = new List();

    print(decodedResp);

    if(resp.statusCode == 200){

      decodedResp.forEach((map) { 

        final prodTemp = CursosModel.fromJson(map);
        prodTemp.codigo = map['Codigo'];

        cursos.add(prodTemp);

      });

      return cursos;

    } else 
    {
       return [];
    }

  }


}