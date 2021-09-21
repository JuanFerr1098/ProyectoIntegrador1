import 'package:flutter/material.dart';
import 'package:newtonapp/providers/user_provider.dart';
import 'package:newtonapp/models/user.dart';
import 'package:newtonapp/providers/auth.dart';

class DrawerMenu extends StatelessWidget {
  //const DrawerMenu({Key? key}) : super(key: key);

  final AuthService _authS = AuthService(); 

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          /*_buildDrawerItem(icon: Icons.home, text: 'Home', onTap: () => {
              Navigator.pushReplacementNamed(context, MyApp.home)
          }),*/
          _buildDrawerItem(
              icon: Icons.account_circle,
              text: 'Profile',
              onTap: () => {Navigator.of(context).pushNamed('perfil')}),
          /*_buildDrawerItem(icon: Icons.movie, text: 'Movies', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.movies)
          }),*/
          const Divider(),
          /*_buildDrawerItem(icon: Icons.contact_phone, text: 'Contact Info', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.contacts)
          }),*/
          /*ListTile(
            title: const Text('App version 1.0.0'),
            onTap: () {},
          ),*/
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    UserProvider up = UserProvider(uid: _authS.userActualUid());
    Stream<UserData> user = up.userDataBase;
    //UserProvider up = UserProvider(uid: user.uid);
    String nombre = user.map((value) => value.name).toString();
    return Container(
        //height: MediaQuery.of().size.height * .5,
        padding: const EdgeInsets.all(50),
        child: Form(
            child: Column(
          children: [
            Icon(
              Icons.account_box,
              color: Colors.purple.shade700,
              size: 100.0,
            ),
            Text(nombre),
          ],
        )));
  }

  Widget _buildDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
