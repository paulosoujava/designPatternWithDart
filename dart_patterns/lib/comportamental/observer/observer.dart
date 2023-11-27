// Definindo a classe Subject (o sujeito)
class FestaSubject {
  // Lista de observadores
  final List<ConvidadoObserver> _observadores = [];

  // Método para adicionar observadores
  void adicionarObservador(ConvidadoObserver observador) {
    _observadores.add(observador);
  }

  // Método para notificar todos os observadores
  void notificarObservadores(String mensagem) {
    for (var observador in _observadores) {
      observador.atualizar(mensagem);
    }
  }

  // Método que representa algo interessante acontecendo (mudança de estado)
  void algoInteressanteAconteceu() {
    print("🎉 Algo interessante está acontecendo na festa! 🎉");
    notificarObservadores("🎉 Algo interessante aconteceu! 🎉");
  }
}

// Definindo a interface Observer (observador)
abstract class ConvidadoObserver {
  void atualizar(String mensagem);
}

// Implementando uma classe de observador (Convidado)
class ConvidadoFesta implements ConvidadoObserver {
  final String nome;

  ConvidadoFesta(this.nome);

  @override
  void atualizar(String mensagem) {
    print("$nome recebeu uma notificação: $mensagem");
  }
}

void main() {
  // Criando o sujeito (festa)
  var festa = FestaSubject();

  // Criando observadores (convidados)
  var convidado1 = ConvidadoFesta("João");
  var convidado2 = ConvidadoFesta("Maria");

  // Adicionando observadores à lista do sujeito
  festa.adicionarObservador(convidado1);
  festa.adicionarObservador(convidado2);

  // Algo interessante acontece na festa (mudança de estado)
  festa.algoInteressanteAconteceu();
}
