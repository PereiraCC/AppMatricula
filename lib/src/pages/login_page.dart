import 'package:flutter/material.dart';


import 'package:matricula/src/widgets/fondo.dart';
import 'package:matricula/src/widgets/login_form.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Fondo(),
          LoginForm(),
        ]
     ),
   );
  }
}