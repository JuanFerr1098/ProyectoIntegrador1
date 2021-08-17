import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:newtonapp/pages/signin_page.dart';
import 'package:newtonapp/pages/register_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Register_Controller extends State<RegisterPage>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //Los controller es donde guarda las variables, creo que funciona asi

  bool _success = false;
  String _userEmail = '';

  Future<void> _register() async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email.toString();
        });
        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        setState(() {
          _success = true;
        });
      }
    } catch (e) {
      if (_passwordController.text.length < 6) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error al registrar'),
            content:
                const Text('La contraseña debe tener al menos 6 caracteres'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }else if(e.toString() == "firebase_auth/email-already-in-use"){}
       else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error al registrar'),
            content: const Text(
                'El correo digitado ya se encuentra registrado'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

//El dispose limpia las variables, creo que es para evitar errores en la logica
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}