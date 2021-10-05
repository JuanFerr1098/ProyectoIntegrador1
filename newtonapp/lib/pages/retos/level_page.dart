import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/pages/retos/retos_zone.dart';

class Level extends StatelessWidget {
  final List crearReto;
  const Level({Key? key, required this.crearReto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            texto(),
            botoneslvl(context, '1cifra', '1 Cifra'),
            botoneslvl(context, '2cifra', '2 Cifras'),
            botoneslvl(context, '3cifra', '3 Cifras'),
            botoneslvl(context, '4cifra', '4 Cifras'),
            botonCancelar(context),
          ],
        ),
      ),
    );
  }

  Widget texto() {
    return const Text('Escoja el Level');
  }

  Widget botoneslvl(context, String lvl, String texto) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 90.0,
          height: 90.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {
            crearReto.add(lvl);
            Navigator.push(
                context, MaterialPageRoute(
                    builder: (BuildContext context) =>
                        RetosPage(crearReto: crearReto)));
          },
          child: Text(texto),
        ));
  }

  Widget botonCancelar(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: const Color.fromRGBO( 7, 194, 184, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
           Navigator.of(context).pushNamedAndRemoveUntil('index', (route) => false);
          },
          child: const Text(
            'Cancelar',
            style: TextStyle(
              fontFamily: 'QRegular',
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
