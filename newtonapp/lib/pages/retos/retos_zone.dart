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
            return RetosZone(
              data: data,
              lvl: lvl,
              operacion: operacion,
              tipo: tipo,
            );
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
      {Key? key,
      required this.data,
      required this.lvl,
      required this.operacion,
      required this.tipo})
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
    "a": const Color.fromRGBO(0, 180, 216, 1),
    "b": const Color.fromRGBO(0, 180, 216, 1),
    "c": const Color.fromRGBO(0, 180, 216, 1),
    "d": const Color.fromRGBO(0, 180, 216, 1),
  };
  // Tiempo inicial
  String showtimer = '0';
  int timer = 0;
  // Validaciones del tiempo
  bool canceltimer = false;
  bool disableAnswer = false;

  // Para los retos
  int puntaje = 0;
  List pregunta = [];
  int resp = 0;
  int cantPreg = 0; // 5 preg

  // Para analisis de la app
  int errores = 0;
  int totalPreg = 0;

  DateTime? date;
  //late bool _isDisabled;

  @override
  void initState() {
    date = DateTime.now();
    //_isDisabled = false;
    // Inicializar valores del timer
    iniciarTimer();
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

  @override
  void dispose() {
    super.dispose();
  }

  void iniciarTimer() {
    if (tipo == 'time30s') {
      showtimer = "30";
      timer = 30;
    } else if (tipo == '5preg') {
      showtimer = "7";
      timer = 7;
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

  /// Generador de números aleatorios dependiendo del rango
  int generatedNumber(int tam) {
    Random random = Random();
    return random.nextInt(pow(10, tam).toInt() - pow(10, tam - 1).toInt() - 1) +
        pow(10, tam - 1).toInt();
    //return random.nextInt(10 % (tam * 10)) + 1;
  }

  hacerPregunta() {
    Random random = Random();
    int num1 = generatedNumber(data[lvl][0].length);
    int num2 = generatedNumber(data[lvl][2].length);
    List<int> opciones;
    String operacion;
    //////////////////////////////////////////////////////////////////////////////////////
    /// Generador de preguntas con su respuesta
    switch (data[lvl][1]) {
      case '+':
        resp = num1 + num2;
        break;
      case '-':
        if (num1 < num2) {
          int aux = num1;
          num1 = num2;
          num2 = aux;
        }
        resp = num1 - num2;
        break;
      case '*':
        resp = num1 * num2;
        break;
      case '/':
        int dividendo = num1 * num2;
        resp = num1;
        num1 = dividendo;
        break;
      default:
        break;
    }
    operacion = num1.toString() + ' ' + data[lvl][1] + ' ' + num2.toString();
    opciones = [resp];
    //////////////////////////////////////////////////////////////////////////////////////
    /// Metodo para poner opciones incorrectas que dependan de la solucion
    int a;
    if (data[lvl][0].length == 1 ||
        (data[lvl][0].length == 2 && data[lvl][1] == '-') ||
        (data[lvl][0].length == 2 && data[lvl][1] == '/')) {
      a = 1;
    } else if ((data[lvl][0].length == 2 && data[lvl][1] == '+') ||
        //(data[lvl][1] == '+' || data[lvl][1] == '*')) ||
        (data[lvl][0].length == 3 &&
            (data[lvl][1] == '-' || data[lvl][1] == '/'))) {
      a = 5;
    } else if ((data[lvl][0].length == 2 && data[lvl][1] == '*') ||
        (data[lvl][0].length == 3 && data[lvl][1] != '-') ||
        (data[lvl][0].length == 4 &&
            (data[lvl][1] == '-' || data[lvl][1] == '/'))) {
      a = 50;
    } else {
      a = 500;
    }

    switch (random.nextInt(4)) {
      case 0:
        opciones.add(resp + (a * 1));
        opciones.add(resp + (a * 2));
        opciones.add(resp + (a * 3));
        break;
      case 1:
        opciones.add(resp - (a * 1));
        opciones.add(resp + (a * 1));
        opciones.add(resp + (a * 2));
        break;
      case 2:
        opciones.add(resp - (a * 2));
        opciones.add(resp - (a * 1));
        opciones.add(resp + (a * 1));
        break;
      case 3:
        opciones.add(resp - (a * 3));
        opciones.add(resp - (a * 2));
        opciones.add(resp - (a * 1));
        break;
      default:
    }

    //////////////////////////////////////////////////////////////////////////////////////
    /// Reorganizador de las opciones de respuesta
    int aux = random.nextInt(4);
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

  void checkAnswer(int resp, int opcionCorrecta, String k) {
    Color color;
    if (resp == opcionCorrecta) {
      color = Colors.green;
      // Aumento el puntaje que usare luego en otra pantalla
      //puntaje++;
      puntaje = puntaje + timer;
    } else {
      color = Colors.red;

      errores++;
    }
    totalPreg++;
    setState(() {
      btncolor[k] = color;
      canceltimer = true;
      disableAnswer = true;
    });
    Timer(const Duration(seconds: 1), nextquestion);
  }

  void nextquestion() {
    canceltimer = false;
    setState(() {
      switch (tipo) {
        case '5preg':
          if (cantPreg < 4) {
            hacerPregunta();
            cantPreg++;
          } else {
            navegarPuntaje();
          }
          if (timer == 0) {
            errores++;
            totalPreg++;
          }
          timer = 7;
          break;
        case 'time30s':
          if (timer == 0) {
            navegarPuntaje();
          } else {
            hacerPregunta();
          }
          break;
        default:
      }
      btncolor["a"] = const Color.fromRGBO(0, 180, 216, 1);
      btncolor["b"] = const Color.fromRGBO(0, 180, 216, 1);
      btncolor["c"] = const Color.fromRGBO(0, 180, 216, 1);
      btncolor["d"] = const Color.fromRGBO(0, 180, 216, 1);
      disableAnswer = false;
    });
    starttimer();
  }

  void navegarPuntaje() {
    /*Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Resultado(
                  puntaje: puntaje.toString(),
                  errores: errores.toString(),
                  cantPreg: totalPreg.toString(),
                  lvl: lvl,
                  operacion: operacion,
                  tipo: tipo,
                  date: date.toString(),
                )));*/
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => Resultado(
                  puntaje: puntaje.toString(),
                  errores: errores.toString(),
                  cantPreg: totalPreg.toString(),
                  lvl: lvl,
                  operacion: operacion,
                  tipo: tipo,
                  date: date.toString(),
                )),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Center(
                  // Pregunta
                  child: Text(
                    pregunta[0]+'=',
                    style: TextStyle(
                      color: const Color.fromRGBO(145, 99, 203, 1),
                      //color: Colors.white,
                      fontFamily: 'QBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
                )),
            Expanded(
                //botones
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          respuestas(pregunta[1], resp, 'a'),
                          respuestas(pregunta[2], resp, 'b'),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          respuestas(pregunta[3], resp, 'c'),
                          respuestas(pregunta[4], resp, 'd'),
                        ]),
                  ],
                )),
            Expanded(// timer
              flex: 2,
              child: Text(
                showtimer,
                textAlign: TextAlign.center,
                 style: TextStyle(
                      color: const Color.fromRGBO(0, 180, 216, 1),
                      //color: Colors.white,
                      fontFamily: 'QBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Boton de las opciones de respuesta
  Widget respuestas(int resp, int sum, String k) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 200.0,
          height: 150.0,
          color: btncolor[k],
          //color: const Color.fromRGBO( 0, 180, 216, 1),
          splashColor: Colors.white,
          highlightColor: const Color.fromRGBO(145, 99, 203, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () => checkAnswer(resp, sum, k),
          //onPressed: () => _isDisabled ? false: _disabledButton(resp, sum, k),
          child: Text(
            resp.toString(),
            style: TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              fontSize: 60.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  /*_disabledButton(resp, sum, k){
    checkAnswer(resp, sum, k);
  }*/
}
