import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/pages/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool USE_FIRESTORE_EMULATOR = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    //Creo que no se usa por que el valor es falso
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    print('Al parecer esto si se usa, la inicializacion local');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // desaparecer el cosito de debug arriba
      title: 'Newton APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Index(),
    );
  }
}
