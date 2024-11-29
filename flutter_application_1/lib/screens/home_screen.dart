import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fisio Fácil'),
        backgroundColor: Colors.teal,
        actions: [
          // Ícone de configurações no canto superior direito
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/configuracoes');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Nome do usuário (pode ser dinâmico se for implementado no estado)
            const Center(
              child: Text(
                'Bem-vindo a Fisio Fácil!', // Aqui você pode usar o nome real do usuário se necessário
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            // Grid de ícones interativos
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Número de colunas
                crossAxisSpacing: 20, // Espaçamento horizontal
                mainAxisSpacing: 20, // Espaçamento vertical
                children: [
                  // Ícone de Agendamento
                  _buildIconButton(
                    context,
                    Icons.calendar_today,
                    'Agendar Sessão',
                    '/agendamento',
                  ),
                  // Ícone de Histórico de Sessões
                  _buildIconButton(
                    context,
                    Icons.history,
                    'Histórico de Sessões',
                    '/historico',
                  ),
                  // Ícone de Próxima Sessão
                  _buildIconButton(
                    context,
                    Icons.access_time,
                    'Próxima Sessão',
                    '/sessao',
                  ),
                  // Ícone de Configurações
                  _buildIconButton(
                    context,
                    Icons.settings,
                    'Configurações',
                    '/configuracoes',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para construir os botões de ícone
  Widget _buildIconButton(
      BuildContext context, IconData icon, String label, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route); // Navega para a tela da rota
      },
      borderRadius: BorderRadius.circular(10), // Borda arredondada
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.teal, // Cor de fundo do botão
          borderRadius: BorderRadius.circular(10), // Borda arredondada
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinhamento central
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white, // Cor do ícone
            ),
            const SizedBox(height: 10), // Espaçamento entre o ícone e o texto
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white, // Cor do texto
                fontWeight: FontWeight.bold, // Negrito para o texto
              ),
              textAlign: TextAlign.center, // Centralizar o texto
            ),
          ],
        ),
      ),
    );
  }
}
