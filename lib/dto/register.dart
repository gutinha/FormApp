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
      json['name'],
      json['email'],
      json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'login': email,
      'password': password,
    };
  }
}