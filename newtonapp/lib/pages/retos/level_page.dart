import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/pages/retos/retos_zone.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/shared/icons.dart';
import 'package:newtonapp/shared/drawer_menu.dart';

class Level extends StatelessWidget {
  final List crearReto;
  const Level({Key? key, required this.crearReto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: myAppBar(context), // Organizar
        drawer: DrawerMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            texto(),
            botoneslvl(
              context,
              '1cifra',
              'Fácil',
              const Color.fromRGBO(0, 180, 216, 1),
            ),
            botoneslvl(
              context,
              '2cifra',
              'Intermedio',
              const Color.fromRGBO(145, 99, 203, 1),
            ),
            botoneslvl(context, '3cifra', 'Difícil',
                const Color.fromRGBO(0, 180, 216, 1)),
            botoneslvl(
              context,
              '4cifra',
              'Avanzado',
              const Color.fromRGBO(145, 99, 203, 1),
            ),
            //botonCancelar(context),
          ],
        ),
      ),
    );
  }

  Widget texto() {
    return Container(
      //color: Colors.amber[600],
      width: double.infinity,
      //height:MediaQuery.of(context).size.height*.5,
      padding: const EdgeInsets.all(50),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Escoje el Nivel\nde dificultad:',
              style: TextStyle(
                fontFamily: 'QBold',
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: const Color.fromRGBO(145, 99, 203, 1),
              ),
            ),
          ]),
    );
  }

  Widget botoneslvl(context, String lvl, String texto, Color color) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            crearReto.add(lvl);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        RetosPage(crearReto: crearReto)));
          },
          child: Text(
            texto,
            style: TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  Widget botonCancelar(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: const Color.fromRGBO(7, 194, 184, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'retosZone', ModalRoute.withName('index'));
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
          iconSize: 40.0,
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'retosZone', ModalRoute.withName('index'));
          },
          icon: const Icon(Icons.close_rounded),
          color: Colors.white,
        ),
      ],
    );
  }
}
