import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtonapp/providers/auth.dart';
import 'package:newtonapp/providers/user_provider.dart';

final AuthService _authS = AuthService();

class Resultado extends StatelessWidget {
  final String date;
  final String puntaje;
  final String errores;
  final String cantPreg;
  final String lvl;
  final String operacion;
  final String tipo;
  const Resultado(
      {Key? key,
      required this.puntaje,
      required this.lvl,
      required this.operacion,
      required this.tipo,
      required this.errores,
      required this.cantPreg, 
      required this.date})
      : super(key: key);

  
  //final String date = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return resultado(context);
  }

  Widget resultado(BuildContext context) {
    actualizarPuntaje();
    return Scaffold(
      //appBar: myAppBar(context),
      body: Column(
        children: [
          Text('Su puntaje es ' + puntaje),
          MaterialButton(
            onPressed: () =>
                //Navigator.popUntil(context, ModalRoute.withName('index'))
                Navigator.of(context).pushNamedAndRemoveUntil(
                    'index', ModalRoute.withName('index')),
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
          // Agregar boton para reintentar
        ],
      ),
    );
  }

  actualizarPuntaje() {
    Map score = {
      'lvl': lvl,
      'tipo': tipo,
      'puntaje': puntaje,
      'errores': errores,
      'cantPreguntas': cantPreg,
    };
    UserProvider(uid: _authS.userActualUid())
        .getRealTimeUsers()
        .collection('puntajes')
        .doc(operacion)
        .set({date: score}, SetOptions(merge: true));
  }
  
}
