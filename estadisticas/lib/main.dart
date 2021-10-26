import 'package:estadisticas/seleccion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          // Entender como declarar nuevos tipos
        ),
        buttonTheme: const ButtonThemeData(
          // Aprender como funciona
        ),
      ),
      home: const SeleccionarDatos(title: 'Estadísticas de la App'),
    );
  }
}