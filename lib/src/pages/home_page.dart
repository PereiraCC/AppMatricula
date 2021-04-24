
import 'package:flutter/material.dart';
import 'package:matricula/src/widgets/botones_home.dart';
import 'package:matricula/src/widgets/fondo_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FondoApp(),

          BotonesHome(),
        ],
      ),

      //bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}