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
  final rosa = const Color(0xffc86bfa);
  final morado = const Color(0xff7b2cbf);
  final naranjaOscuro = const Color(0xffff7b00);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        backgroundColor: Colors.tealAccent, //Fondo de la pantalla
        body: cuerpo());
  }

  Widget cuerpo() {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          rosa,
          morado,
        ]),
      ),
      child: ListView(
        reverse: true,
        children: <Widget>[
          formulario(),
          texto(),
        ],
      ),
    ));
  }

  Widget texto() {
    return Container(
      padding: const EdgeInsets.only(
        left: 65,
        right: 20,
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      //child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Logeo',
              style: TextStyle(
                fontFamily: 'QBold',
                color: Colors.white,
                fontSize: 50.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Bienvenido devuelta.',
              style: TextStyle(
                fontFamily: 'PMedium',
                color: Colors.white,
                fontSize: 25.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ]),
      //),
    );
  }

  Widget formulario() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textoIngresar(_emailController, 'Ingresa tu Email', false),
            textoIngresar(_passwordController, 'Ingresa tu contraseña', true),
            botonIngresar(context)
          ],
        ),
      ),
    );
  }

  Widget textoIngresar(controller, texto, obscureText) {
    return Container(
      width: Size.infinite.width,
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: TextFormField(
        //Aqui esta la entrada de texto
        controller: controller,
        decoration: InputDecoration(
            labelText: texto,
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true),
        obscureText: obscureText, //Esto hace que aparezca ******
      ),
    );
  }

  Widget botonIngresar(context) {
    return Container(
        //Boton para ir al Registro de la App
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: 250.0,
          height: 80.0,
          color: naranjaOscuro,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              dynamic result = await _authS.signInWithEmailAndPassword(
                  _emailController.text, _passwordController.text, true);
              if (result != null) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('index', (route) => false);
              }
            }
          },
          child: const Text(
            'Ingresar',
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
