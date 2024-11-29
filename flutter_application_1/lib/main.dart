import 'package:flutter/material.dart';
import 'screens/agendamento_screen.dart';
import 'screens/sessao_screen.dart';
import 'screens/historico_sessao_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/configuracoes_screen.dart'; // Importe a tela de configurações

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  void setTheme(ThemeMode themeMode) {}
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Tema inicial

  void setTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fisio Fácil',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light, // Tema claro
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark, // Tema escuro
      ),
      themeMode: _themeMode, // Alterar o tema com base na escolha
      initialRoute: '/', // A tela inicial será o login
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/agendamento': (context) =>
            const AgendamentoScreen(sessionsHistory: []),
        '/sessao': (context) => SessaoScreen(
            professional: "Dr. João",
            sessionDate: DateTime.now(),
            sessionTime: TimeOfDay.now(),
            sessionsHistory: []),
        '/historico': (context) => HistoricoSessaoScreen(sessionsHistory: []),
        '/configuracoes': (context) => const ConfiguracoesScreen(),
      },
    );
  }
}
