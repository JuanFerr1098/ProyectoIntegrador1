import 'package:flutter/material.dart';
import 'package:newtonapp/pages/aprendizaje/aprendizaje.dart';
import 'package:newtonapp/pages/aprendizaje/aprendizaje_div.dart';
import 'package:newtonapp/pages/aprendizaje/aprendizaje_multi.dart';
import 'package:newtonapp/pages/aprendizaje/aprendizaje_resta.dart';
import 'package:newtonapp/pages/aprendizaje/aprendizaje_suma.dart';
import 'package:newtonapp/pages/aprendizaje/div/division_truco1.dart';
import 'package:newtonapp/pages/aprendizaje/multi/mult_truco1.dart';
import 'package:newtonapp/pages/aprendizaje/multi/mult_truco2.dart';
import 'package:newtonapp/pages/aprendizaje/multi/mult_truco3.dart';
import 'package:newtonapp/pages/aprendizaje/resta/resta_truco1.dart';
import 'package:newtonapp/pages/aprendizaje/resta/resta_truco2.dart';
import 'package:newtonapp/pages/aprendizaje/resta/resta_truco3.dart';
import 'package:newtonapp/pages/aprendizaje/suma/suma_truco2.dart';
import 'package:newtonapp/pages/aprendizaje/suma/suma_truco3.dart';
import 'package:newtonapp/pages/comentarios.dart';
import 'package:newtonapp/pages/perfil/edit_profile_page.dart';
import 'package:newtonapp/pages/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newtonapp/pages/home.dart';
import 'package:newtonapp/pages/perfil/perfil_page.dart';
import 'package:newtonapp/pages/auth/register_page.dart';
import 'package:newtonapp/pages/auth/signin_page.dart';
import 'package:newtonapp/pages/aprendizaje/suma/suma_truco1.dart';
import 'package:newtonapp/pages/prueba/prueba_preguntas.dart';
import 'package:newtonapp/pages/retos/tipo_reto.dart';
import 'package:newtonapp/pages/splashscreen.dart';
import 'package:newtonapp/shared/acerca_de.dart';
import 'package:newtonapp/shared/coming_soon.dart';
import 'package:newtonapp/pages/prueba/prueba_home.dart';

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
        debugShowCheckedModeBanner:
            false, // desaparecer el cosito de debug arriba
        title: 'Newton APP',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
         
        ),
      

        home: const SplahScreen(),
        routes: {
          'home': (_) => const Index(),
          'login': (_) => const SignInPage(),
          'register': (_) => const RegisterPage(),
          'index': (_) => const IndexPage(),
          'aprendizaje': (_) => const Aprendizaje(),
          'perfil': (_) => const PerfilUser(),
          'editarPerfil': (_) => const EditProfile(),
          'aprendizajeSuma': (_) => const AprendizajeSuma(),
          'aprendizajeResta': (_) => const AprendizajeResta(),
          'aprendizajeMulti': (_) => const AprendizajeMulti(),
          'aprendizajeDivi': (_) => const AprendizajeDivi(),
          'sumaTruco1': (_) => const SumaTruco1(),
          'sumaTruco2': (_) => const SumaTruco2(),
          'sumaTruco3': (_) => const SumaTruco3(),
          'restaTruco1': (_) => const RestaTruco1(),
          'restaTruco2': (_) => const RestaTruco2(),
          'restaTruco3': (_) => const RestaTruco3(),
          'multTruco1': (_) => const MultTruco1(),
          'multTruco2': (_) => const MultTruco2(),
          'multTruco3': (_) => const MultTruco3(),
          'DivTruco1': (_) => const DivTruco1(),
          'retosZone': (_) => TipoReto(),
          'acercaDe': (_) => const AcercaDe(),
          'ComingSoon': (_) => const ComingSoon(),
          'comentarios': (_) => Comentarios(),
          'prueba': (_) => const PruebaHome(),
          'pruebapreguntas': (_) => const PruebasZone(),
        });
  }
}
