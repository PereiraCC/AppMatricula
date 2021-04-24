import 'package:flutter/material.dart';

import 'package:matricula/src/bloc/provider.dart';
import 'package:matricula/src/pages/carreras_page.dart';
import 'package:matricula/src/pages/home_page.dart';
import 'package:matricula/src/pages/login_page.dart';


void main() async{

  //WidgetsFlutterBinding.ensureInitialized();
  //final prefs = new PreferenciasUsuario();
  //await prefs.initPrefs();

  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //final prefs = new PreferenciasUsuario();
    //print(prefs.token);
    
    return  Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login'     : (BuildContext context) => LoginPage(),
          'home'      : (BuildContext context) => HomePage(),
          'carreras'  : (BuildContext context) => CarrerasPage()
        }, 
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
    
  }
}