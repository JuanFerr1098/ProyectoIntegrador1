import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/src/material/colors.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(123,44, 191, 1),//Fondo de la pantalla
      //backgroundColor: const Color.fromRGBO( 145, 99, 203, 1),//Fondo de la pantalla
      body: cuerpo(context),
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

  Widget cuerpo(context) {
    return SafeArea(
        child: ListView(
      children: <Widget>[
        Container(
          height: 300,
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Color.fromRGBO(200, 107, 250, 1),
              Color.fromRGBO(123, 44, 191, 1),
            ]),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
                bottomRight: Radius.circular(90)),
          ),
          child: const Image(image: AssetImage('assets/images/logo.png')),
        ),
        botones(context),
      ],
    ));
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
          color: const Color.fromRGBO(255, 123, 0, 1), //naranja
          //color: const Color.fromRGBO( 7, 194, 184, 1), turquesa antiguo
          //color: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

          onPressed: () {
            Navigator.of(context).pushNamed('login');
            //Navigator.of(context).pushNamed('index');
          },

          child: const Text(
            'Entrar',
            style: TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              //color: Color.fromRGBO( 145, 99, 203, 1),
              fontSize: 25.0,
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
            color: const Color.fromRGBO(255, 123, 0, 1),
            //color: const Color.fromRGBO( 0, 180, 216, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('register');
            },
            child: const Text(
              'Registrarse',
              style: TextStyle(
                fontFamily: 'QBold',
                color: Colors.white,
                //color: Color.fromRGBO( 145, 99, 203, 1),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            )));
  }
}
