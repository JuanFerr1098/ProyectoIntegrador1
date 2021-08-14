import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:newtonapp/pages/index_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget {
  /// The page title.
  final String title = 'Logueate';

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //Los controller es donde guarda las variables, creo que funciona asi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logueate'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(//Ingreso del Email del Login
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(//Aqui esta la entrada de texto
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: 'Ingresa tu Email', 
                  border: OutlineInputBorder()),
              /*validator: (String? value) {//Es probable que no se necesite, lo dejamos ahi por ahora
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },*/
            ),
          ),
          Container(//Ingreso de la Contraseña del Login
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(//Aqui esta la entrada de texto
              controller: _passwordController,
              decoration: const InputDecoration(
                  hintText: 'Ingresa tu Contraseña',
                  border: OutlineInputBorder()),
              /*validator: (String? value) {//Es probable que no se necesite, lo dejamos ahi por ahora
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },*/
              obscureText: true,//Esto hace que aparezca ******
            ),
          ),
          Container(//Boton para Ingresar
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(//Aqui  está el Boton
                icon: Icons.email,
                backgroundColor: Colors.pink,
                text: 'Ingresar',
                onPressed: () async {
                  _signInWithEmailAndPassword();
                  /*if (_formKey.currentState!.validate()) {
                    await _signInWithEmailAndPassword();
                  }*/
                },
              )),
          Container(//Boton para Retroceder
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(//Aqui  está el Boton
                  icon: Icons.backspace,
                  backgroundColor: Colors.pink,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Atras')),
        ],
      ),
    );
  }

//Funcion que me permire realizar el ingreso a la App mediante Correo y Contraseña
  Future<void> _signInWithEmailAndPassword() async {
    final user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IndexPage()));
    });
  }

//El dispose limpia las variables, creo que es para evitar errores en la logica
   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
