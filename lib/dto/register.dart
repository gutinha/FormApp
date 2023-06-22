class RegisterRequest {
  String name;
  String email;
  String password;

  RegisterRequest(this.name, this.email, this.password);

  RegisterRequest.factory({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      json['email'],
      json['password'],
      json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}