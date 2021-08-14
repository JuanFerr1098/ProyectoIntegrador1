import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:newtonapp/pages/register_page.dart';
import 'package:newtonapp/pages/signin_page.dart';

class IndexPage extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Newton App Re-Loco'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text('Bienvenido a su App para dominar el Calculo Mental'),
          ),          
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            
            child: SignInButtonBuilder(
                // Boton Logueo
                icon: Icons.verified_user,
                backgroundColor: Colors.orange,
                text: 'Aprendizaje',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                ),
                
          ),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(
                  // Boton Registro
                  icon: Icons.person_add,
                backgroundColor: Colors.indigo,
                text: 'Retos',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  )
          ),
        ],
      ),
      backgroundColor: Colors.purple.shade200,
    );
  }
}