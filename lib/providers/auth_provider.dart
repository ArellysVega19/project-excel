import 'dart:convert';

import 'package:admin_dashboard/model/usuario.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? cliente;

  AuthProvider() {
    this.isAuthenticated();
  }

  forget(String email) async {
    this._token = email;
    LocalStorage.prefs.setString('correo', this._token!);
    notifyListeners();
  }

  login(String email, String password, Usuario usuario) async {
    this._token = usuario.ctaUsr;
    this.cliente = usuario;
    LocalStorage.prefs.setString('token', this._token!);
    LocalStorage.prefs.setString('usuario', json.encode(usuario.toMap()));

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  generar(String codRef) async {
    this._token = codRef;
    LocalStorage.prefs.setString('token', this._token!);
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  deleteToken() async {
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    final tokenUser = LocalStorage.prefs.getString('usuario');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    if (tokenUser == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //logica para verificar el token de llegada
    cliente = Usuario.fromMap(jsonDecode(tokenUser));

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

  logout() {
    LocalStorage.prefs.remove('token');
    LocalStorage.prefs.remove('usuario');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.loginRoute);
  }
}
