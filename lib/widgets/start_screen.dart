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
        child: OrientationBuilder(
          builder: (context, orientation) {
            bool isLandscape = orientation == Orientation.landscape;
            
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono principal del juego
                Icon(
                  Icons.pets,
                  size: isLandscape ? 70 : 90,
                  color: Colors.white,
                ),

                SizedBox(height: isLandscape ? 15 : 20),

                // Título del juego
                Text(
                  AppConstants.gameTitle,
                  style: TextStyle(
                    fontSize: isLandscape ? 28 : 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),

                SizedBox(height: isLandscape ? 5 : 10),

                // Subtítulo descriptivo
                Text(
                  AppConstants.gameSubtitle,
                  style: TextStyle(
                    fontSize: isLandscape ? 16 : 18,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: isLandscape ? 30 : 50),

                // Botón para iniciar el juego
                ElevatedButton(
                  onPressed: onStartGame,// se llama a la función que inicia el juego cuando se presiona el botón
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.startButtonColor,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: isLandscape ? 50 : 60,
                      vertical: isLandscape ? 14 : 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    elevation: 8,
                  ),
                  child: Text(
                    AppConstants.startButtonText,
                    style: TextStyle(
                      fontSize: isLandscape ? 20 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}