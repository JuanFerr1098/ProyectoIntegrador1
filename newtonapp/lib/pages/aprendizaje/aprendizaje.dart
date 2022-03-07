import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/shared/drawer_menu.dart';
import 'package:newtonapp/shared/icons.dart';

class Aprendizaje extends StatelessWidget {
  final Color lila = const Color.fromRGBO(145, 99, 203, 1);
  final Color turquesa = const Color.fromRGBO(0, 180, 216, 1);

  const Aprendizaje({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(context), // Organizar
        drawer: DrawerMenu(),
        backgroundColor: Colors.white,
        //backgroundColor: Colors.purple.shade700, //Fondo de la pantalla
        body: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              titulo(context),
              botones(context),
            ],
          ),
      ),
    );
  }

  Widget titulo(context) {
    return Container(
      //color: Colors.amber[600],
      width: double.infinity,
      //height: MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.all(50),
      child: const Center(
        child: Text(
                'Bienvenido a\nAprendizaje',
                style: TextStyle(
                  fontFamily: 'QBold',
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
      ),
    );
  }

  Widget botones(context) {
    return Container(
      // color: Colors.white60,
      width: double.infinity,
      //height:MediaQuery.of(context).size.height*.5,
      padding: const EdgeInsets.all(30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              boton(context, 'aprendizajeSuma', lila, MyIcons.add),
              boton(context, 'aprendizajeDivi', turquesa, MyIcons.divide),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              boton(context, 'aprendizajeMulti', turquesa, MyIcons.minus),
              boton(context, 'aprendizajeResta', lila, MyIcons.mult),
            ]),
          ]),
    );
  }

  Widget boton(context, ruta, color, icono) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: MaterialButton(
        minWidth: 100,
        height: 100,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(ruta);
        },
        child: Icon(
          icono,
          //Icon(icono),
          color: Colors.white,
          size: 50,
        ),
      ),
    );
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
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'index', (Route<dynamic> route) => false);
            /*await _authS.logOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);*/
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
        ),
      ],
    );
  }
}
