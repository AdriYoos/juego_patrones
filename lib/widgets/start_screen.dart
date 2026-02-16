import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Widget que muestra la pantalla de inicio del juego
class StartScreen extends StatelessWidget {
  final VoidCallback onStartGame;

  const StartScreen({
    super.key,
    required this.onStartGame,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppConstants.backgroundGradient,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono principal del juego
            const Icon(
              Icons.pets,
              size: 90,
              color: Colors.white,
            ),

            const SizedBox(height: 20),

            // Título del juego
            const Text(
              AppConstants.gameTitle,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 10),

            // Subtítulo descriptivo
            const Text(
              AppConstants.gameSubtitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 50),

            // Botón para iniciar el juego
            ElevatedButton(
              onPressed: onStartGame,// se llama a la función que inicia el juego cuando se presiona el botón
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.startButtonColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 8,
              ),
              child: const Text(
                AppConstants.startButtonText,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}