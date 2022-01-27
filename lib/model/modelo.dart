// To parse this JSON data, do
//
//     final modelo = modeloFromMap(jsonString);

import 'dart:convert';

class Modelo {
  Modelo({
    required this.id,
    required this.tipo,
    required this.linea,
  });

  String id;
  String tipo;
  String linea;

  factory Modelo.fromJson(String str) => Modelo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Modelo.fromMap(Map<String, dynamic> json) => Modelo(
        id: json["id"],
        tipo: json["tipo"],
        linea: json["linea"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "linea": linea,
      };
}
