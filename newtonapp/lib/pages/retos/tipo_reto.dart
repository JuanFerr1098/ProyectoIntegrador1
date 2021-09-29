import 'package:flutter/material.dart';
import 'package:newtonapp/pages/retos/retos.dart';
import 'package:newtonapp/shared/drawer_menu.dart';

class TipoReto extends StatelessWidget {
  TipoReto({Key? key}) : super(key: key);
  final List crearReto = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // Organizar
      drawer: DrawerMenu(),
      body: Column(
        children: <Widget>[
          texto(),
          botonTipoReto(context, 'time30s', '30 Segundos'),
          botonTipoReto(context, '5preg', '5 Preguntas'),
          botonTipoReto2(context, 'memory', 'Memoria'),
        ],
      ),
    );
  }

  Widget texto() {
    return const Text('Bienvenido a Retos');
  }

  Widget botonTipoReto(context, String tipo, String texto) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            crearReto.add(tipo);
            Navigator.push(
                context, MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Retos(crearReto: crearReto)));
          },
          child: Text(texto),
        ));
  }

  Widget botonTipoReto2(context, String tipo, String texto) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('ComingSoon');
          },
          child: Text(texto),
        ));
  }
}
