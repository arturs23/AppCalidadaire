import 'package:flutter/material.dart';
import 'package:mapbox_mapas/src/bloc/login_bloc.dart';
import 'package:mapbox_mapas/src/bloc/provider.dart';
import 'package:mapbox_mapas/src/providers/usuario_provider.dart';
import 'package:mapbox_mapas/src/utils/utils.dart';


class RecuperarContrasena extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    // bloc: unica instancia "inicializando"
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // acomodar el login componenetes
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                // para ver la sombra
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Recuperar contraseña', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 60.0),
                // les pasa la instancia de provider
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                // les pasa la instancia de provider (bloc)
                _crearBoton(bloc)
              ],
            ),
          ),

          FlatButton(
            child: Text('Registrate aqui'),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
          ),
          FlatButton(
            child: Text('Iniciar sesión'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),

          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.assignment_ind, color: Colors.green),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error),
            //escuchando los cambios a la caja de texto
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Recuperar'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Colors.green,
            textColor: Colors.white,
            // snapshot.hasData: pregunta que si tiene información si no ejecute null
            onPressed:
                snapshot.hasData ? () => _resetPass(bloc, context) : null);
      },
    );
  }

  _resetPass(LoginBloc bloc, BuildContext context) async {
    final info = await usuarioProvider.resetPassword(bloc.email);
    if (info['ok']) {
      mostrarAlertaCorrecta(context, 'Correo enviado');
    } else {
      mostrarAlerta(context, info['mensaje']);
    }

    //Cuando el formulario es valido
    //Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearFondo(BuildContext context) {
// El mediaQuery: se utiliza para poner el fondo en 40% de la pantalla
    final size = MediaQuery.of(context).size;

    final fondoVerde = Container(
      // 40% del fondo
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(60, 119, 51, 1.0),
        Color.fromRGBO(49, 148, 198, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      // circulos en fondo
      children: <Widget>[
        fondoVerde,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          // poner la parte donde la nube y el nombre
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              //Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS7ilFoZ8_w6l6Dw3-btqIj-y1lBPpFAhBn0vnzqwAnOqq5GwtOi5OYJG1UCLYLjYM40NOf7HmZDxn729L4mS9oujWSMhS32MpFZw&usqp=CAU&ec=45702846'),
              Icon(Icons.lock_open, color: Colors.white, size: 100.0),
              SizedBox(height: 0.5, width: double.infinity),
              Text('Calidad del aire Bogotá',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }
}