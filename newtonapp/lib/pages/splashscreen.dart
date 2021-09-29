import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplahScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*child: Image.asset('../assets/gif/patito.gif'),
        width: 500,*/
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('/assets/gif/patito.gif'),
                fit: BoxFit.cover,
                scale: 0.5
                )),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 5), () {
      navigationUser();
    });
  }

  void navigationUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    //print(status);
    if (status) {
      Navigator.of(context).pushNamedAndRemoveUntil('index', (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
    }
  }
}
