import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/providers/user_provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PerfilUser extends StatefulWidget {
  final String title = 'Perfil';
  const PerfilUser({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PerfilUser();
}

class _PerfilUser extends State<PerfilUser> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return FutureBuilder<DocumentSnapshot>(
        future: UserProvider(uid: _auth.currentUser!.uid).getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            return perfil(data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget perfil(Map<String, dynamic> data) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Form(
        child: Column(
          children: <Widget>[
            texto('Hola ' + data['nombre']),
            texto('Tu correo es ' + data['correo']),
            edad(data['edad']),
            botonEditPerfil(),
          ],
        ),
      ),
    );
  }

  Widget texto(String txt){
    return Container(
      padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          txt,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
          ),
    );
  }

  /*Widget nombre(String name) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          'Hola, $name!',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  Widget correo(String correo) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          'Tu correo es $correo',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }*/

  Widget edad(String? edad) {
    if (edad != null) {
      return Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            'Tu edad es $edad',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ));
    } else {
      return Container(); // Container vacio por si un dato es null
    }
  }

  Widget botonEditPerfil() {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          onPressed: () async {
            Navigator.of(context).pushNamed('editarPerfil');
          },
          child: const Text(
            'Editar Perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
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
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.purple.shade700,
            onPressed: () => Navigator.of(context).pushNamed('index'));
      }),
    );
  }  
}
