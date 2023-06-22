class ScheduleRequest {
  String description;
  DateTime dataRevisao;
  bool done = false;
  int idUser;

  ScheduleRequest({required this.description, required this.dataRevisao, required this.done, required this.idUser});

  ScheduleRequest.factory({
    required this.description,
    required this.dataRevisao,
    required this.done,
    required this.idUser
  });

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) {
    return ScheduleRequest(
      description: json['description'],
      dataRevisao: DateTime.parse(json['dataRevisao']),
      done: json['done'],
      idUser: json['idUser']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'dataRevisao': dataRevisao.toIso8601String(),
      'done': done,
      'iduser': idUser
    };
  }
}