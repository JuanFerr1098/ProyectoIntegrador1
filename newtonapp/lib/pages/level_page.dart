import 'package:flutter/material.dart';
import 'package:newtonapp/pages/retos_zone.dart';

class Level extends StatelessWidget {
  final List crearReto;
  const Level({Key? key, required this.crearReto}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          texto(),
          botoneslvl(context, '1cifra', '1 Cifra')

        ],
      ),
    );
  }
  
  Widget texto() {
    return const Text('Level');
  }

  Widget botoneslvl(context, String lvl, String texto){
    crearReto.add(lvl);
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 90.0,
          height: 90.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => RetosPage(crearReto: crearReto)));
          },
          child: Text(texto),
        )); 
  }
}