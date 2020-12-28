import 'package:flutter/material.dart';

import 'package:mapbox_mapas/src/bloc/login_bloc.dart';
// se exporta para que las demas clases lo tenga 
export 'package:mapbox_mapas/src/bloc/login_bloc.dart';

//Este permite que un widget descendiente pueda acceder a la data(arbol)
// manipular la información 
class Provider extends InheritedWidget {
 // este funcion hace que se mantenga la instancia del los datos que pasamos a la siguente pantall
  static Provider _instancia;

  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child );
    }

    return _instancia;

  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child );

// instancia
  final loginBloc = LoginBloc();

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

 //Al actualizarse debe notificar a sus hijos 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
//contexto: arbol de Widget y va buscar un provider
  static LoginBloc of ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }

}