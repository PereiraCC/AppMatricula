
import 'dart:convert';

CarrerasModel carrerasFromJson(String str) => CarrerasModel.fromJson(json.decode(str));

String carrerasToJson(CarrerasModel data) => json.encode(data.toJson());

class CarrerasModel {

    CarrerasModel({
        this.codigo,
        this.nombre,
    });

    String codigo;
    String nombre;

    factory CarrerasModel.fromJson(Map<String, dynamic> json) => CarrerasModel(
        codigo: json["Codigo"],
        nombre: json["Nombre"],
    );

    Map<String, dynamic> toJson() => {
        "Codigo": codigo,
        "Nombre": nombre,
    };
}
