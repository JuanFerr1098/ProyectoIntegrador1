import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:newtonapp/pages/register_page.dart';
import 'package:newtonapp/pages/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newton APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Conquistaras a tu crush'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Newton App Re-Loco'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
                iconColor:Colors.purple.shade700,
                backgroundColor: Colors.white,
                text: 'Login',
                textColor: Colors.purple.shade700,
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
                  iconColor:Colors.purple.shade700,
                backgroundColor: Colors.white,
                textColor: Colors.purple.shade700,
                text: 'Register',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  )
          ),
        ],
      ),
      backgroundColor: Colors.purple.shade700,
    );
  }
}
