import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/providers/auth.dart';

class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registrate';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _authS = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(145, 99, 203, 1),
          title: Text(
            widget.title,
            style: const TextStyle(
              fontFamily: 'QRegular',
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              texto('Ingresa tu nombre', _nameController, false),
              texto('Ingresa tu correo', _emailController, false),
              texto('Ingresa tu contraseña', _passwordController, true),
              texto('Ingresa tu edad', _edadController, true),
              botonRegistrar(context),
            ],
          ),
        ));
  }

  Widget texto(String txt, TextEditingController controller, bool obsText) {
    return Container(
      width: 450.0,
      //Ingreso del Nombre del Registro
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        //Aqui esta la entrada de texto
        controller: controller,
        decoration: InputDecoration(
            labelText: txt,
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true),
        obscureText: obsText,
      ),
    );
  }

  Widget botonRegistrar(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: const Color.fromRGBO(0, 180, 216, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              //await _register();
              dynamic result = await _authS.registerWithEmailAndPassword(
                  _nameController.text,
                  _emailController.text,
                  _passwordController.text,
                  _edadController.text);
              if (result != null) {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('login');
              }
            }
          },
          child: const Text(
            'Registrar',
            style: TextStyle(
              fontFamily: 'QBold',
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
