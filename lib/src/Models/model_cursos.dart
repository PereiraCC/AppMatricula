

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CursosModel cursosFromJson(String str) => CursosModel.fromJson(json.decode(str));

String cursosToJson(CursosModel data) => json.encode(data.toJson());

class CursosModel {
    CursosModel({
        this.codigo,
        this.nombre,
        this.nombreCarrera,
    });

    int codigo;
    String nombre;
    String nombreCarrera;

    factory CursosModel.fromJson(Map<String, dynamic> json) => CursosModel(
        codigo: json["Codigo"],
        nombre: json["Nombre"],
        nombreCarrera: json["NombreCarrera"],
    );

    Map<String, dynamic> toJson() => {
        "Codigo": codigo,
        "Nombre": nombre,
        "NombreCarrera": nombreCarrera,
    };
}
