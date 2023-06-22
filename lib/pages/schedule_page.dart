import 'package:flutter/material.dart';
import 'package:formapp/dto/schedule.dart';
import 'package:formapp/global/GlobalUser.dart';
import 'package:formapp/repository/RevisionService.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String _description = '';
  RevisionService revisionService = RevisionService();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _validateAndSchedule() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScheduleRequest request = ScheduleRequest(description: _description,
          dataRevisao: _selectedDate as DateTime,
          done: false,
          idUser: GlobalUser.userLogado.id);
      revisionService.schedule(request).then((value) =>
      {
        if (value) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/home', (route) => false)
        } else
          {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao agendar revisão')))
          }
      });
    }
  }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Revisão'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: 'Data da Revisão'),
                  readOnly: true,
                  controller: TextEditingController(
                    text: _selectedDate == null
                        ? ''
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  ),
                  validator: (value) {
                    if (_selectedDate == null) {
                      return 'Por favor, selecione uma data';
                    }
                    return null;
                  },
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                ElevatedButton(
                  child: Text('Agendar'),
                  onPressed: _validateAndSchedule,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

