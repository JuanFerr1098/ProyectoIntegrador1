import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/providers/auth.dart';

final AuthService _authS = AuthService();

class Comentarios extends StatelessWidget {
  Comentarios({Key? key}) : super(key: key);

  final TextEditingController _comentarioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresa tu Comentario'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        addAutomaticKeepAlives: false,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          TextField(
            controller: _comentarioController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: 1,
            maxLines: 5,
          ),
          const Divider(),
          MaterialButton(
            minWidth: 230.0,
            height: 60.0,
            color: Colors.purple.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () async {
              enviarComentario(context);
            },
            child: const Text(
              'Enviar Comentario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  enviarComentario(context) {
    FirebaseFirestore.instance
        .collection('comentarios')
        .doc(DateTime.now().toString())
        .set({_authS.userActualUid(): _comentarioController.text},
            SetOptions(merge: true));
    Navigator.of(context)
        .pushNamedAndRemoveUntil('acercaDe', ModalRoute.withName('index'));
  }
}
