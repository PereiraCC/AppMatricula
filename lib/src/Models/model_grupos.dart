

import 'dart:convert';

GruposModel gruposFromJson(String str) => GruposModel.fromJson(json.decode(str));

String gruposToJson(GruposModel data) => json.encode(data.toJson());

class GruposModel {

    GruposModel({
        this.codigoProfesor,
        this.numero,
        this.nombreCurso,
        this.codigoHorario,
        this.codigoPeriodo,
    });

    String codigoProfesor;
    String numero;
    String nombreCurso;
    String codigoHorario;
    String codigoPeriodo;

    factory GruposModel.fromJson(Map<String, dynamic> json) => GruposModel(
        codigoProfesor: json["codigoProfesor"],
        numero: json["Numero"],
        nombreCurso: json["nombreCurso"],
        codigoHorario: json["codigoHorario"],
        codigoPeriodo: json["codigoPeriodo"],
    );

    Map<String, dynamic> toJson() => {
        "codigoProfesor": codigoProfesor,
        "Numero": numero,
        "nombreCurso": nombreCurso,
        "codigoHorario": codigoHorario,
        "codigoPeriodo": codigoPeriodo,
    };
}
