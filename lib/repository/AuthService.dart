import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dto/register.dart';
const apiBaseUrl = 'http://localhost:3000';
class AuthService {
  Future<bool> validateLogin(String email, String password) async {
    final response = await http.get(
        Uri.parse("$apiBaseUrl/users?email=$email&password=$password"),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> register(RegisterRequest request) async {
    String body = jsonEncode(request.toMap());

    final response = await http.post(
        Uri.parse("$apiBaseUrl/register"),
        body: body,
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}