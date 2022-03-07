import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../providers/user_provider.dart';
import 'package:newtonapp/providers/auth.dart';

//import 'package:flutter/src/material/colors.dart';
final AuthService _authS = AuthService();

class PruebaHome extends StatelessWidget {
  final String title = 'PruebaHome';
  const PruebaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor:
          const Color.fromRGBO(145, 99, 203, 1), //Fondo de la pantalla
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: cuerpo(context),
      ),
    );
  }
}

Widget txt(context) {
  return Container(
    width: double.infinity,
    //height: MediaQuery.of(context).size.height * .4,
    padding: const EdgeInsets.all(30),
    child: const Text(
      'Bienvenido a la prueba',
      style: TextStyle(
        color: Colors.white,
        //color: Colors.white,
        fontFamily: 'QBold',
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
      ),
    ),
  );
}

Widget boton(context) {
  return Container(
    padding: const EdgeInsets.all(30),
    alignment: Alignment.center,
    child: MaterialButton(
     // height: 100,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('pruebapreguntas');
        UserProvider(uid: _authS.userActualUid()).actualizarEstado();
      },
      child: const Text(
        "Iniciar prueba",
        style: TextStyle(
          fontFamily: 'QBold',
          //color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget cuerpo(context) {
  return Container(
    //color: Colors.amber[600],
    width: double.infinity,
    height: MediaQuery.of(context).size.height * .5,
    padding: const EdgeInsets.all(50),
    child: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          txt(context),
          boton(context),
        ]),
  );
}
