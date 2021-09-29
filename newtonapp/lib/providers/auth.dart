import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtonapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newtonapp/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserN? _userFromFirebaseUser(User user) {
    /*return user != null ? UserN(
      email:user.email, 
      name:user.displayName, 
      age: null, 
      id: user.uid) : null;*/
    return UserN(uid: user.uid);
  }

  String userActualUid() {
    return _auth.currentUser!.uid;
  }

  Future registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await UserProvider(uid: user!.uid).createUser(name, email);
      return _userFromFirebaseUser(user);
    } catch (e) {
      String aviso;
      if (name == '') {
        aviso = "Por favor ingrese su nombre";
      } else if (e.toString().contains("firebase_auth/email-already-in-use")) {
        aviso = "El correo ya existe";
      } else if (password.length < 6) {
        aviso = "La contraseña debe tener 6 caracteres minimo";
      } else {
        aviso = "Por favor ingrese un correo válido";
      }
      Fluttertoast.showToast(
          msg: aviso,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      String aviso;
      if (e.toString().contains('firebase_auth/invalid-email')) {
        aviso = 'Correo inválido';
      } else if (password == '') {
        aviso = 'Ingrese su contraseña';
      }
      /*else if(e.toString().contains('firebase_auth/wrong-password')){
        aviso = 'Contraseña inválida';
      }*/
      else {
        aviso = 'Usuario no encontrado';
      }
      Fluttertoast.showToast(
          msg: aviso,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }

  Future<void> logOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      return await _auth.signOut();
    } catch (e) {
      //return null;
    }
  }
}
