import 'package:flutter/material.dart';

class HistoricoSessaoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> sessionsHistory;

  const HistoricoSessaoScreen({
    Key? key,
    required this.sessionsHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Sessões'),
        backgroundColor: Colors.teal,
      ),
      body: sessionsHistory.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 100,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Nenhuma sessão agendada ainda!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: sessionsHistory.length,
              itemBuilder: (context, index) {
                final session = sessionsHistory[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.teal,
                      size: 40,
                    ),
                    title: Text(
                      session['profissional'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      'Data: ${session['data']}\nHora: ${session['hora']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
