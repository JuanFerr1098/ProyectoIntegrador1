import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtonapp/models/user.dart';

class UserProvider {
  final String uid;
  UserProvider({required this.uid});

  final CollectionReference userData =
      FirebaseFirestore.instance.collection('pensadores');

  Future<DocumentSnapshot> getUsers() {
    return userData.doc(uid).get();
  }

  DocumentReference getRealTimeUsers() {
    return userData.doc(uid);
  }

  Future<void> createUser(String name, String email, String edad) {
    return userData.doc(uid).set({'nombre': name, 'correo': email, 'edad': edad});
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.get('nombre'),
        email: snapshot.get('correo'),
        age: snapshot.get('edad'));
  }

  Stream<QuerySnapshot> readUser() {
    CollectionReference dataUser =
        getRealTimeUsers().collection('nombre');
    return dataUser.snapshots();
  }

  Stream<UserData> get userDataBase {
    return userData.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  Future<void> actualizarDatos(
      Map<String, dynamic> data, String? name, String? age) async {
    if (name == '') {
      name = data['nombre'];
    }
    if (age == '') {
      age = data['edad'];
    }
    try {
      return await getRealTimeUsers()
          .set({'nombre': name, 'edad': age, 'correo': data['correo']});
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Por favor ingrese todos los datos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  /*Future<void> updateUser(UserN user) {
    Map<String, Object> map = {};
    map.update('nombre', (value) => value = user.name);
    map.update('correo', (value) => value = user.email);
    map.update('edad', (value) => value = user.age);
    return userData.doc(user.id).update(map);
  }*/
}
