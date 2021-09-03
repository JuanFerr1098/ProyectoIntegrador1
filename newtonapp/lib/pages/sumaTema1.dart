import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';


class SumaTema1 extends StatelessWidget{
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
                titulo(context),
                //botones(context),
                  ],
        ),
      ),
    );
  }
  Widget titulo(context) {
  return Container(
    //color: Colors.amber[600],
    width: double.infinity,
    //height:MediaQuery.of(context).size.height*.5,
    padding: const EdgeInsets.all(50),
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
                  Text('Bienvenido a',
                  style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  ),
                  Text('Tema 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  )                  
                ]
    ),
  );
  }

}


