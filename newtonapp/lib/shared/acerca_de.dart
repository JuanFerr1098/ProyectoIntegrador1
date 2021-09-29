import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                Navigator.of(context).pushNamed('ComingSoon');
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
                textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
