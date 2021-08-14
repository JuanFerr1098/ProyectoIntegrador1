import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:newtonapp/pages/index_page.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter/foundation.dart'show kIsWeb;

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget{
  /// The page title.
  final String title = 'Logueate';

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logueate'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(
              // Ingresa tu Email
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: 'Ingresa tu Email', border: OutlineInputBorder()),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              obscureText: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(
              // Ingresa tu contraseña
              controller: _passwordController,
              decoration: const InputDecoration(
                  hintText: 'Ingresa tu Contraseña',
                  border: OutlineInputBorder()),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              obscureText: true,
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButton(Buttons.Email, text: 'Ingresar',
                  onPressed: () async {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>IndexPage()));
                
                /*if (_formKey.currentState!.validate()) {
                  await _signInWithEmailAndPassword();
                }*/
                  },
              )
          ),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(
                  icon: Icons.backspace,
                  backgroundColor: Colors.pink,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Atras'
              )
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      _auth.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text
        ); 
    } catch (e) {
      
    }
  }
}
