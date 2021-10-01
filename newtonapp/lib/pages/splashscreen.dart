import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newtonapp/providers/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplahScreen> {
 
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  final AuthService _authS = AuthService();

  @override
  Widget build(BuildContext context) {
    return Image.network('https://firebasestorage.googleapis.com/v0/b/newtonapp-91e99.appspot.com/o/gif%2Fnewton.gif?alt=media&token=c1e75077-ae73-416a-9c96-bf30f3a3f052',
    fit: BoxFit.fill,);
    
  }

  void startTimer() {
    Timer(const Duration(seconds: 5), () {
      navigationUser();
    });
  }

  void navigationUser() async {
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;    
    print(status);
    if (status) {
      Navigator.of(context).pushNamedAndRemoveUntil('index', (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
    }*/
    SharedPreferences em = await SharedPreferences.getInstance();
    SharedPreferences pw = await SharedPreferences.getInstance();
    //print(em.getString('email').toString() + '\n'+ pw.getString('password').toString());
    dynamic result = await _authS.signInWithEmailAndPassword(
        em.getString('email').toString(), pw.getString('password').toString());
    if (result != null) {
      Navigator.of(context).pushNamedAndRemoveUntil('index', (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
    }
  }
}
