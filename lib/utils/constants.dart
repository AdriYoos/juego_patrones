import 'package:flutter/material.dart';

/// Constantes utilizadas en toda la aplicación
class AppConstants {
  // Rutas de las imágenes de los animales
  static const List<String> animalImages = [
    'assets/images/dog.png',
    'assets/images/cat.png',
    'assets/images/lion.png',
    'assets/images/cow.png',
    'assets/images/frog.png',
    'assets/images/monkey.png',
    'assets/images/panda.png',
    'assets/images/penguin.png',
    'assets/images/fox.png',
    'assets/images/tiger.png',
    'assets/images/unicorn.png',
    'assets/images/pig.png',
  ];

  // Duraciones de animación
  static const Duration highlightDuration = Duration(milliseconds: 500);// cuando se resalta un animal
  static const Duration pauseBetweenHighlights = Duration(milliseconds: 300);// pausa entre resaltes durante la reproducción de la secuencia
  static const Duration userPressDuration = Duration(milliseconds: 200);// duración del efecto visual cuando el usuario presiona un tile
  static const Duration delayBeforeNextRound = Duration(seconds: 1);// tiempo de espera antes de iniciar la siguiente ronda después de que el usuario completa la secuencia correctamente

  // Colores del tema
  static final Color activeColor = Colors.red.shade700;
  static final Color pressedColor = Colors.green.withValues(alpha: 90);
  static final Color defaultBackgroundColor = Colors.blueGrey.shade900;
  static final Color activeBorderColor = Colors.redAccent;
  static final Color pressedBorderColor = Colors.greenAccent;
  static final Color defaultBorderColor = Colors.grey.shade700;
  static final Color startButtonColor = Colors.tealAccent.shade400;

  // Colores del gradiente de fondo
  static const List<Color> backgroundGradient = [
    Color(0xFF1B1F3B),
    Color(0xFF0F2027),
  ];

  // Configuración de la cuadrícula
  static const int gridColumns = 3;
  static const double gridSpacing = 12.0;
  static const double gridPadding = 12.0;
  static const double tileBorderRadius = 18.0;
  static const double tileBorderWidth = 4.0;

  // Textos de la interfaz
  static const String appTitle = 'Recuerda el patrón 🐾';
  static const String gameTitle = 'Recuerda el Patrón';
  static const String gameSubtitle = 'Observa • Recuerda • Repite';
  static const String startButtonText = 'Iniciar Juego';
  static const String gameOverTitle = '💀 Game Over';
  static const String levelText = 'Nivel: ';
  static const String levelReachedText = 'Nivel alcanzado: ';
  static const String homeButtonText = 'Inicio';
}