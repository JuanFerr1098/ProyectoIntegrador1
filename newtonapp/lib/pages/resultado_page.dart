import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String puntaje;
  const Resultado({Key? key, required this.puntaje}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Resultado(puntaje);
}

class _Resultado extends State<Resultado> {
  final String puntaje;
  _Resultado(this.puntaje);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: myAppBar(context),
      body: Column(
        children: [
          Text('Su puntaje es ' + puntaje),
          MaterialButton(
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('index', (Route<dynamic> route) => false),
            child: Text(
              'Volver al inicio',
              style: TextStyle(
                fontFamily: 'Botones',
                fontStyle: FontStyle.italic,
                color: Colors.purple.shade700,
                fontSize: 25.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
