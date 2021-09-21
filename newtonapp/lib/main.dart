import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/pages/aprendizaje.dart';
import 'package:newtonapp/pages/aprendizaje_suma.dart';
import 'package:newtonapp/pages/edit_profile_page.dart';
import 'package:newtonapp/pages/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newtonapp/pages/index_page.dart';
import 'package:newtonapp/pages/perfil_page.dart';
import 'package:newtonapp/pages/register_page.dart';
import 'package:newtonapp/pages/retos.dart';
import 'package:newtonapp/pages/retos_zone.dart';
import 'package:newtonapp/pages/signin_page.dart';
import 'package:newtonapp/pages/suma_tema1.dart';
import 'package:newtonapp/pages/tipo_reto.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // desaparecer el cosito de debug arriba
      title: 'Newton APP',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: const Index(),
      routes:{
        'login': (_) => const SignInPage(),
        'register': (_) => const RegisterPage(),
        'index': (_) => const IndexPage(),
        'aprendizaje': (_) => const Aprendizaje(),
        //'retos': (_) => const Retos(),
        'perfil': (_) => const PerfilUser(),
        'editarPerfil': (_) => const EditProfile(),
        'aprendizajeSuma': (_) => const AprendizajeSuma(),
        'sumaTema1': (_) => const SumaTema1(),
        'retosZone': (_) => TipoReto(),
      }

    );
  }
}
// Truco MAchetazo
