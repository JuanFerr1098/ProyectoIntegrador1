import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/src/material/colors.dart';

class PruebaHome extends StatelessWidget {
  final String title = 'PruebaHome';
  const PruebaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: const Color.fromRGBO( 145, 99, 203, 1),//Fondo de la pantalla
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
titulo(context,)
          ],
        ),
      ),
    );
  }
}

  Widget titulo(context) {
    return Container(
      //color: Colors.amber[600],
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.all(50),

      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Bienvenido a la prueba',
              style: TextStyle(
                color: Colors.white,
                //color: Colors.white,
                fontFamily: 'QBold',
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ]),
    );
  }