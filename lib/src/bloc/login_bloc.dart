import 'dart:async';
import 'package:mapbox_mapas/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc with Validators {

// controladores 
//BehaviorSubject: muchos lugares de la aplicacion pueden oir el(_emailController,_passwordController) 
final _emailController    = BehaviorSubject<String>();
final _passwordController = BehaviorSubject<String>();


  // Recuperar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
 // validación de ambas correo y contraseña (formulario)
  Stream<bool> get formValidStream => 
  
  // RxDart: libreria que nos permite combinar las validaciones, por eso se escoje (combineLatest2)
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true );



  // Insertar valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  // Obtener el último valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;

//cerrar los string controler al no ser utilizarlos
// ? : para evitar por si es null
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}

