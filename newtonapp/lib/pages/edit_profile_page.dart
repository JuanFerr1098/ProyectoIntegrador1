import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtonapp/providers/user_provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class EditProfile extends StatefulWidget {
  final String title = 'Editar el Perfil';

  const EditProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditPerfil();
}

class _EditPerfil extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: UserProvider(uid: _auth.currentUser!.uid).getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            return editarPerfil(data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget editarPerfil(Map<String, dynamic> data) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade700,
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              editarNombre(data),
              editarEdad(data),
              botonActualizar(data),
              botonCancelar()
            ],
          ),
        ));
  }

  Widget editarNombre(data) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
                labelText: 'Ingresa tu nombre',
                hintText: data['nombre'],
                border: const OutlineInputBorder())));
  }

  Widget editarEdad(data) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: TextFormField(
            controller: _edadController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Ingresa tu edad',
                hintText: data['edad'],
                border: const OutlineInputBorder())));
  }

  Widget botonActualizar(data) {
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
            UserProvider(uid: _auth.currentUser!.uid).actualizarDatos(
                data, _nameController.text, _edadController.text);
            Navigator.of(context).pushNamedAndRemoveUntil(
                'perfil', ModalRoute.withName('index'));
          },
          child: Text(
            'Actualizar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonCancelar() {
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
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
