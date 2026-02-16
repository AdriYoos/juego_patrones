import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/patron_game_screen.dart';

/// Punto de entrada principal de la aplicación
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
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