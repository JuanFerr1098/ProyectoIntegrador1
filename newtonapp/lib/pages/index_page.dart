//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/providers/auth.dart';
//import 'package:newtonapp/providers/user_provider.dart';
import 'package:newtonapp/shared/drawer_menu.dart';

class IndexPage extends StatefulWidget {
  /// The page title.
  final String title = 'Inicio';
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _IndexPage();
}

class _IndexPage extends State<IndexPage> {
  final AuthService _authS = AuthService();

  @override
  Widget build(BuildContext context) {
    /*return FutureBuilder<DocumentSnapshot>(
        future: UserProvider(uid: _authS.userActualUid()).getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            return _pantalla(context);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });*/
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return _pantalla(context);
  }

  Widget _pantalla(context) {
    return Scaffold(
      appBar: myAppBar(context),
      drawer: DrawerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textoInicial(context),
          botonAprendizaje2(context),
          botonRetos2(context),
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
            Navigator.of(context).pushNamed('aprendizaje');
          },
          child: const Text(
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
            Navigator.of(context).pushNamed('retosZone');
          },
          child: const Text(
            'Retos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  PreferredSizeWidget? myAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Builder(builder: (context) {
        return IconButton(
          iconSize: 40.0,
          icon: const Icon(Icons.more_vert),
          color: Colors.purple.shade700,
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      actions: <Widget>[
        IconButton(
          //atras
          iconSize: 40.0,
          onPressed: () async {
            await _authS.logOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
                'home', (Route<dynamic> route) => false);
          },
          icon: const Icon(Icons.logout_rounded),
          color: Colors.purple.shade700,
        ),
      ],
    );
  }
}
