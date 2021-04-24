
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universidad ABC'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            
            ListTile(
              title: Text('Matricular'),
              leading: Icon(Icons.book, color: Colors.blue),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            ),

            ListTile(
              title: Text('Registrar Asistencia'),
              leading: Icon(Icons.book_rounded, color: Colors.blue),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            ),

          ], 
        ),
      ),
    );
  }
}