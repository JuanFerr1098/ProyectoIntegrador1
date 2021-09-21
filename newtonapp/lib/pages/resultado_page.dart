import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtonapp/providers/auth.dart';
import 'package:newtonapp/providers/user_provider.dart';

final AuthService _authS = AuthService();
final String date = DateTime.now().toString();

class Resultado extends StatefulWidget {
  final String puntaje;
  final String lvl;
  final String operacion;
  final String tipo;
  const Resultado(
      {Key? key,
      required this.puntaje,
      required this.lvl,
      required this.operacion,
      required this.tipo})
      : super(key: key);

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  @override
  void initState(){
    actualizarPuntaje();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return resultado();
  }

  Widget resultado() {
    //actualizarPuntaje();
    return Scaffold(
      //appBar: myAppBar(context),
      body: Column(
        children: [
          Text('Su puntaje es ' + widget.puntaje),
          MaterialButton(
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('index')),
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

  actualizarPuntaje() {
    Map score = {
      'lvl': widget.lvl,
      'tipo': widget.tipo,
      'puntaje': widget.puntaje,
    };
    UserProvider(uid: _authS.userActualUid())
        .getRealTimeUsers()
        .collection('puntajes')
        .doc(widget.operacion)
        .set({date: score}, SetOptions(merge: true));
  }
}
