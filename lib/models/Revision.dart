class Revision {
  int id;
  String description;
  bool done;
  DateTime dataRevisao;

  Revision({
    required this.id,
    required this.description,
    required this.done,
    required this.dataRevisao,
  });

  factory Revision.fromJson(Map<String, dynamic> json) {
    return Revision(
      id: json['id'],
      description: json['description'],
      done: json['done'],
      dataRevisao: DateTime.parse(json['dataRevisao']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'done': done,
      'dataRevisao': dataRevisao.toIso8601String(),
    };
  }
}