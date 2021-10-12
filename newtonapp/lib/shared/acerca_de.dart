import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 40.0,
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.purple.shade700,
            onPressed: () => Navigator.of(context)
                .pushNamedAndRemoveUntil('index', ModalRoute.withName('index')),
          )
        ],
        title: const Text('Acerca De Nosotros'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: MaterialButton(
              minWidth: 230.0,
              height: 60.0,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: () async {
                Navigator.of(context).pushNamed('ComingSoon');
              },
              child: const Text(
                'Donaciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: MaterialButton(
              minWidth: 230.0,
              height: 60.0,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: () async {
                Navigator.of(context).pushNamed('Comentarios');
              },
              child: const Text(
                'Dejanos tu Comentario',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: const Text(
              'Aplicación creada por\n'
              'Juan Fernando Tamayo Zapata\n'
              'Deyber Sepulveda Tuberquia\n'
              'Johnatan Andrés Gómez Monsalve\n'
              '\nEstudiantes de Ingeniería de Sistemas\n'
              'En la Universidad de Antioquía\n'
              '\nPara el Proyecto Integrador 1\n'
              '\nSupervisado por\n'
              'Fernando Mora\n'
              'Oscar Ortega',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
