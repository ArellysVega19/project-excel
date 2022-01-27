import 'package:admin_dashboard/api/solicitud_api.dart';
import 'package:admin_dashboard/model/cabecera.dart';
import 'package:flutter/material.dart';

class ExportProvider extends ChangeNotifier {
  List<Cabecera> listCabecera = [];
  final api = SolicitudApi();

  getRegistro() async {
    listCabecera = await api.queryFillCabecera();
    notifyListeners();
  }

  uploadRegistro() async {
    listCabecera = [];
    listCabecera = await api.queryFillCabecera();
    notifyListeners();
  }

  uploadEstado(Cabecera data) async {
    api.queryUploadDoc(data);
    notifyListeners();
  }

  deleteRegistro(Cabecera cabecera) {
    api.queryDeleteDoc(cabecera);
    listCabecera.remove(cabecera);
    notifyListeners();
  }
}
