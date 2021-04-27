
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matricula/src/Models/model_grupos.dart';

class GruposProvider {

   Future<List<GruposModel>> getCursosxCarreras(String nombreCurso) async{

    var  url = Uri.parse('http://10.0.0.7/WebApiMatricula/api/Grupos/GruposCurso?id=' + nombreCurso);

    final resp = await http.get(url);

    final List<dynamic> decodedResp = json.decode(resp.body);
    final List<GruposModel> grupos = new List();

    print(decodedResp);

    if(resp.statusCode == 200){

      decodedResp.forEach((map) { 

        final prodTemp = GruposModel.fromJson(map);
        prodTemp.numero = map['Numero'];

        grupos.add(prodTemp);

      });

      return grupos;

    } else 
    {
       return [];
    }

  }

}