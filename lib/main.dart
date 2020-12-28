import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_mapas/src/bloc/provider.dart';
import 'package:mapbox_mapas/src/page/fullscreenmap.dart';
import 'package:mapbox_mapas/src/page/login_page.dart';
import 'package:mapbox_mapas/src/page/pm10_page.dart';
import 'package:mapbox_mapas/src/page/pm_25_page.dart';
import 'package:mapbox_mapas/src/page/recuperar_contrasena.dart';
import 'package:mapbox_mapas/src/page/registro_page.dart';
import 'package:mapbox_mapas/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    // de la bloc provider
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'registro': (BuildContext context) => RegistroPage(),
          'reset': (BuildContext context) => RecuperarContrasena(),
          'mapa': (BuildContext context) => FullScreenMap(),
          'pm25': (BuildContext context) => MaterialPm25(),
          'pm10': (BuildContext context) => MaterialPm10()
        },
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}
