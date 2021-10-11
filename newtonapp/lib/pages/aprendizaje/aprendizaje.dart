import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/providers/auth.dart';
import 'package:newtonapp/providers/user_provider.dart';
import 'package:newtonapp/shared/drawer_menu.dart';
import 'package:newtonapp/shared/icons.dart';

class Aprendizaje extends StatelessWidget {
 Aprendizaje({Key? key}) : super(key: key);
 final AuthService _authS = AuthService();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: myAppBar(context), // Organizar
      drawer: DrawerMenu(),
      backgroundColor: Colors.white,
      //backgroundColor: Colors.purple.shade700, //Fondo de la pantalla
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //titulo(context),
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
      height: MediaQuery.of(context).size.height * .5,
      padding: const EdgeInsets.all(50),

      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Bienvenido a',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            Text(
              'Aprendizaje',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            )
          ]),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                botonSuma(context),
                botonDiv(context),
                     ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              botonMult(context),
            
            botonResta(context),
              ]
            ),
           
          ]),
    );
  }

  Widget botonSuma(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 150.0,
          height: 150.0,
          color: const Color.fromRGBO( 145, 99, 203, 1),//lila
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('aprendizajeSuma');
          },
          child: Icon(
            MyIcons.add,
            color: Colors.white,
            size: 50,
          ),
        ));
  }

  Widget botonResta(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 150.0,
          height: 150.0,
          color: const Color.fromRGBO( 145, 99, 203, 1),//turquesa
          //color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {},
          child: Icon(
            MyIcons.minus,
            color: Colors.white,
            size: 50,
          ),
        ));
  }

  Widget botonMult(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 150.0,
          height: 150.0,
           color: const Color.fromRGBO( 0, 180, 216, 1),
          //color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {},
          child: Icon(
            MyIcons.mult,
            color: Colors.white,
            size: 50,
          ),
        ));
  }

  Widget botonDiv(context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
         minWidth: 150.0,
          height: 150.0,
          color: const Color.fromRGBO( 0, 180, 216, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: () {},
          child: Icon(
            MyIcons.divide,
            color: Colors.white,
            size: 50,
          ),
        ));
  }

    PreferredSizeWidget? myAppBar(context) {
    return AppBar(
      backgroundColor:  const Color.fromRGBO( 0, 180, 216, 1),
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
          iconSize: 30.0,
          onPressed: ()  {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'aprendizaje', ModalRoute.withName('index'));
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
