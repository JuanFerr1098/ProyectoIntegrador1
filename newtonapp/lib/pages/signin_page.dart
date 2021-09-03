import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newtonapp/pages/index_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget {
  /// The page title.
  final String title = 'Logueate';

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //Los controller es donde guarda las variables, creo que funciona asi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent, //Fondo de la pantalla
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text('Login'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //Ingreso del Email del Login
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(
              //Aqui esta la entrada de texto
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Ingresa tu Email',
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true),
              /*validator: (String? value) {//Es probable que no se necesite, lo dejamos ahi por ahora
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },*/
            ),
          ),
          Container(
            //Ingreso de la Contraseña del Login
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(
              //Aqui esta la entrada de texto
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'Ingresa tu Contraseña',
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true),
              /*validator: (String? value) {//Es probable que no se necesite, lo dejamos ahi por ahora
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },*/
              obscureText: true, //Esto hace que aparezca ******
            ),
          ),
          botonIngresar(context),
        ],
      ),
    );
  }

  Widget botonIngresar(context) {
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
            _signInWithEmailAndPassword();
          },
          child: Text(
            'Ingresar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

//Funcion que me permire realizar el ingreso a la App mediante Correo y Contraseña
  Future<void> _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const IndexPage()));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "El correo o la contraseña son incorrectos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
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
