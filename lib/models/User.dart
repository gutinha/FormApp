import 'Revision.dart';

class User {
  int Id;
  String Username;
  String Email;
  String Name;
  List<Revision> Revisions;

  User({
    required this.Id,
    required this.Username,
    required this.Email,
    required this.Name,
    required this.Revisions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var revisionsJson = json['revisions'] as List;
    List<Revision> revisions =
    revisionsJson.map((revisionJson) => Revision.fromJson(revisionJson)).toList();

    return User(
      Id: json['id'],
      Username: json['username'],
      Email: json['email'],
      Name: json['name'],
      Revisions: revisions,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': Id,
    'username': Username,
    'email': Email,
    'name': Name,
    'revisions': Revisions.map((revision) => revision.toJson()).toList(),
  };
}