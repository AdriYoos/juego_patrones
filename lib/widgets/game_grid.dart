import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Widget que muestra la cuadrícula de animales del juego
class GameGrid extends StatelessWidget {
  final int activeIndex;
  final int pressedIndex;
  final Function(int) onTilePressed;

  const GameGrid({
    super.key,
    required this.activeIndex,
    required this.pressedIndex,
    required this.onTilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.gridPadding),
      child: OrientationBuilder(  // ← AGREGAR OrientationBuilder
        builder: (context, orientation) {
          // Detectar orientación y usar columnas apropiadas
          int columns = orientation == Orientation.landscape
              ? AppConstants.gridColumnsLandscape  // 4 columnas en horizontal
              : AppConstants.gridColumns;          // 3 columnas en vertical
          
          return GridView.count(
            crossAxisCount: columns,  // ← Usar variable dinámica
            mainAxisSpacing: AppConstants.gridSpacing,
            crossAxisSpacing: AppConstants.gridSpacing,
            children: List.generate(
              AppConstants.animalImages.length,
              (index) => _buildGameTile(index),
            ),
          );
        },
      ),
    );
  }

  /// Construye un tile individual de la cuadrícula
  Widget _buildGameTile(int index) {
    return GestureDetector(
      onTap: () => onTilePressed(index),
      child: AnimatedContainer( // para animar cambios de estado
        duration: AppConstants.userPressDuration,// pone una animación suave al cambiar el estado del tile
        decoration: BoxDecoration(//para darle estilo al tile, como el color de fondo, bordes y esquinas redondeadas
          color: _getBackgroundColor(index),//ocupa el index para determinar el color de fondo del tile según su estado (activo, presionado o normal)
          borderRadius: BorderRadius.circular(AppConstants.tileBorderRadius),
          border: Border.all(
            color: _getBorderColor(index),
            width: AppConstants.tileBorderWidth,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            AppConstants.animalImages[index],
            fit: BoxFit.contain,//fit es para asegurarse de que la imagen se ajuste dentro del tile sin distorsionarse, manteniendo su proporción original.
          ),
        ),
      ),
    );
  }

  /// Determina el color de fondo del tile según su estado
  Color _getBackgroundColor(int index) {
    if (index == activeIndex) {
      return AppConstants.activeColor;
    }
    if (index == pressedIndex) {
      return AppConstants.pressedColor;
    }
    return AppConstants.defaultBackgroundColor;
  }

  /// Determina el color del borde del tile según su estado
  Color _getBorderColor(int index) {
    if (index == activeIndex) return AppConstants.activeBorderColor;
    if (index == pressedIndex) return AppConstants.pressedBorderColor;
    return AppConstants.defaultBorderColor;
  }
}