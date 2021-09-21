import 'package:cloud_firestore/cloud_firestore.dart';

class RetosProvider {
  final String uid;
  RetosProvider({required this.uid});

  final CollectionReference retosData =
      FirebaseFirestore.instance.collection('problemas');

  Future<DocumentSnapshot> getRetos() {
    return retosData.doc(uid).get();
  }
}
