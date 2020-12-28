import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:mapbox_mapas/src/preferencias_usuario/preferencias_usuario.dart';

class UsuarioProvider {
  // se crear un string para resivir la clave de la api, la cual es tomada de firebase
  final String _firebaseToken = 'AIzaSyBPjekJy4eYK7IAifrzNkdRpyCRGkJPS_g';
  final _prefs = new PreferenciasUsuario();

  // async para usar el http
  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    // se pregunta si tiene la llave al tener la respuesta
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'Token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    // se pregunta si tiene la llave al tener la respuesta
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'Token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future resetPassword(String email) async {
    final authData = {
      'email': email,
      'requestType': 'PASSWORD_RESET',
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    // se pregunta si tiene la llave al tener la respuesta
    if (decodedResp.containsKey('email')) {
      // _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'email': decodedResp['email']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
