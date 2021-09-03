import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtonapp/pages/signin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//final Register_Controller register_controller = Register_Controller();
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;

class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registrate';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
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
              await _register();
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

        db.collection('pensadores').doc(user.uid).set(
            {'nombre': _nameController.text, 'correo': _emailController.text});

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        setState(() {
          _success = true;
        });
      }
    } catch (e) {
      String aviso;
      if (_nameController.text == '') {
        aviso = "Por favor ingrese su nombre";
      } else if (e.toString().contains("firebase_auth/email-already-in-use")) {
        aviso = "El correo ya existe";
      } else if (_passwordController.text.length < 6) {
        aviso = "La contraseña debe tener 6 caracteres minimo";
      } else {
        aviso = "Por favor ingrese un correo válido";
      }
      Fluttertoast.showToast(
          msg: aviso,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
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
