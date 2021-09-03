import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newtonapp/pages/aprendizaje.dart';
import 'package:newtonapp/pages/perfil_page.dart';
import 'package:newtonapp/pages/retos.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class IndexPage extends StatefulWidget {
  /// The page title.
  final String title = 'Inicio';
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _IndexPage();
}

class _IndexPage extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textoInicial(context),
          botonAprendizaje2(context),
          botonRetos2(context),
          botonPerfil(context),
          botonDeslogueo(),
        ],
      ),
      backgroundColor: Colors.white, //Color de Fondo
    );
  }

  Widget textoInicial(context) {
    return Container(
      //color: Colors.amber[600],
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.all(50),

      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '¿A donde quieres ir?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.purple.shade700,
              ),
            ),
          ]),
    );
  }

  Widget botonAprendizaje2(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.purple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Aprendizaje()));
          },
          child: Text(
            'Aprendizaje',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonRetos2(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.purple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Retos()));
          },
          child: Text(
            'Retos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonPerfil(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.purple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PerfilUser()));
          },
          child: Text(
            'Perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
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
          text: 'SALIR',
          onPressed: () async {
            await _logOut();
            /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));*/
          },
        ));
  }

  Future<void> _logOut() async {
    await _auth.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
