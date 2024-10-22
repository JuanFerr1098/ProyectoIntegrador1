//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/providers/auth.dart';
//import 'package:newtonapp/providers/user_provider.dart';
import 'package:newtonapp/shared/drawer_menu.dart';

import '../providers/user_provider.dart';

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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    //return _pantalla(context);
    return FutureBuilder<DocumentSnapshot>(
        future: UserProvider(uid: _authS.userActualUid()).getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            return _pantalla(context, data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _pantalla(context, data) {
    if (data['prueba']) {
      return SafeArea(
          child: Scaffold(
        appBar: myAppBar(context),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              textoInicial(context, data),
              botonPrueba(context)
            ]),
      ));
    } else {
      return SafeArea(
          child: Scaffold(
              appBar: myAppBar(context),
              drawer: DrawerMenu(),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    textoInicial(context, data),
                    botonAprendizaje2(context),
                    botonRetos2(context),
                  ])));
    }
    /* return Scaffold(
      appBar: myAppBar(context),
      drawer: DrawerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textoInicial(context),
          botonAprendizaje2(context),
          botonRetos2(context),
          botonPrueba(context)
        ],
      ),
      backgroundColor: Colors.white, //Color de Fondo
    );*/
  }

  Widget textoInicial(context, data) {
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
              data['prueba']
                  ? 'Para poder usar la app primero debes realizar la prueba'
                  : '¿A donde quieres ir?',
              style: const TextStyle(
                fontFamily: 'QBold',
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Color.fromRGBO(145, 99, 203, 1),
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
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO(0, 180, 216, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('aprendizaje');
          },
          child: const Text(
            'Aprendizaje',
            style: TextStyle(
              fontFamily: 'QBold',
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
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO(145, 99, 203, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('retosZone');
          },
          child: const Text(
            'Retos',
            style: TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonPrueba(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO(0, 180, 216, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('prueba');
          },
          child: const Text(
            'Prueba',
            style: TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  PreferredSizeWidget? myAppBar(context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 180, 216, 1),
      elevation: 0.0,
      leading: Builder(builder: (context) {
        return IconButton(
          iconSize: 40.0,
          icon: const Icon(Icons.more_vert),
          color: Colors.white,
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
          color: Colors.white,
        ),
      ],
    );
  }
}
