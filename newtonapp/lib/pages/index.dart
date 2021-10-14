import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/src/material/colors.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

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
            titulo(context),
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
          children: const <Widget>[
            Text(
              'Bienvenido a \nNewton App',
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

  Widget botones(context) {
    return Container(
      // color: Colors.white60,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.all(30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            botonlogin(context),
            botonRegistro(context),
          ]),
    );
  }

  Widget botonlogin(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 250.0,
          height: 80.0,
          //color: const Color.fromRGBO( 7, 194, 184, 1), turquesa antiguo
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
           Navigator.of(context).pushNamed('login');
           //Navigator.of(context).pushNamed('index');
          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontFamily: 'QBold',            
              color: Color.fromRGBO( 145, 99, 203, 1),
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonRegistro(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 250.0,
          height: 80.0,
          color: Colors.white,
          //color: const Color.fromRGBO( 0, 180, 216, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('register');
          },
          child: const Text(
            'Registro',
            style: TextStyle(
              fontFamily: 'QBold', 
              color: Color.fromRGBO( 145, 99, 203, 1),
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
