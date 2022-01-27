import 'dart:convert';

class Cabecera {
  Cabecera({
    required this.codUsr,
    required this.codPrg,
    required this.edtF01,
    required this.edtN01,
    required this.edtSts,
  });

  String codUsr;
  String codPrg;
  DateTime edtF01;
  String edtN01;
  String edtSts;

  factory Cabecera.fromJson(String str) => Cabecera.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cabecera.fromMap(Map<String, dynamic> json) => Cabecera(
        codUsr: json["cod_usr"],
        codPrg: json["cod_prg"],
        edtF01: DateTime.parse(json["edt_f01"]),
        edtN01: json["edt_n01"],
        edtSts: json["edt_sts"],
      );

  Map<String, dynamic> toMap() => {
        "cod_usr": codUsr,
        "cod_prg": codPrg,
        "edt_f01": edtF01.toIso8601String(),
        "edt_n01": edtN01,
        "edt_sts": edtSts,
      };
}
