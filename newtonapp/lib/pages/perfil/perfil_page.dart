import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/models/user.dart';
import 'package:newtonapp/providers/auth.dart';
import 'package:newtonapp/providers/user_provider.dart';

final AuthService _authS = AuthService();

class PerfilUser extends StatefulWidget {
  final String title = 'Perfil';
  const PerfilUser({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PerfilUser();
}

class _PerfilUser extends State<PerfilUser> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return FutureBuilder<DocumentSnapshot>(
        future: UserProvider(uid: _authS.userActualUid()).getUsers(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            return perfil(data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget perfil(Map<String, dynamic> data) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Form(
        child: Column(
          children: <Widget>[
            texto('Hola ' + data['nombre']),
            texto('Tu correo es ' + data['correo']),
            edad(data['edad']),
            botonEditPerfil(),
            const Text('Consulta tus Puntajes', style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
            ),),
            botonPuntajes('suma'),
            botonPuntajes('resta'),
            botonPuntajes('mult'),
            botonPuntajes('div'),
          ],
        ),
      ),
    );
  }

  Widget texto(String txt) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        txt,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget edad(String? edad) {
    if (edad != null) {
      return Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            'Tu edad es $edad',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ));
    } else {
      return Container(); // Container vacio por si un dato es null
    }
  }

  Widget botonEditPerfil() {
    return Container(
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
            Navigator.of(context).pushNamed('editarPerfil');
          },
          child: const Text(
            'Editar Perfil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  PreferredSizeWidget? myAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Builder(builder: (context) {
        return IconButton(
            iconSize: 40.0,
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.purple.shade700,
            onPressed: () => Navigator.of(context).pushNamed('index'));
      }),
    );
  }

  Widget botonPuntajes(String tipo) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: MaterialButton(
        minWidth: 230.0,
        height: 60.0,
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          tipo,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            //fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => ventanaEmergente(tipo),
      ),
    );
  }

////////////////////////////////////
/// Los dos siguientes métoso van pa otra clase

  Future<String?> ventanaEmergente(String tipo) {
    return showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(tipo),
                content: puntajes(tipo),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
  }

  Widget puntajes(String tipo) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: UserProvider(uid: _authS.userActualUid())
            .getRealTimeUsers()
            .collection('puntajes')
            .doc(tipo)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data =
                snapshot.data!.data() as Map<String, dynamic>;
            var lista = [];
            data.forEach((key, value) {
              lista.add(Puntajes(key, value.toString()));
            });
            return data.isNotEmpty 
            ? ListView.builder(
              reverse: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(puntaje(lista[index].toString())));
              },
            )
            : const Text('No tienes puntajes');
          } else {
            return const Center(child: Text('Cargando puntajes'));
          }
        },
      ),
    );
  }

  String puntaje(String texto){
    print(texto);
    String fecha = texto.substring(1,11);
    String hora = texto.substring(12, 20);
    int aux;
    aux = texto.indexOf('puntaje');
    String punt = texto.substring(aux + 9, aux + 12);
    aux = texto.indexOf('tipo');
    String tipo = texto.substring(aux + 6, aux + 11);
    switch (tipo) {
      case 'time3':
        tipo = '30 Segundos';
        break;
      case 'memor':
        tipo = 'Memoria';
        break;
      case '5preg':
        tipo = '5 preguntas';
        break;
      default:
    }
    aux = texto.indexOf('lvl');
    String lvl = texto.substring(aux + 5, aux + 6);
    switch (lvl) {
      case '1':
        lvl = 'facil';
        break;
      case '2':
        lvl = 'medio';
        break;
      case '3':
        lvl = 'dificil';
        break;
      case '4':
        lvl = 'avanzado';
        break;
      default:
    }

    String tex = fecha + '\n' + hora + ' \n' + punt + '\n' + tipo + '\n' + lvl;
    print(tex);
    return tex;
  }
}
