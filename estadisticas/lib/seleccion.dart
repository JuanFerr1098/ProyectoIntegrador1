import 'package:flutter/material.dart';

class SeleccionarDatos extends StatelessWidget {
  const SeleccionarDatos({Key? key, required this.title}) : super(key: key);

  final String title;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(/**Crear el formulario para selleccionar los datos */),
    );
  }
}