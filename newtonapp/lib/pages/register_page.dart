import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registrate';

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success = false;
  String _userEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu Correo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu Contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: SignInButtonBuilder(
                    icon: Icons.person_add,
                    backgroundColor: Colors.blueGrey,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _register();
                      }
                    },
                    text: 'Registrate',
                  )),
              Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: SignInButtonBuilder(
                      icon: Icons.backspace,
                      backgroundColor: Colors.pink,
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Atras')),
            ],
          ),
        ));
  }

  Future<void> _register() async {
    /*final User user = await _auth
        .createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        ).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }*/
  }
}
