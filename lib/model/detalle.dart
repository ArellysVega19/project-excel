import 'dart:convert';

class Detalle {
  Detalle({
    required this.codUsr,
    required this.codPrg,
    required this.edtF01,
    required this.secLin,
    required this.clsLin,
    required this.txtLin,
  });

  String codUsr;
  String codPrg;
  DateTime edtF01;
  int secLin;
  String clsLin;
  String txtLin;

  factory Detalle.fromJson(String str) => Detalle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Detalle.fromMap(Map<String, dynamic> json) => Detalle(
        codUsr: json["cod_usr"],
        codPrg: json["cod_prg"],
        edtF01: DateTime.parse(json["edt_f01"]),
        secLin: json["sec_lin"],
        clsLin: json["cls_lin"],
        txtLin: json["txt_lin"],
      );

  Map<String, dynamic> toMap() => {
        "cod_usr": codUsr,
        "cod_prg": codPrg,
        "edt_f01":
            "${edtF01.year.toString().padLeft(4, '0')}-${edtF01.month.toString().padLeft(2, '0')}-${edtF01.day.toString().padLeft(2, '0')}",
        "sec_lin": secLin,
        "cls_lin": clsLin,
        "txt_lin": txtLin,
      };
}