import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';

class Prueba extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.purple.shade600,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        //width: double.infinity, // para que ocupe todo el ancho 
          children: <Widget>[
          textHeader(context),
          /*Container(
              height: MediaQuery.of(context).size.height*0.5,
              //width: MediaQuery.of(context).size.width*0.5,
              child:  
                Text(
                  'Bienvenido a',
                  style: TextStyle(
                      fontSize:36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                  )
                ),
                
            /*/
                    Text(
              'Newton App',
              style: TextStyle(
                  fontSize:36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
              )
            ),*/
            ), */

 /*         Container(
            height: MediaQuery.of(context).size.height*0.5,
            //width: MediaQuery.of(context).size.width*0.5,
            child:
            botonLogin(),
          ),*/  
          ]
      ),
    );
  } //widget

  Widget textHeader(context){
    
    return Padding(
      
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal:30.0),
      child:Column(
        
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
      Text(
          'Bienvenido a',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          )
        ),
      Text(
          'Newton App',
                style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          )
        ),
      ],
    ),
    );
  }

  Widget botonLogin() {
  return Container(
            //Boton Para ir al Login de la App
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              //Aqui esta las config del Boton
              icon: Icons.verified_user,
              iconColor: Colors.purple.shade700,
              backgroundColor: Colors.white,
              text: 'Login',
              textColor: Colors.purple.shade700,
              onPressed: () {
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignInPage()));
              */},
            ),
          );
}

} //class
