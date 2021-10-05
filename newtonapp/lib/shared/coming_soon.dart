import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(7, 194, 184, 1),
              Color.fromRGBO(123, 31, 162, 1),
            ],
          )),
          child: Center(
            child: GradientText(
                'Coming Soon',
                style: const TextStyle(
                  fontSize: 40.0,
                ),
                /*gradientType: GradientType.radial,
                radius: 2.5,*/
                colors: const [
                  Colors.black12,
                  Colors.white,
                  Colors.grey,
                ],
              ),
            /*Text(
              'Coming Soon!',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[Colors.red, Colors.green],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            ),*/
          ),
        ),
      ),
    );
  }
}

// Para el Fondo
// https://medium.com/flutter-community/how-to-improve-your-flutter-application-with-gradient-designs-63180ba96124

// Para la letra
// https://pub.dev/packages/simple_gradient_text
