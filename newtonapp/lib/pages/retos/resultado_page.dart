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

  
  //Este widget se carga cada 8 segundos y no se por que

  @override
  Widget build(BuildContext context) {
    return resultado(context);
  }

  Widget resultado(BuildContext context) {
    actualizarPuntaje();
    return Scaffold(
      //appBar: myAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Image.network('https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/gif%2Fpatito.gif?alt=media&token=6d4b13d0-56d1-4400-adc8-d5374f863233',
          width: 300,),
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
