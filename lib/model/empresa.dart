// To parse this JSON data, do
//
//     final empresa = empresaFromMap(jsonString);

import 'dart:convert';

class Empresa {
    Empresa({
        required this.aliEmp,
        required this.cccEmp,
        required this.cceEmp,
        required this.ceaEmp,
        required this.cexEmp,
        required this.cl1Emp,
        required this.cl2Emp,
        required this.cl3Emp,
        required this.cl4Emp,
        required this.cl5Emp,
        required this.clsEmp,
        required this.codEmp,
        required this.cpsEmp,
        required this.cs1Emp,
        required this.cs2Emp,
        required this.cs3Emp,
        required this.cs4Emp,
        required this.csaEmp,
        required this.cxaEmp,
        required this.falEmp,
        required this.fexEmp,
        required this.frcEmp,
        required this.iceEmp,
        required this.ivaEmp,
        required this.malEmp,
        required this.nm1Emp,
        required this.nm2Emp,
        required this.olsEmp,
        required this.pinEmp,
        required this.rceEmp,
        required this.sceEmp,
        required this.slsEmp,
        required this.snsEmp,
        required this.spsEmp,
        required this.stsEmp,
        required this.uceEmp,
        required this.ui1Emp,
        required this.ui2Emp,
        required this.ui3Emp,
        required this.ui4Emp,
        required this.ui5Emp,
        required this.uiaEmp,
        required this.uieEmp,
        required this.uiuEmp,
        required this.vimEmp,
    });

    String aliEmp;
    String cccEmp;
    String cceEmp;
    String ceaEmp;
    String cexEmp;
    String cl1Emp;
    String cl2Emp;
    String cl3Emp;
    String cl4Emp;
    String cl5Emp;
    String clsEmp;
    String codEmp;
    String cpsEmp;
    String cs1Emp;
    String cs2Emp;
    String cs3Emp;
    String cs4Emp;
    String csaEmp;
    String cxaEmp;
    String falEmp;
    DateTime fexEmp;
    String frcEmp;
    double iceEmp;
    double ivaEmp;
    int malEmp;
    String nm1Emp;
    String nm2Emp;
    String olsEmp;
    String pinEmp;
    String rceEmp;
    String sceEmp;
    String slsEmp;
    int snsEmp;
    String spsEmp;
    String stsEmp;
    String uceEmp;
    String ui1Emp;
    String ui2Emp;
    String ui3Emp;
    String ui4Emp;
    String ui5Emp;
    String uiaEmp;
    String uieEmp;
    String uiuEmp;
    String vimEmp;

    factory Empresa.fromJson(String str) => Empresa.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Empresa.fromMap(Map<String, dynamic> json) => Empresa(
        aliEmp: json["ali_emp"],
        cccEmp: json["ccc_emp"],
        cceEmp: json["cce_emp"],
        ceaEmp: json["cea_emp"],
        cexEmp: json["cex_emp"],
        cl1Emp: json["cl1_emp"],
        cl2Emp: json["cl2_emp"],
        cl3Emp: json["cl3_emp"],
        cl4Emp: json["cl4_emp"],
        cl5Emp: json["cl5_emp"],
        clsEmp: json["cls_emp"],
        codEmp: json["cod_emp"],
        cpsEmp: json["cps_emp"],
        cs1Emp: json["cs1_emp"],
        cs2Emp: json["cs2_emp"],
        cs3Emp: json["cs3_emp"],
        cs4Emp: json["cs4_emp"],
        csaEmp: json["csa_emp"],
        cxaEmp: json["cxa_emp"],
        falEmp: json["fal_emp"],
        fexEmp: DateTime.parse(json["fex_emp"]),
        frcEmp: json["frc_emp"],
        iceEmp: json["ice_emp"].toDouble(),
        ivaEmp: json["iva_emp"].toDouble(),
        malEmp: json["mal_emp"],
        nm1Emp: json["nm1_emp"],
        nm2Emp: json["nm2_emp"],
        olsEmp: json["ols_emp"],
        pinEmp: json["pin_emp"],
        rceEmp: json["rce_emp"],
        sceEmp: json["sce_emp"],
        slsEmp: json["sls_emp"],
        snsEmp: json["sns_emp"],
        spsEmp: json["sps_emp"],
        stsEmp: json["sts_emp"],
        uceEmp: json["uce_emp"],
        ui1Emp: json["ui1_emp"],
        ui2Emp: json["ui2_emp"],
        ui3Emp: json["ui3_emp"],
        ui4Emp: json["ui4_emp"],
        ui5Emp: json["ui5_emp"],
        uiaEmp: json["uia_emp"],
        uieEmp: json["uie_emp"],
        uiuEmp: json["uiu_emp"],
        vimEmp: json["vim_emp"],
    );

    Map<String, dynamic> toMap() => {
        "ali_emp": aliEmp,
        "ccc_emp": cccEmp,
        "cce_emp": cceEmp,
        "cea_emp": ceaEmp,
        "cex_emp": cexEmp,
        "cl1_emp": cl1Emp,
        "cl2_emp": cl2Emp,
        "cl3_emp": cl3Emp,
        "cl4_emp": cl4Emp,
        "cl5_emp": cl5Emp,
        "cls_emp": clsEmp,
        "cod_emp": codEmp,
        "cps_emp": cpsEmp,
        "cs1_emp": cs1Emp,
        "cs2_emp": cs2Emp,
        "cs3_emp": cs3Emp,
        "cs4_emp": cs4Emp,
        "csa_emp": csaEmp,
        "cxa_emp": cxaEmp,
        "fal_emp": falEmp,
        "fex_emp": fexEmp.toIso8601String(),
        "frc_emp": frcEmp,
        "ice_emp": iceEmp,
        "iva_emp": ivaEmp,
        "mal_emp": malEmp,
        "nm1_emp": nm1Emp,
        "nm2_emp": nm2Emp,
        "ols_emp": olsEmp,
        "pin_emp": pinEmp,
        "rce_emp": rceEmp,
        "sce_emp": sceEmp,
        "sls_emp": slsEmp,
        "sns_emp": snsEmp,
        "sps_emp": spsEmp,
        "sts_emp": stsEmp,
        "uce_emp": uceEmp,
        "ui1_emp": ui1Emp,
        "ui2_emp": ui2Emp,
        "ui3_emp": ui3Emp,
        "ui4_emp": ui4Emp,
        "ui5_emp": ui5Emp,
        "uia_emp": uiaEmp,
        "uie_emp": uieEmp,
        "uiu_emp": uiuEmp,
        "vim_emp": vimEmp,
    };
}
