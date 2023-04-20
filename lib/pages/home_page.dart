import 'package:flutter/material.dart';
import 'package:formapp/repository/UserRepository.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  RevisionRepository repository = RevisionRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revisões Agendadas'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.blue, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        repository.revisions[index].description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          decoration: repository.revisions[index].done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: repository.revisions[index].done
                              ? Colors.grey
                              : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text('Data: ${repository.revisions[index].dataRevisao.toIso8601String()}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          decoration: repository.revisions[index].done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: repository.revisions[index].done
                              ? Colors.grey
                              : Colors.black,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 10,
        ),
        itemCount: repository.revisions.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/schedule');
        },
        tooltip: 'Agendar Revisão',
        child: const Icon(Icons.add_chart),
      ),
    );
  }
}
