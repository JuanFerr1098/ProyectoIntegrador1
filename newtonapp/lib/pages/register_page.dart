import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newtonapp/providers/auth.dart';

//final FirebaseFirestore db = FirebaseFirestore.instance;

class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registrate';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _authS = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //Los controller es donde guarda las variables, creo que funciona asi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade700,
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
              botonRegistrar(context),
            ],
          ),
        ));
  }

  Widget nameText() {
    return Container(
      //Ingreso del Nombre del Registro
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        //Aqui esta la entrada de texto
        controller: _nameController,
        decoration: const InputDecoration(
          labelText: 'Ingresa tu Nombre',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      //Ingreso del Correo del Registro
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        //Aqui esta la entrada de texto
        controller: _emailController,
        decoration: const InputDecoration(
          labelText: 'Ingresa tu Correo',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      //Ingreso de la Contaseña del Registro
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        //Aqui esta la entrada de texto
        controller: _passwordController,
        decoration: const InputDecoration(
          labelText: 'Ingresa tu Contraseña',
          border: OutlineInputBorder(),
        ),
        obscureText: true,
      ),
    );
  }

  Widget botonRegistrar(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: Colors.purple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              //await _register();
              dynamic result = await _authS.registerWithEmailAndPassword(
                  _nameController.text,
                  _emailController.text, 
                  _passwordController.text);
              if (result != null) {
                Navigator.of(context).pushNamed('login');
              }
            }
          },
          child: Text(
            'Registrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
