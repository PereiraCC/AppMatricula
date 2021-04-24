import 'package:flutter/material.dart';

import 'package:matricula/src/bloc/login_bloc.dart';
import 'package:matricula/src/bloc/provider.dart';
import 'package:matricula/src/providers/usuario_provider.dart';
import 'package:matricula/src/utils/utils.dart';


class LoginForm extends StatelessWidget {

  final usuarioProvider = UsuarioProvider();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            )
          ),

          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(  
                  color: Colors.black26,
                  blurRadius: 30.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 60.0),
                _crearCampo(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),

          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearCampo(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.identificacionStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(  
              icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
              labelText: 'Identificacion',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: (value) => bloc.changeIndentificacion(value),
          ),
        );
      }
    );
  }

  Widget _crearBoton(LoginBloc bloc){

   return StreamBuilder(
      stream: bloc.identificacionStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null
        );
      },
    );
  }

  void _login(LoginBloc bloc, BuildContext context) async {

    Map info = await usuarioProvider.login(bloc.identificacion);

    if( info['ok']){
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, info['mensaje']);
    }

  }

}