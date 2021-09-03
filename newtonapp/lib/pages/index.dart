import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/pages/register_page.dart';
import 'package:newtonapp/pages/signin_page.dart';
import 'package:newtonapp/pages/aprendizaje.dart';
import 'package:newtonapp/pages/index_page.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700, //Fondo de la pantalla
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
          children: <Widget>[
            Text(
              'Bienvenido a \nNewton App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
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
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInPage()));
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.purple.shade700,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonRegistro(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegisterPage()));
          },
          child: Text(
            'Registro',
            style: TextStyle(
              color: Colors.purple.shade700,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
