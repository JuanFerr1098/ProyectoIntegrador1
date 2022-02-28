import 'package:cloud_firestore/cloud_firestore.dart';

class PruebasProvider {
  final String uid;
  PruebasProvider({required this.uid});

  final CollectionReference pruebaData =
      FirebaseFirestore.instance.collection('prueba');

  Future<DocumentSnapshot> getPrueba() {
    return pruebaData.doc(uid).get();
  }
}
