import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/pages/retos/retos.dart';
import 'package:newtonapp/shared/drawer_menu.dart';
import 'package:flutter/widgets.dart';

class TipoReto extends StatelessWidget {
  TipoReto({Key? key}) : super(key: key);
  final List crearReto = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: myAppBar(context), // Organizar
      drawer: DrawerMenu(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                texto(),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              botonTipoReto(context, 'time30s', '30 Segundos'),
              //botonTipoReto2(context, 'memory', 'Memoria'),
              botonTipoReto2(context, '5preg', '5 Preguntas'),
            ],
          ),
        ],
      ),
    );
  }

  Widget texto() {
    return const Text(
      'Bienvenido al \nmódulo de Retos,\nelija una modalidad:',
      style: TextStyle(
        color: Color.fromRGBO(145, 99, 203, 1),
        //color: Colors.white,
        fontFamily: 'QBold',
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
      ),
    );
  }

  Widget botonTipoReto(context, String tipo, String texto) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO(0, 180, 216, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            crearReto.add(tipo);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Retos(crearReto: crearReto)));
          },
          child: Text(texto,
              style: const TextStyle(
                fontFamily: 'QBold',
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )),
        ));
  }

  Widget botonTipoReto2(context, String tipo, String texto) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO(145, 99, 203, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('ComingSoon');
          },
          child: Text(
            texto,
            style: const TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  PreferredSizeWidget? myAppBar(context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 180, 216, 1),
      elevation: 0.0,
      leading: Builder(builder: (context) {
        return IconButton(
          iconSize: 40.0,
          icon: const Icon(Icons.more_vert),
          color: Colors.white,
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      actions: <Widget>[
        IconButton(
          //atras
          iconSize: 35.0,
          onPressed: () async {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                'index', (Route<dynamic> route) => false);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),

          color: Colors.white,
        ),
      ],
    );
  }
}
