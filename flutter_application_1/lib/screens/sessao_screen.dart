import 'package:flutter/material.dart';

class SessaoScreen extends StatelessWidget {
  final String professional;
  final DateTime sessionDate;
  final TimeOfDay sessionTime;
  final List<Map<String, dynamic>> sessionsHistory;

  const SessaoScreen({
    super.key,
    required this.professional,
    required this.sessionDate,
    required this.sessionTime,
    required this.sessionsHistory,
  });

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  String _formatTime(TimeOfDay time) {
    final hours = time.hourOfPeriod.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return "$hours:$minutes";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sessão Agendada'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green.shade100,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      'Sessão marcada!',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Profissional: $professional',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Data: ${_formatDate(sessionDate)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Hora: ${_formatTime(sessionTime)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            const Text(
              'Histórico de Sessões:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: sessionsHistory.length,
                itemBuilder: (context, index) {
                  final session = sessionsHistory[index];
                  return ListTile(
                    title: Text(session['profissional']),
                    subtitle: Text(
                      'Data: ${_formatDate(DateTime.parse(session['data']))}\nHora: ${session['hora']}',
                    ),
                    leading: const Icon(Icons.history),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Remover sessão do histórico
                        sessionsHistory.removeAt(index);
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SessaoScreen(
                              professional: session['profissional'],
                              sessionDate: DateTime.parse(session['data']),
                              sessionTime: TimeOfDay.fromDateTime(
                                  DateTime.parse(session['data'])),
                              sessionsHistory: sessionsHistory,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
