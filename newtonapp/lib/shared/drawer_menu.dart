import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtonapp/providers/user_provider.dart';
import 'package:newtonapp/providers/auth.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  final AuthService _authS = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<DocumentSnapshot>(
          future: UserProvider(uid: _authS.userActualUid()).getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic>? data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return _drawer(data, context);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget _drawer(Map<String, dynamic> data, BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _buildDrawerHeader(data['nombre']),
        const Divider(),
        _buildDrawerItem(
          
            icon: Icons.home,
            
            text: 'Home',
            
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                'index', (Route<dynamic> route) => false);
            }),
        _buildDrawerItem(
            icon: Icons.account_circle,
            text: 'Perfil',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('perfil');
            }),
        _buildDrawerItem(
            icon: Icons.book,
            text: 'Aprendizaje',
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                'aprendizaje', ModalRoute.withName('index'));
            }),
        _buildDrawerItem(
            icon: Icons.my_library_books,
            text: 'Retos',
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                'retosZone', ModalRoute.withName('index'));
            }),
        const Divider(),
        ListTile(
          title: const Text('Acerca de'),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                'acercaDe', ModalRoute.withName('index'));
          },
        ),
      ],
    );
  }

  Widget _buildDrawerHeader(String name) {
    // Se puede usar DrawerHeader, pero toca ver como funciona
    return Container(
        padding: const EdgeInsets.all(50),
        child: Form(
            child: Column(
          children: [
            Icon(
              Icons.account_box,
              color: const Color.fromRGBO( 145, 99, 203, 1),
              size: 100.0,
            ),
            Text(name),
          ],
        )));
  }

  Widget _buildDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon,
          color:const Color.fromRGBO( 0, 180, 216, 1),),
          
          
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text!,
            style: TextStyle(
                //color: const Color.fromRGBO( 145, 99, 203, 1),
                //color: Colors.white,
                color:Colors.grey,
                fontFamily: 'PMedium',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
