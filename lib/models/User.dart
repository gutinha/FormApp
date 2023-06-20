import 'Revision.dart';

class User {
  int id;
  String username;
  String email;
  String name;
  String password;
  List<Revision> revisions;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.password,
    required this.revisions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var revisionsJson = json['revisions'] as List;
    List<Revision> revisions =
    revisionsJson.map((revisionJson) => Revision.fromJson(revisionJson)).toList();

    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      name: json['name'],
      password: json['password'],
      revisions: revisions,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'name': name,
    'revisions': revisions.map((revision) => revision.toJson()).toList(),
  };
}