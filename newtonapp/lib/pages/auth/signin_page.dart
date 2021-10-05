import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtonapp/providers/auth.dart';

class SignInPage extends StatefulWidget {
  /// The page title.
  final String title = 'Login';
  const SignInPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _authS = AuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //Los controller es donde guarda las variables, creo que funciona asi

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        //backgroundColor: Colors.tealAccent, //Fondo de la pantalla
        appBar: AppBar(
          backgroundColor: Colors.purple.shade700,
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            addAutomaticKeepAlives: false,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              loginText(),
              passwordText(),
              botonIngresar(context),
            ],
          ),
        ));
  }

  Widget loginText() {
    return Container(
      //Ingreso del Email del Login
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        //backgroundColor: Colors.white,
        //fillColor: Colors.white,
        //Aqui esta la entrada de texto
        controller: _emailController,
        decoration: const InputDecoration(
            labelText: 'Ingresa tu Email',
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      //Ingreso de la Contraseña del Login
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        //Aqui esta la entrada de texto
        controller: _passwordController,
        decoration: const InputDecoration(
            labelText: 'Ingresa tu Contraseña',
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true),
        obscureText: true, //Esto hace que aparezca ******
      ),
    );
  }

  Widget botonIngresar(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 230.0,
          height: 60.0,
          color: Colors.purple.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              dynamic result = await _authS.signInWithEmailAndPassword(
                  _emailController.text, _passwordController.text, true);
              if (result != null) {
                Navigator.of(context).pushNamedAndRemoveUntil('index', (route) => false);
              }
            }
          },
          child: const Text(
            'Ingresar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
