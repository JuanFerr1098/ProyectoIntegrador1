import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:newtonapp/pages/index_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
          //backgroundColor: Colors.purple.shade700, //Fondo de la pantalla
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
              
              //backgroundColor: Colors.white,
              //fillColor: Colors.white,
              //Aqui esta la entrada de texto
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: 'Ingresa tu Email', border: OutlineInputBorder()),
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
                  hintText: 'Ingresa tu Contraseña',
                  border: OutlineInputBorder()),
              /*validator: (String? value) {//Es probable que no se necesite, lo dejamos ahi por ahora
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },*/
              obscureText: true, //Esto hace que aparezca ******
            ),
          ),
         /* Container(
              //Boton para Ingresar
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(
                //Aqui  está el Boton
                icon: Icons.email,
                backgroundColor: Colors.purple.shade700,
                text: 'Ingresar',
                onPressed: () async {
                  _signInWithEmailAndPassword();
                  /*if (_formKey.currentState!.validate()) {
                    await _signInWithEmailAndPassword();
                  }*/
                },
              )),*/
              /*
          Container(
              //Boton para Retroceder
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(
                  //Aqui  está el Boton
                  icon: Icons.backspace,
                  backgroundColor: Colors.purple.shade700,
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Atras')),*/
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
                      height:60.0,
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
                                fontSize:20.0,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
              )
              );
  }

//Funcion que me permire realizar el ingreso a la App mediante Correo y Contraseña
  Future<void> _signInWithEmailAndPassword() async {
    try {
      // ignore: unused_local_variable
      final user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      int dur = 10;
      Future.delayed(Duration(milliseconds: dur), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const IndexPage()));
      });
    } catch (e) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error al ingresar'),
          content: const Text(
              'El correo o la contraseña son incorrectos o estan vacios los campos'),
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
//El dispose limpia las variables, creo que es para evitar errores en la logica
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
