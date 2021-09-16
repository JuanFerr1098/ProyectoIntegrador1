class UserN {
  /*final String _id;
  final String _email;
  final String _name;
  final String _age;*/

  //UserN(this._email, this._name, this._age, this._id);

  /*String get id => _id;
  String get email => _email;
  String get name => _name;
  String get age => _age;*/

  final String uid;  
  UserN({required this.uid});  
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String age;

  UserData({required this.uid, required this.name, required this.email, required this.age});
  
}