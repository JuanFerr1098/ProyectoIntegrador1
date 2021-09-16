import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/providers/retos_provider.dart';

class RetosPage extends StatelessWidget {
  const RetosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return FutureBuilder<DocumentSnapshot>(
        future: RetosProvider(uid: 'suma').getRetos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            return RetosZone(data: data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class RetosZone extends StatefulWidget {
  final Map<String, dynamic> data;
  const RetosZone({Key? key, required this.data}) : super(key: key);

  @override
  _RetosZone createState() => _RetosZone(data);
}

class _RetosZone extends State<RetosZone> {
  final Map<String, dynamic> data;
  _RetosZone(this.data);

  Map<String, Color> btncolor = {
    "a": Colors.purple.shade700,
    "b": Colors.purple.shade700,
    "c": Colors.purple.shade700,
  };
  String showtimer = "30";
  int timer = 30;
  bool canceltimer = false;
  bool disableAnswer = false;

  int i = 1;
  int j = 1;


  @override
  void initState() {
    //starttimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void checkAnswer(int resp, int sum, String k) {
    Color color;
    if (resp == sum) {
      color = Colors.green;
    } else {
      color = Colors.red;
    }
    setState(() {
      btncolor[k] = color;
      canceltimer = true;
      disableAnswer = true;
    });
    Timer(const Duration(seconds: 2), nextquestion);
  }

  void nextquestion() {
    canceltimer = false;
    //timer = 30;
    setState(() {
      btncolor["a"] = Colors.purple.shade700;
      btncolor["b"] = Colors.purple.shade700;
      btncolor["c"] = Colors.purple.shade700;
      disableAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: RetosProvider(uid: 'suma').getRetos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            return formulario(data, 'sumafacil');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  int generatedNumber(int tam) {
    Random random = Random();
    return random.nextInt(pow(10, tam).toInt()) + 1;
  }

  Widget formulario(Map<String, dynamic> data, String lvl) {
    String a = data[lvl][0];
    String b = data[lvl][2];
    Random random = Random();
    int num1 = generatedNumber(a.length);
    int num2 = generatedNumber(b.length);
    int resp = num1 + num2;
    int inc1 = random.nextInt(17) + 1;
    int inc2 = random.nextInt(17) + 1;

    String suma = num1.toString() + '+' + num2.toString();
    // Validar que no esten repetidos
    List<int> opciones = [resp, inc1, inc2];
    int aux = random.nextInt(2);
    int op1 = opciones[aux];
    opciones.removeAt(aux);
    aux = random.nextInt(1);
    int op2 = opciones[aux];
    opciones.removeAt(aux);
    int op3 = opciones[0];
    return Column(
      children: <Widget>[
        Text(suma, style: const TextStyle(fontSize: 50)),
        respuestas(op1, resp, 'a'),
        respuestas(op2, resp, 'b'),
        respuestas(op3, resp, 'c'),
        Text(showtimer),
      ],
    );
  }

  Widget respuestas(int resp, int sum, String k) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 220.0,
          height: 60.0,
          color: btncolor[k],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () {
            checkAnswer(resp, sum, k);
          },
          child: Text(
            resp.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
