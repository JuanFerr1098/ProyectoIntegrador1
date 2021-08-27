import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:newtonapp/pages/signin_page.dart';
//import 'package:newtonapp/controller/register_controller.dart';

//final Register_Controller register_controller = Register_Controller();
final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registrate';

  const RegisterPage({Key? key}) : super(key: key);

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
          backgroundColor: Colors.purple.shade700,
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
              botonRegistrar(context),
              Container(
                alignment: Alignment.center,
                child: Text(_success == false
                    ? ''
                    : (_success
                        ? 'Successfully registered ' + _userEmail
                        : 'Registration failed')),
              )
            ],
          ),
        ));
  }
Widget botonRegistrar(context) {
  return Container(
                    //Boton para ir al Registro de la App
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: 230.0,
                      height:60.0,
                      color: Colors.purple.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                      ),
                        onPressed: ()async {
                      if (_formKey.currentState!.validate()) {
                        await _register();
                      }
                                      },
                      child: Text(
                              'Registrar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:20.0,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
              )
              );
  }

  //Funcion que me permite realizar el registro de una persona
  Future<void> _register() async {
    try {
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
      }else if(e.toString().contains("firebase_auth/email-already-in-use")){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error al registrar'),
            content: const Text(
                'El correo ya existe'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error al registrar'),
            content: const Text(
                'Por favor ingrese un correo válido'),
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
}