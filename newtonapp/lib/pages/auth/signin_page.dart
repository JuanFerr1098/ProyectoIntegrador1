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

    var rosa = const Color(0xffc86bfa);
    var morado = const Color(0xff7b2cbf);
    var naranjaOscuro = const Color(0xffff7b00);

    return Scaffold(
      //backgroundColor: Colors.tealAccent, //Fondo de la pantalla
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            rosa,
            morado,
          ]),
          /*borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90)),*/
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 20,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                          fontFamily: 'QBold',
                          color: Colors.white,
                          fontSize: 25.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              //parte blanca
              height: MediaQuery.of(context).size.height * 0.6,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                //color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //titulo(context),
                        loginText(),
                        passwordText(),
                        botonIngresar(context)
                      ],
                    )

                    //passwordText(),
                    // botonIngresar(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginText() {
    return Container(
      width: 350.0,
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
      width: 350.0,
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
