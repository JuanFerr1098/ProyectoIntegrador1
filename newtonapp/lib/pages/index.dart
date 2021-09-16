import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/colors.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //backgroundColor: Colors.purple.shade700, //Fondo de la pantalla
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
                color: Color.fromRGBO( 123, 31, 162, 1),
                //color: Colors.purple700,
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
          minWidth: 220.0,
          
          color: Color.fromRGBO( 7, 194, 184, 1),
          height: 60.0,
          //color: const Color (0x00ffe6),
          //color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
           //Navigator.of(context).pushNamed('login');
           Navigator.of(context).pushNamed('index');
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontFamily: 'QRegular',
              color: Colors.white,
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
          minWidth: 220.0,
          height: 60.0,
          color: Color.fromRGBO( 7, 194, 184, 1),
          //color: Colors.deepPurple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('register');
          },
          child: Text(
            'Registro',
            style: TextStyle(
              color: Colors.white,
              //color: Colors.purple.shade700,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
