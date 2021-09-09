import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/providers/auth.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (context) {
          return IconButton(
            iconSize: 40.0,
            icon: Icon(Icons.more_vert),
            color: Colors.purple.shade700,
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        //title: Text('Hi friend'),
        actions: <Widget>[
          IconButton(
            //atras
            iconSize: 40.0,
            onPressed: () async {
              await _authS.logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.logout_rounded),
            color: Colors.purple.shade700,
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * .5,
                padding: const EdgeInsets.all(50),
                child: Icon(
                  Icons.account_box,
                  color: Colors.purple.shade700,
                  size: 100.0,
                )),
            ListTile(
              title: const Text('Editar Perfil'),
              onTap: () {
                Navigator.of(context).pushNamed('editarPerfil');
              },
            ),
          ],
        ),
        // Populate the Drawer in the next step.
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //appBar(context),
          textoInicial(context),
          botonAprendizaje2(context),
          botonRetos2(context),
          botonPerfil(context),
          //botonDeslogueo(),
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
            Navigator.of(context).pushNamed('retos');
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
            Navigator.of(context).pushNamed('perfil');
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
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: Colors.purple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () async {
            await _authS.logOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
          child: Text(
            'Salir',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget appBar(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            //menu
            iconSize: 40.0,
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.more_vert),
            color: Colors.purple.shade700,
          ),
          IconButton(
            //atras
            iconSize: 40.0,
            onPressed: () async {
              await _authS.logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.logout_rounded),
            color: Colors.purple.shade700,
          ),
        ],
      ),
    );
  }
}
