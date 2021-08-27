import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class IndexPage extends StatefulWidget {
  /// The page title.
  final String title = 'Inicio';

  const IndexPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndexPage();
}

class _IndexPage extends State<IndexPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Newton App Re-Loco'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textoInicial(),
          botonAprendizaje(),
          botonRetos(),
          botonDeslogueo(),
        ],
      ),
      backgroundColor: Colors.purple.shade200, //Color de Fondo
    );
  }

  Widget textoInicial() {
    return Container(
      //Texto inicial en la App
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: const Text('Elija a donde quere ir'),
    );
  }
  Widget botonAprendizaje() {
    return Container(
      // Boton para ir a la zona de Aprendizaje
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: SignInButtonBuilder(
        //Aqui esta las config del Boton
        icon: Icons.verified_user,
        backgroundColor: Colors.orange,
        text: 'Aprendizaje',
        onPressed: () {
          /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));*/
        },
      ),
    );
  }
  Widget botonRetos() {
    return Container(
        //Boton para ir a los Retos de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SignInButtonBuilder(
          //Aqui esta las config del Boton
          icon: Icons.person_add,
          backgroundColor: Colors.indigo,
          text: 'Retos',
          onPressed: () {
            /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));*/
          },
        ));
  }

  Widget botonDeslogueo() {
    return Container(
        //Boton para ir a los Retos de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SignInButtonBuilder(
          //Aqui esta las config del Boton
          icon: Icons.logout,
          backgroundColor: Colors.indigo,
          text: 'SAlIR',
          onPressed: () async {
            await _logOut();
            /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));*/
          },
        ));
  }

  Future<void> _logOut() async {
    await _auth.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
