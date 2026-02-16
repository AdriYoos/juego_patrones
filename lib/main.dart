import 'package:flutter/material.dart';
import 'screens/patron_game_screen.dart';

/// Punto de entrada principal de la aplicación
void main() {
  runApp(const PatronApp());
}

/// Widget raíz de la aplicación
/// Configura el tema y la pantalla inicial
class PatronApp extends StatelessWidget {
  const PatronApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PatronGameScreen(),
    );
  }
}