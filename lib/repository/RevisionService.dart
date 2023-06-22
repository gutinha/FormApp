import 'dart:convert';
import 'package:formapp/global/GlobalConfig.dart';
import 'package:formapp/models/Revision.dart';
import 'package:formapp/dto/schedule.dart';
import 'package:http/http.dart' as http;
class RevisionService {
  Future<List<Revision>> getAllById(int idUser) async {
    String body = jsonEncode({'idUser': idUser});
    final response = await http.post(
        Uri.parse("${GlobalConfig.baseUrl}/find/revisions"),
        body: body,
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => Revision.fromJson(json)).toList();
    } else {
      throw Exception('Error loading data');
    }
  }

  Future<bool> schedule(ScheduleRequest request) async {
    String body = jsonEncode(request.toMap());
    final response = await http.post(
        Uri.parse("${GlobalConfig.baseUrl}/revisions"),
        body: body,
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}