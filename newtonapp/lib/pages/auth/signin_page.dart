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
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Color.fromRGBO(200, 107, 250, 1),
                    Color.fromRGBO(123, 44, 191, 1),
                  ]),
                  /*borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90)),*/
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[]),
              ),

              //color: Colors.black,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Container(
                padding: EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                //color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //titulo(context),
                    // botones(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /* appBar: AppBar(
          backgroundColor: const Color.fromRGBO( 145, 99, 203, 1),
          //title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loginText(),
              passwordText(),
              botonIngresar(context),
            ],
          ),
        )*/
    );
  }

  Widget loginText() {
    return Container(
      width: 450.0,
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
      width: 450.0,
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
          color: const Color.fromRGBO(0, 180, 216, 1),
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
