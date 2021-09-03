import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtonapp/providers/user_provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final UserProvider up = UserProvider();

class Aprendizaje extends StatefulWidget {
  final String title = 'Zona de Aprendizaje';

  const Aprendizaje({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Aprendizaje();
}

class _Aprendizaje extends State<Aprendizaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text(widget.title),
      ),
    );
  }
}
