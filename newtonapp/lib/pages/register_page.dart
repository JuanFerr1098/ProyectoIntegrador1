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
  //Los controller es donde guarda las variables, creo que funciona asi

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
                //Ingreso del Nombre del Registro
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: TextFormField(
                  //Aqui esta la entrada de texto
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                //Ingreso del Correo del Registro
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: TextFormField(
                  //Aqui esta la entrada de texto
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu Correo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                //Ingreso de la Contaseña del Registro
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: TextFormField(
                  //Aqui esta la entrada de texto
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                  //Boton de Registro
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: SignInButtonBuilder(
                    //Aqui esta el Boton
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
                  //Boton para retroceder
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: SignInButtonBuilder(
                      //Aqui esta el boton
                      icon: Icons.backspace,
                      backgroundColor: Colors.pink,
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Atras')),
              Container(
                alignment: Alignment.center,
                child: Text(_success == null
                    ? ''
                    : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed')),
              )
            ],
          ),
        ));
  }

  //Funcion que me permite realizar el registro de una persona
  Future<void> _register() async {
    final user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email.toString();
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

//El dispose limpia las variables, creo que es para evitar errores en la logica
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}