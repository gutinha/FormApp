import 'dart:convert';
import 'package:formapp/global/GlobalConfig.dart';
import 'package:formapp/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:formapp/global/GlobalUser.dart';
import '../dto/register.dart';
class AuthService {
  Future<bool> validateLogin(String email, String password) async {
    //?email=$email&password=$password"
    String body = jsonEncode({'email': email, 'password': password});
    final response = await http.post(
        Uri.parse("${GlobalConfig.baseUrl}/auth/login"),
        body: body,
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final response = await http.get(
          Uri.parse("${GlobalConfig.baseUrl}/users?email=$email"),
          headers: {'Content-Type': 'application/json'});
      List<dynamic> jsonList = jsonDecode(response.body);
      for (var item in jsonList) {
        // Verificar se cada item é um mapa (dicionário)
        if (item is Map<String, dynamic>) {
          GlobalUser.userLogado.id = item['id'];
          GlobalUser.userLogado.email = item['email'];
        }
      }
      return true;
    }
    return false;
  }

  Future<bool> register(RegisterRequest request) async {
    String body = jsonEncode(request.toMap());

    final response = await http.post(
        Uri.parse("${GlobalConfig.baseUrl}/users"),
        body: body,
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}