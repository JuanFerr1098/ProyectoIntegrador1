import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newtonapp/shared/drawer_menu.dart';

class AprendizajeMulti extends StatelessWidget {
  const AprendizajeMulti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: myAppBar(context), // Organizar
      drawer: DrawerMenu(),
      backgroundColor: Colors.white, //Fondo de la pantalla
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            botones(context),
          ],
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
            botonTema(context,const Color.fromRGBO(145, 99, 203, 1),'Truco 1','multTruco1'),
            botonTema(context,const Color.fromRGBO( 0, 180, 216, 1),'Truco 2','multTruco2'),
            botonTema(context,const Color.fromRGBO(145, 99, 203, 1),'Truco 3','multTruco3'),
          ]),
    );
  }

  Widget botonTema(context, Color color, String nombre, String ruta) {
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
            Navigator.of(context).pushNamed(ruta);
          },
          child: Text(
            nombre,
            style: TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              fontSize: 25.0,
            ),
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
      title:  Text('Trucos Multipliación',
        style: TextStyle(
                fontFamily: 'QBold', 
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.white,
              ),),
      actions: <Widget>[
        IconButton(
          //atras
          iconSize: 35.0,
          onPressed: ()  {
            Navigator.of(context).pop();
              /*Navigator.of(context).pushNamedAndRemoveUntil(
                'index', (Route<dynamic> route) => false);*/
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
