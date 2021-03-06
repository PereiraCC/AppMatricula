import 'package:flutter/material.dart';

class Fondo extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondoMorado = Container( 
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(  
        gradient: LinearGradient(  
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    );

    final circulo = Container( 
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(  
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    final logoNombre = Container( 
      padding: EdgeInsets.only(top: 80.0),
      child: Column( 
        children: <Widget>[
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
          SizedBox(height: 10.0, width: double.infinity,),
          Text('Universidad ABC', style: TextStyle(color: Colors.white, fontSize: 25.0))
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,

        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),

        logoNombre

      ],
    );
  }
}