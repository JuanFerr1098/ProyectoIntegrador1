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
      appBar: AppBar(
        title: const Text('Logueate'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            //Ingreso del Email del Login
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: TextFormField(
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
          Container(
              //Boton para Ingresar
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(
                //Aqui  está el Boton
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
          Container(
              //Boton para Ingresar por Google
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(
                //Aqui  está el Boton
                icon: Icons.emoji_emotions,
                backgroundColor: Colors.pink,
                text: 'Google',
                onPressed: () async {
                  _signInWithGoogle();
                  /*if (_formKey.currentState!.validate()) {
                    await _signInWithGoogle();
                  }*/
                },
              )),
          Container(
              //Boton para Retroceder
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SignInButtonBuilder(
                  //Aqui  está el Boton
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

  //El codigo para registrar con Google
  Future<void> _signInWithGoogle() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          return;
        }
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }
      /*final user = userCredential.user;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Sign In ${user.uid} with Google'),
      ));*/
    } catch (e) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error al ingresar'),
          content: const Text(
              'EL correo de Goolge es invalido'),
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
