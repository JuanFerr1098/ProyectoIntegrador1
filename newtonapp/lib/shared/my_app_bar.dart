import 'package:flutter/material.dart';

abstract class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

//Aun no funciona
  
  PreferredSizeWidget? myAppBar(BuildContext context){
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (context) {
          return IconButton(
            iconSize: 40.0,
            icon: const Icon(Icons.more_vert),
            color: Colors.purple.shade700,
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        title: const Text('NewtonApp'),
        actions: <Widget>[
          IconButton(
            //atras
            iconSize: 40.0,
            onPressed: () async {
              /*await _authS.logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);*/
            },
            icon: const Icon(Icons.logout_rounded),
            color: Colors.purple.shade700,
          ),
        ],
      );
  }
  
}