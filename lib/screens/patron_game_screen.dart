import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/game_state.dart';
import '../utils/constants.dart';
import '../widgets/start_screen.dart';
import '../widgets/game_grid.dart';
import '../widgets/game_over_dialog.dart';

/// Pantalla principal que gestiona el juego de memoria de patrones
class PatronGameScreen extends StatefulWidget {
  const PatronGameScreen({super.key});

  @override
  State<PatronGameScreen> createState() => _PatronGameScreenState();
}

class _PatronGameScreenState extends State<PatronGameScreen> {
  // Estado del juego
  late GameState _gameState;
  
  // Generador de números aleatorios para crear la secuencia de patrones
  final Random _random = Random();

  @override
  void initState() {// Inicializa el estado del juego al cargar la pantalla
    super.initState();
    _gameState = GameState.initial();
  }

  /// Inicia un nuevo juego
  void _startGame() {
    setState(() {
      _gameState = GameState.initial().copyWith(
        gameStarted: true,
      );
    });
    _nextRound();
  }

  /// Avanza al siguiente nivel del juego
  void _nextRound() async {
    // Preparar para la siguiente ronda
    setState(() {
      _gameState = _gameState.copyWith(
        userTurn: false,
        userInput: [],
        level: _gameState.level + 1,
      );
    });

    // Agregar un nuevo elemento a la secuencia
    _gameState.sequence.add(_random.nextInt(AppConstants.animalImages.length));

    // Reproducir la secuencia
    await _playSequence();

    // Habilitar el turno del usuario
    setState(() {
      _gameState = _gameState.copyWith(userTurn: true);
    });
  }

  /// Reproduce la secuencia actual de animales
  Future<void> _playSequence() async {
    for (int index in _gameState.sequence) {
      // Resaltar el elemento actual
      setState(() {
        _gameState = _gameState.copyWith(activeIndex: index);
      });
      
      await Future.delayed(AppConstants.highlightDuration);//delayed es para esperar un tiempo antes de continuar con la siguiente acción, en este caso, para mantener el resaltado visible durante un tiempo determinado.
      
      // Quitar el resaltado
      setState(() {
        _gameState = _gameState.copyWith(activeIndex: -1);
      });
      
      await Future.delayed(AppConstants.pauseBetweenHighlights);// Pausa entre resaltes para que el usuario pueda distinguir cada elemento de la secuencia
    }
  }

  /// Maneja el evento cuando el usuario presiona un tile
  void _onTilePressed(int index) {
    // Ignorar si no es el turno del usuario
    if (!_gameState.userTurn) return;

    // Resaltar el tile presionado
    setState(() {
      _gameState = _gameState.copyWith(pressedIndex: index);
    });

    // Quitar el resaltado después de un tiempo
    Future.delayed(AppConstants.userPressDuration, () {
      setState(() {
        _gameState = _gameState.copyWith(pressedIndex: -1);
      });
    });

    // Agregar la entrada del usuario
    _gameState.userInput.add(index);
    int step = _gameState.userInput.length - 1;

    // Verificar si la entrada es correcta
    if (_gameState.userInput[step] != _gameState.sequence[step]) {
      _showGameOver();
      return;
    }

    // Verificar si completó la secuencia
    if (_gameState.userInput.length == _gameState.sequence.length) {
      setState(() {
        _gameState = _gameState.copyWith(userTurn: false);
      });

      // Avanzar a la siguiente ronda después de un breve delay
      Future.delayed(AppConstants.delayBeforeNextRound, () {
        _nextRound();
      });
    }
  }

  /// Muestra el diálogo de Game Over
  void _showGameOver() {
    setState(() {
      _gameState = _gameState.copyWith(userTurn: false);
    });

    GameOverDialog.show(
      context,
      _gameState.level,
      () {
        setState(() {
          _gameState = GameState.initial();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        centerTitle: true,
      ),
      body: _gameState.gameStarted
          ? _buildGameView()
          : StartScreen(onStartGame: _startGame),//por que tieneonStartGame: _startGame? Porque el widget StartScreen necesita una función para llamar cuando el usuario presiona el botón de iniciar juego. Al pasar onStartGame: _startGame, estamos diciendo que cuando el StartScreen llame a onStartGame, se ejecutará la función _startGame definida en este estado, lo que iniciará el juego y cambiará la vista a la pantalla del juego en progreso.
    );
  }

  /// Construye la vista del juego en progreso
  Widget _buildGameView() {
  return OrientationBuilder(
    builder: (context, orientation) {
      bool isLandscape = orientation == Orientation.landscape;
      
      if (isLandscape) {
        return Row(
          children: [
            Container(
              width: 120, 
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.pets,
                    size: 40,  
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 15),  
                  Text(
                    '${AppConstants.levelText}${_gameState.level}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,  
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(  // ← AGREGAR: Center para centrar el grid
                child: GameGrid(
                  activeIndex: _gameState.activeIndex,
                  pressedIndex: _gameState.pressedIndex,
                  onTilePressed: _onTilePressed,
                ),
              ),
            ),
          ],
        );
        } else {
          return Column(
            children: [
              const SizedBox(height: 10),
              
              // Indicador de nivel
              Text(
                '${AppConstants.levelText}${_gameState.level}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 10),
              
              // Cuadrícula de animales
              Expanded(
                child: GameGrid(
                  activeIndex: _gameState.activeIndex,
                  pressedIndex: _gameState.pressedIndex,
                  onTilePressed: _onTilePressed,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}