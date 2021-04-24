
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matricula/src/Models/model_carreras.dart';

class CarrerasProvider {

  Future<List<CarrerasModel>> getCarreras() async{

    var  url = Uri.parse('http://10.0.0.6/WebApiMatricula/api/Carreras');

    final resp = await http.get(url);

    final List<dynamic> decodedResp = json.decode(resp.body);
    final List<CarrerasModel> carreras = new List();

    print(decodedResp);

    if(resp.statusCode == 200){

      decodedResp.forEach((map) { 

        final prodTemp = CarrerasModel.fromJson(map);
        prodTemp.codigo = map['Codigo'];

        carreras.add(prodTemp);

      });

      return carreras;

    } else 
    {
       return [];
    }

  }

}



