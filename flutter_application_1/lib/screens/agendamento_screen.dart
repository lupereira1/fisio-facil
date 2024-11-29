import 'package:flutter/material.dart';
import 'sessao_screen.dart'; 

class AgendamentoScreen extends StatefulWidget {
  final List<Map<String, dynamic>> sessionsHistory;

  const AgendamentoScreen({super.key, required this.sessionsHistory});

  @override
  _AgendamentoScreenState createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<AgendamentoScreen> {
  String? _selectedProfessional;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final List<String> professionals = [
    "Dr. João",
    "Dra. Maria",
    "Dr. Pedro",
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024, 1),
      lastDate: DateTime(2025, 12),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _bookSession() {
    // Adiciona o pop-up de sucesso
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sessão Agendada!"),
          content: const Text("Sessão agendada com sucesso!"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );

    // Exibe o SnackBar de "Sessão Agendada com Sucesso!"
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sessão agendada com sucesso com $_selectedProfessional!'),
      ),
    );

    // Atualizando o histórico de sessões
    final newSession = {
      'profissional': _selectedProfessional,
      'data': _selectedDate.toIso8601String(),
      'hora': _selectedTime.format(context),
    };

    setState(() {
      widget.sessionsHistory.add(newSession); // Atualiza o histórico
    });
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Sessões'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha um profissional:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedProfessional,
              hint: const Text('Selecione um profissional'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProfessional = newValue;
                });
              },
              items:
                  professionals.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escolha a data da sessão:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Selecionar data: ${_formatDate(_selectedDate)}',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escolha o horário da sessão:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(
                'Selecionar horário: ${_selectedTime.format(context)}',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _bookSession, // Chama o pop-up de sucesso
                child: const Text('Agendar Sessão'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
