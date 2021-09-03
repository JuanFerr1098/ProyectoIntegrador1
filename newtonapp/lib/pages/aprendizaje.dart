import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:newtonapp/pages/register_page.dart';
import 'package:newtonapp/pages/signin_page.dart';
import 'package:newtonapp/pages/prueba.dart';
import 'package:newtonapp/pages/aprendizaje_suma.dart';

class Aprendizaje extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700, //Fondo de la pantalla
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //titulo(context),
            botones(context),
          ],
        ),
      ),
    );
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
          children: <Widget>[
            Text(
              'Bienvenido a',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            Text(
              'Aprendizaje',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            )
          ]),
    );
  }

  Widget botones(context) {
    return Container(
      // color: Colors.white60,
      width: double.infinity,

      //height:MediaQuery.of(context).size.height*.5,
      padding: const EdgeInsets.all(30),

      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //botonlogin(context),
            botonSuma(context),
            botonResta(context),
            botonMult(context),
            botonDiv(context),
          ]),
    );
  }

  Widget botonSuma(context) {
    return Container(
        //Boton para ir al Registro de la App
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AprendizajeSuma()));
          },
          child: Icon(
            Icons.add,
            color: Colors.purple.shade700,
            size: 60,
          ),
        ));
  }

  Widget botonResta(context) {
    return Container(
        //Boton para ir al Registro de la App
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
            /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */
          },
          child: Icon(
            Icons.remove,
            color: Colors.purple.shade700,
            size: 60,
          ),
        ));
  }

  Widget botonMult(context) {
    return Container(
        //Boton para ir al Registro de la App
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
            /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */
          },
          child: Icon(
            Icons.clear,
            color: Colors.purple.shade700,
            size: 60,
          ),
        ));
  }

  Widget botonDiv(context) {
    return Container(
        //Boton para ir al Registro de la App
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
            /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */
          },
          child: Icon(
            Icons.north_east,
            color: Colors.purple.shade700,
            size: 60,
          ),
        ));
  }
}
