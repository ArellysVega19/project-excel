import 'dart:convert';
import 'package:admin_dashboard/model/cabecera.dart';
import 'package:admin_dashboard/model/detalle.dart';
import 'package:admin_dashboard/model/modelo.dart';
import 'package:admin_dashboard/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SolicitudApi {
  static String dominio = "www.cojapan.com.ec";
  static String path = "/contabilidad";

  Future<List<Modelo>> querylist(String codigo) async {
    var url = Uri.https(dominio, '$path/getregistros', {
      'id': codigo,
    });

    try {
      final respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        return parseListModel(utf8.decode(respuesta.bodyBytes));
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
  }

  List<Modelo> parseListModel(String respuesta) {
    final parseo = jsonDecode(respuesta);
    return parseo.map<Modelo>((json) => Modelo.fromMap(json)).toList();
  }

  Future<List<Cabecera>> queryFillCabecera() async {
    List<Cabecera> resul = [];

    var url = Uri.https(dominio, '$path/getExcel');

    try {
      http.Response respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        if (respuesta.body != "")
          return respuesta.body.toString() != "[]"
              ? parseCabecera(utf8.decode(respuesta.bodyBytes))
              : resul;
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
    return resul;
  }

  Future<Cabecera> queryCabecera(String identificacion, String proyecto) async {
    Cabecera dato;
//pcgauxU1
    var url = Uri.https(dominio, '$path/getCabecera',
        {'codigo': identificacion, 'proyecto': proyecto});

    try {
      http.Response respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        dato = Cabecera.fromJson(utf8.decode(respuesta.bodyBytes));
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
    return dato;
  }

  Future<String> queryTexto(String identificacion, String proyecto) async {
    String dato = "";
    //presultA
    var url = Uri.https(dominio, '$path/getconfigtext',
        {'codigo': identificacion, 'proyecto': proyecto});

    try {
      http.Response respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        dato = utf8.decode(respuesta.bodyBytes);
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
    return dato;
  }

  Future<List<Detalle>> queryDetalle(Cabecera data) async {
    var url = Uri.https(dominio, '$path/getDetalles', {
      'codigo': data.codUsr,
      'proyecto': data.codPrg,
      'fecha': DateFormat('yyyy-MM-dd HH:mm:ss').format(data.edtF01)
    });

    try {
      final respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        return parseListModel1(utf8.decode(respuesta.bodyBytes));
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
  }

  List<Detalle> parseListModel1(String respuesta) {
    final parseo = jsonDecode(respuesta);
    return parseo.map<Detalle>((json) => Detalle.fromMap(json)).toList();
  }

  Future<List<Usuario>> queryUsers(String code, String pass) async {
    List<Usuario> resul = [];
    var url = Uri.https(dominio, '/solicitud/getusers',
        {'empresa': '01', 'usuario': code, 'password': pass});

    try {
      http.Response respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        if (respuesta.body != "")
          return respuesta.body.toString() != "[]"
              ? parseUsers(utf8.decode(respuesta.bodyBytes))
              : resul;
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
    return resul;
  }

  Future<String> queryDeleteDoc(Cabecera data) async {
    String dato = "";

    var url = Uri.https(dominio, '$path/deleteExcel', {
      'name': data.codUsr,
      'proyecto': data.codPrg,
      'fecha': DateFormat('yyyy-MM-dd HH:mm:ss').format(data.edtF01)
    });
    print(DateFormat('yyyy-MM-dd HH:mm:ss').format(data.edtF01));
    print(url);
    try {
      http.Response respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        dato = utf8.decode(respuesta.bodyBytes);
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
    return dato;
  }

  Future<String> queryUploadDoc(Cabecera data) async {
    String dato = "";

    var url = Uri.https(dominio, '$path/uploadExcel', {
      'usuario': data.codUsr,
      'proyecto': data.codPrg,
      'fecha': DateFormat('yyyy-MM-dd HH:mm:ss').format(data.edtF01)
    });

    try {
      http.Response respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        dato = utf8.decode(respuesta.bodyBytes);
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
    return dato;
  }

  List<Usuario> parseUsers(String respuesta) {
    final parseo = jsonDecode(respuesta);
    return parseo.map<Usuario>((json) => Usuario.fromMap(json)).toList();
  }

  List<Cabecera> parseCabecera(String respuesta) {
    final parseo = jsonDecode(respuesta);
    return parseo.map<Cabecera>((json) => Cabecera.fromMap(json)).toList();
  }
}


/* Metodos sin uso


  Future<Config> queryConfig(String identificacion, String proyecto) async {
    Config dato;
//pcgauxU1
    var url = Uri.https(dominio, '$path/getConfig',
        {'codigo': identificacion, 'proyecto': proyecto});

    try {
      http.Response respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        dato = Config.fromJson(utf8.decode(respuesta.bodyBytes));
      } else {
        throw Exception('Excepcion ' + respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('error el en GET: $e');
    }
    return dato;
  }


 */