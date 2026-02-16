import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Widget que muestra el diálogo cuando el jugador pierde
class GameOverDialog extends StatelessWidget {
  final int level;
  final VoidCallback onReturnHome;

  const GameOverDialog({
    super.key,
    required this.level,
    required this.onReturnHome,
  });

  /// Muestra el diálogo de Game Over
  static void show(BuildContext context, int level, VoidCallback onReturnHome) {
    showDialog(
      context: context,
      builder: (_) => GameOverDialog(
        level: level,
        onReturnHome: onReturnHome,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppConstants.gameOverTitle),
      content: Text('${AppConstants.levelReachedText}$level'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onReturnHome();
          },
          child: const Text(AppConstants.homeButtonText),
        ),
      ],
    );
  }
}