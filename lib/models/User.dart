class User {
  int id;
  String name;
  String email;
  String password;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
  };
}