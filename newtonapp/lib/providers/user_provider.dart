import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newtonapp/models/user.dart';

class UserProvider {
  late CollectionReference userData;

  UserProvider() {
    userData = FirebaseFirestore.instance.collection('pensadores');
  }

  Future<DocumentSnapshot> getUsers(String id) {
    return userData.doc(id).get();
  }

  DocumentReference getRealTimeUsers(String id) {
    return userData.doc(id);
  }

  Future<void> createUser(User user) {
    return userData.doc(user.id).set(user);
  }

  Future<void> updateUser(User user) {
    Map<String, Object> map = {};
    map.update('nombre', (value) => value = user.name);
    map.update('correo', (value) => value = user.email);
    map.update('edad', (value) => value = user.age);
    return userData.doc(user.id).update(map);
  }
}
