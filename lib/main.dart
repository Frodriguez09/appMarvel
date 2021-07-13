import 'package:marvel_app/src/views/hero_detalle.dart';
import 'package:marvel_app/src/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Biblioteca Heroes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red[900],
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomePage(),
          'detalle': (BuildContext context) => HeroDetalle(),
        });
  }
}
