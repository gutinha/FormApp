import 'package:flutter/material.dart';
import 'package:formapp/global/GlobalUser.dart';
import 'package:formapp/models/Revision.dart';
import 'package:formapp/repository/RevisionService.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Revision>> revisionsFuture;

  @override
  void initState() {
    super.initState();
    revisionsFuture = RevisionService().getAllById(GlobalUser.userLogado.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisões Agendadas'),
      ),
      body: FutureBuilder<List<Revision>>(
        future: revisionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao buscar revisões'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No revisions found'));
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                final revision = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
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
                                revision.description,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  decoration: revision.done
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: revision.done ? Colors.grey : Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Data: ${revision.dataRevisao.toIso8601String()}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  decoration: revision.done
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: revision.done ? Colors.grey : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 10,
              ),
              itemCount: snapshot.data!.length,
            );
          }
        },
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
