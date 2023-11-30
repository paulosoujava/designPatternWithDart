// Vamos imaginar um jogo onde um jogador pode salvar e carregar seu progresso usando o padrão Memento.\
// Originator
class GameState {
  String _playerName;
  int _level;

  GameState(this._playerName, this._level);

  void play() {
    print('Jogando como $_playerName no nível $_level.');
  }

  // Salvar o estado atual
  GameStateMemento save() {
    return GameStateMemento(_playerName, _level);
  }

  // Restaurar o estado a partir de um memento
  void restore(GameStateMemento memento) {
    _playerName = memento.getPlayerName();
    _level = memento.getLevel();
    print('Estado restaurado: Jogando como $_playerName no nível $_level.');
  }
}

// Memento
class GameStateMemento {
  String _playerName;
  int _level;

  GameStateMemento(this._playerName, this._level);

  String getPlayerName() => _playerName;

  int getLevel() => _level;
}

// Caretaker
class GameHistory {
  List<GameStateMemento> _history = [];

  void saveState(GameState gameState) {
    _history.add(gameState.save());
  }

  GameStateMemento? undo() {
    if (_history.isNotEmpty) {
      return _history.removeLast();
    }
    return null;
  }
}

void main() {
  // Criando o estado inicial do jogo
  var initialGameState = GameState('Player1', 1);
  initialGameState.play();

  // Criando o histórico do jogo
  var gameHistory = GameHistory();

  // Salvando o estado atual
  gameHistory.saveState(initialGameState);

  // Jogando e salvando novamente
  initialGameState.play();
  initialGameState = GameState('Player1', 2);
  initialGameState.play();
  gameHistory.saveState(initialGameState);

  // Desfazendo uma jogada
  var undoMemento = gameHistory.undo();
  initialGameState.restore(undoMemento!);
}
