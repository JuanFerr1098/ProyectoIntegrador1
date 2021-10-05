import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/shared/drawer_menu.dart';
import 'package:newtonapp/shared/icons.dart';

class Aprendizaje extends StatelessWidget {
  const Aprendizaje({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(), // Organizar
      drawer: DrawerMenu(),
      backgroundColor: Colors.purple.shade700, //Fondo de la pantalla
      /*body: SizedBox(
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
      ),*/
      body: botones(context),
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
    /*return Container(
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
    );*/
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
            //botonlogin(context),
            botonSuma(context),
            botonResta(context),
            botonMult(context),
            botonDiv(context),
          ],
    );
  }

  Widget botonSuma(context) {
    return Container(
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
            Navigator.of(context).pushNamed('aprendizajeSuma');
          },
          child: Icon(
            MyIcons.add,
            color: Colors.purple.shade700,
            size: 35,
          ),
        ));
  }

  Widget botonResta(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 90.0,
          height: 90.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {},
          child: Icon(
            MyIcons.minus,
            color: Colors.purple.shade700,
            size: 35,
          ),
        ));
  }

  Widget botonMult(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 90.0,
          height: 90.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {},
          child: Icon(
            MyIcons.mult,
            color: Colors.purple.shade700,
            size: 35,
          ),
        ));
  }

  Widget botonDiv(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 90.0,
          height: 90.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {},
          child: Icon(
            MyIcons.divide,
            color: Colors.purple.shade700,
            size: 35,
          ),
        ));
  }
}
