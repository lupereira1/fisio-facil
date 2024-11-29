import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class ConfiguracoesScreen extends StatefulWidget {
  const ConfiguracoesScreen({Key? key}) : super(key: key);

  @override
  _ConfiguracoesScreenState createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Preferências',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Modo Escuro'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
              // Altere o tema do app quando o switch for alterado
              final themeMode = _darkMode ? ThemeMode.dark : ThemeMode.light;
              // Altere o tema globalmente
              (context.findAncestorWidgetOfExactType<MyApp>())
                  ?.setTheme(themeMode);
            },
            secondary: const Icon(Icons.dark_mode),
          ),
          SwitchListTile(
            title: const Text('Notificações'),
            value: _notifications,
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
              });
            },
            secondary: const Icon(Icons.notifications),
          ),
          const SizedBox(height: 20),
          const Text(
            'Conta',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Editar Perfil'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Editar Perfil clicado!')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Alterar Senha'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Alterar Senha clicado!')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
