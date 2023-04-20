import 'package:formapp/models/Revision.dart';

class RevisionRepository {
  List<Revision> revisions = [
    Revision(
        id: 1,
        description: 'Trocar farol',
        done: false,
        dataRevisao: DateTime.now().add(const Duration(days: 2))),
    Revision(
        id: 2,
        description: 'Manutenção geral',
        done: false,
        dataRevisao: DateTime.now().add(const Duration(days: 3))),
    Revision(
        id: 3,
        description: 'Troca de óleo',
        done: true,
        dataRevisao: DateTime.now().add(const Duration(days: 0)))
  ];

}