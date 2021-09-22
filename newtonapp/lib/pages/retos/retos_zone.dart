import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/pages/retos/resultado_page.dart';
import 'package:newtonapp/providers/retos_provider.dart';

class RetosPage extends StatelessWidget {
  final List crearReto;
  const RetosPage({Key? key, required this.crearReto}) : super(key: key);

  @override
  Widget build(BuildContext context) {    

    String tipo = crearReto[0];
    String operacion = crearReto[1];
    String lvl = crearReto[2];

    return FutureBuilder<DocumentSnapshot>(
        future: RetosProvider(uid: operacion).getRetos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            return RetosZone(data: data, lvl: lvl, operacion: operacion, tipo: tipo,);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class RetosZone extends StatefulWidget {
  final String lvl;
  final String operacion;
  final String tipo;
  final Map<String, dynamic> data;
  const RetosZone(
      {Key? key, required this.data, required this.lvl, required this.operacion, required this.tipo})
      : super(key: key);

  @override
  _RetosZone createState() => _RetosZone(data, lvl, operacion, tipo);
}

class _RetosZone extends State<RetosZone> {
  final String lvl;
  final String operacion;
  final String tipo;
  final Map<String, dynamic> data;
  _RetosZone(this.data, this.lvl, this.operacion, this.tipo);

  // Mapeo de colores de los botones
  Map<String, Color> btncolor = {
    "a": Colors.purple.shade700,
    "b": Colors.purple.shade700,
    "c": Colors.purple.shade700,
    "d": Colors.purple.shade700,
  };
  // Tiempo inicial
  String showtimer = "30";
  int timer = 30;
  // Validaciones del tiempo
  bool canceltimer = false;
  bool disableAnswer = false;

  int puntaje = 0;
  List pregunta = [];
  int resp = 0;

  @override
  void initState() {
    starttimer();
    // Crear primera pregunta
    hacerPregunta();
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

  // Corregir para que use la función modulo para valores mas congruentes a la dificultad
  int generatedNumber(int tam) {
    Random random = Random();
    return random.nextInt(pow(10, tam).toInt()) + 1;
    //return random.nextInt(10 % (tam * 10)) + 1;
  }

  hacerPregunta() {
    String a = data[lvl][0];
    String b = data[lvl][2];
    Random random = Random();
    int num1 = generatedNumber(a.length);
    int num2 = generatedNumber(b.length);
    List<int> opciones;
    String operacion = '';
    switch (data[lvl][1]) {
      case '+':
        resp = num1 + num2;
        operacion = num1.toString() + data[lvl][1] + num2.toString();
        break;
      case '-':
        resp = num1 - num2;
        break;
      default:
        operacion = 'Error';
        break;
    }
    opciones = [resp];
    int auxOpc;
    int i = 1;
    while (i < 4){
      auxOpc = random.nextInt(20) + 1;
      if(!opciones.contains(auxOpc)){
        opciones.add(auxOpc);
        i++;
      }
    }     
    // Falta validar que no esten repetidos
    int aux = random.nextInt(3);
    int op0 = opciones[aux];
    opciones.removeAt(aux);
    aux = random.nextInt(2);
    int op1 = opciones[aux];
    opciones.removeAt(aux);
    aux = random.nextInt(1);
    int op2 = opciones[aux];
    opciones.removeAt(aux);
    int op3 = opciones[0];
    // [PREGUNTA, OPC CORRECTA, 3 INCORRECTAS]
    pregunta = [operacion, op0, op1, op2, op3];
  }

  void checkAnswer(int resp, int sum, String k) {
    Color color;
    if (resp == sum) {
      color = Colors.green;
      // Aumento el puntaje que usare luego en otra pantalla
      puntaje = puntaje + 1;
    } else {
      color = Colors.red;
    }
    setState(() {
      btncolor[k] = color;
      canceltimer = true;
      disableAnswer = true;
    });
    Timer(const Duration(seconds: 1), nextquestion);
  }

  void nextquestion() {
    canceltimer = false;
    //timer = 10;
    if (timer == 0) {
      // Navegar a la pantalla de resultado con mi puntaje
      //Talvez no sea aqui
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) =>
        Resultado(puntaje: puntaje.toString(), lvl: lvl, operacion: operacion, tipo: tipo,)));
    } else {
      // Haga el proceso de pregunta
      hacerPregunta();
    }
    setState(() {
      btncolor["a"] = Colors.purple.shade700;
      btncolor["b"] = Colors.purple.shade700;
      btncolor["c"] = Colors.purple.shade700;
      btncolor["d"] = Colors.purple.shade700;
      disableAnswer = false;
    });
    starttimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Text(pregunta[0], style: const TextStyle(fontSize: 50))),
          Expanded(
              flex: 5,
              child: Column(
                children: <Widget>[
                  respuestas(pregunta[1], resp, 'a'),
                  respuestas(pregunta[2], resp, 'b'),
                  respuestas(pregunta[3], resp, 'c'),
                  respuestas(pregunta[4], resp, 'd'),
                ],
              )),
          Expanded(
            flex: 2,
            child: Text(showtimer),
          )
        ],
      ),
    );
  }

  // Boton de las opciones de respuesta
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
          onPressed: () => checkAnswer(resp, sum, k),
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
