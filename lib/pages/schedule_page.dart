import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

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

  void _validateAndSchedule() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Implemente a lógica de agendamento aqui, como salvar a data no banco de dados.
      Navigator.pushNamed(context, '/home');
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