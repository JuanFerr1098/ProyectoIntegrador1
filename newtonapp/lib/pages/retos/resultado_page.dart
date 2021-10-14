import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/providers/auth.dart';
import 'package:newtonapp/providers/user_provider.dart';

final AuthService _authS = AuthService();

class Resultado extends StatelessWidget {
  final String date;
  final String puntaje;
  final String aciertos;
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
      required this.aciertos,
      required this.errores,
      required this.cantPreg,
      required this.date})
      : super(key: key);

  //Este widget se carga cada 8 segundos y no se por que

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return resultado(context);
  }

  Widget resultado(BuildContext context) {
    actualizarPuntaje();
    return Scaffold(
      //appBar: myAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Su puntaje es ' + puntaje,
            style: TextStyle(
              color: const Color.fromRGBO(145, 99, 203, 1),
              //color: Colors.white,
              fontFamily: 'QBold',
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
          volver(context),

        ],
      ),
    );
  }

   Widget volver(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO( 0, 180, 216, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
               Navigator.of(context).pushNamedAndRemoveUntil(
                    'retosZone', ModalRoute.withName('index'));
          },
          child: const Text(
            'Volver a Retos',
            style: TextStyle(
              fontFamily: 'QBold', 
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

 Widget operacionvolver(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO(145, 99, 203, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
Navigator.of(context).pushNamedAndRemoveUntil(
                    'index', ModalRoute.withName('index'));
          },
          child: const Text(
            'Elegir Operación',
            style: TextStyle(
              fontFamily: 'QBold', 
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
  
  actualizarPuntaje() {
    Map score = {
      'lvl': lvl,
      'tipo': tipo,
      'puntaje': puntaje,
      'aciertos': aciertos,
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
