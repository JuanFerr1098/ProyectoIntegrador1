class User {
  final String _id;
  final String _email;
  final String _name;
  final String _age;

  User(this._email, this._name, this._age, this._id);

  String get id => _id;
  String get email => _email;
  String get name => _name;
  String get age => _age;
}