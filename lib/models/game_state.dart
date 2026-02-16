/// Modelo que representa el estado del juego de memoria
/// Contiene toda la lógica de negocio y estado del juego
class GameState {
  final List<int> sequence; // Lista de índices que representan la secuencia a recordar
  final List<int> userInput; // Lista de índices ingresados por el usuario
  
  int activeIndex; // Índice del elemento actualmente resaltado durante la reproducción
  int pressedIndex; // Índice del elemento presionado por el usuario
  
  bool userTurn; // Indica si es el turno del usuario para ingresar la secuencia
  bool gameStarted; // Indica si el juego ha iniciado
  
  int level; // Nivel actual del juego

  GameState({ // Constructor para inicializar el estado del juego, con valores por defecto
    required this.sequence,
    required this.userInput,
    this.activeIndex = -1,
    this.pressedIndex = -1,
    this.userTurn = false,
    this.gameStarted = false,
    this.level = 0,
  });

  /// Crea una copia del estado actual con los valores actualizados 
  GameState copyWith({
    List<int>? sequence,
    List<int>? userInput,
    int? activeIndex,
    int? pressedIndex,
    bool? userTurn,
    bool? gameStarted,
    int? level,
  }) {
    return GameState(
      sequence: sequence ?? List.from(this.sequence),
      userInput: userInput ?? List.from(this.userInput),
      activeIndex: activeIndex ?? this.activeIndex,
      pressedIndex: pressedIndex ?? this.pressedIndex,
      userTurn: userTurn ?? this.userTurn,
      gameStarted: gameStarted ?? this.gameStarted,
      level: level ?? this.level,
    );
  }

  /// Crea un estado inicial limpio para el juego
  factory GameState.initial() { // para el momento que reinicia el juego
    return GameState(
      sequence: [],
      userInput: [],
      activeIndex: -1,
      pressedIndex: -1,
      userTurn: false,
      gameStarted: false,
      level: 0,
    );
  }
}