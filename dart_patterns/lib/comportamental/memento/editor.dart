// Suponha que temos um editor de texto e queremos implementar a capacidade de desfazer (undo) e refazer (redo) ações.
// Originator - Classe que mantém o estado atual
class TextEditor {
  late String _content;

  void write(String content) {
    _content = content;
    print('Texto atual: $_content');
  }

  // Cria um Memento para salvar o estado atual
  TextEditorMemento save() {
    return TextEditorMemento(_content);
  }

  // Restaura o estado a partir de um Memento
  void restore(TextEditorMemento memento) {
    _content = memento.getContent();
    print('Texto restaurado: $_content');
  }
}

// Memento - Classe que armazena o estado do Originator
class TextEditorMemento {
  String _content;

  TextEditorMemento(this._content);

  String getContent() {
    return _content;
  }
}

// Caretaker - Classe que gerencia os Mementos
class History {
  List<TextEditorMemento> _history = [];

  void addMemento(TextEditorMemento memento) {
    _history.add(memento);
  }

  TextEditorMemento? getLatestMemento() {
    if (_history.isNotEmpty) {
      return _history.removeLast();
    }
    return null;
  }
}

void main() {
  // Criando o editor de texto
  var textEditor = TextEditor();

  // Criando o histórico
  var history = History();

  // Escrevendo e salvando estados no editor de texto
  textEditor.write('Primeira linha');
  history.addMemento(textEditor.save());

  textEditor.write('Segunda linha');
  history.addMemento(textEditor.save());

  // Restaurando o estado anterior
  var undoMemento = history.getLatestMemento();
  textEditor.restore(undoMemento!);

  // Adicionando mais uma ação para refazer
  textEditor.write('Terceira linha');
  history.addMemento(textEditor.save());

  // Simulando o refazer
  var redoMemento = history.getLatestMemento();
  textEditor.restore(redoMemento!);
}
