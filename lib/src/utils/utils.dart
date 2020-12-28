import 'package:flutter/material.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();
bool esNumero(String s) {
  if (s.isEmpty) return false;
  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String mensaje) {
  //caja de texto
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('¡Información no valida!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Icon(Icons.error,color: Colors.red,size: 50,),
              Text(mensaje),
             
             // FlutterLogo(
                //size: 100.0,
              //)
            ],
          ),
          //title: Text('¡Información no valida!'),
          //content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
  void mostrarAlertaCorrecta(BuildContext context, String mensaje) {
  //caja de texto
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('¡Información valida!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               Icon(Icons.verified_user,color: Colors.green,size: 50,),
              Text(mensaje),
             
             // FlutterLogo(
                //size: 100.0,
              //)
            ],
          ),
          //title: Text('¡Información no valida!'),
          //content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });

}

 

