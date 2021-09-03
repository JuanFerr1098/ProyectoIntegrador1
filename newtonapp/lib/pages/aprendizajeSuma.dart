import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:newtonapp/pages/register_page.dart';
import 'package:newtonapp/pages/signin_page.dart';
import 'package:newtonapp/pages/prueba.dart';
import 'package:newtonapp/pages/sumaTema1.dart';

class AprendizajeSuma extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Fondo de la pantalla
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                botones(context),
                  ],
        ),
      ),
    );
  }

    Widget botones(context) { 
    return Container(
   // color: Colors.white60,
    width: double.infinity,
    
    //height:MediaQuery.of(context).size.height*.5,
    padding: const EdgeInsets.all(30),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
                botonTema1(context),
                botonTema2(context), 
                botonTema3(context), 
                botonTema4(context), 
                botonTema5(context), 
                botonTema6(context), 
           
                ]
    ),
  );
  }
    Widget botonTema1(context) {
    return Container(
                    //Boton para ir al Registro de la App
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: 240.0,
                      height:60.0,
                      color: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                      ),
                        onPressed: () {
                       Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  SumaTema1()));                
                      },
                            child: Text(
                              'Tema 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
              )              
              );
  }
    Widget botonTema2(context) {
    return Container(
                    //Boton para ir al Registro de la App
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: 240.0,
                      height:60.0,
                      color: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                      ),
                        onPressed: () {
                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */               
                      },
                            child: Text(
                              'Tema 2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
              )              
              );
  }
    Widget botonTema3(context) {
    return Container(
                    //Boton para ir al Registro de la App
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: 240.0,
                      height:60.0,
                      color: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                      ),
                        onPressed: () {
                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */               
                      },
                            child: Text(
                              'Tema 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
              )              
              );
  }
    Widget botonTema4(context) {
    return Container(
                    //Boton para ir al Registro de la App
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: 240.0,
                      height:60.0,
                      color: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                      ),
                        onPressed: () {
                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */               
                      },
                            child: Text(
                              'Tema 4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
              )              
              );
  }
    Widget botonTema5(context) {
    return Container(
                    //Boton para ir al Registro de la App
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: 240.0,
                      height:60.0,
                      color: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                      ),
                        onPressed: () {
                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */               
                      },
                            child: Text(
                              'Tema 5',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
              )              
              );
  }
    Widget botonTema6(context) {
    return Container(
                    //Boton para ir al Registro de la App
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: 240.0,
                      height:60.0,
                      color: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                      ),
                        onPressed: () {
                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()));      */               
                      },
                            child: Text(
                              'Tema 6',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
              )              
              );
  }

}