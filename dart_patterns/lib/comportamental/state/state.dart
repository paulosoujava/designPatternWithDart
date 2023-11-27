// Interface para os estados da Luz
abstract class EstadoLuz {
  void ligar();
  void desligar();
  void piscar();
}

// Implementação concreta do estado Ligado
class Ligado implements EstadoLuz {
  @override
  void ligar() {
    print("A luz já está ligada.");
  }

  @override
  void desligar() {
    print("Desligando a luz.");
  }

  @override
  void piscar() {
    print("A luz está piscando.");
  }
}

// Implementação concreta do estado Desligado
class Desligado implements EstadoLuz {
  @override
  void ligar() {
    print("Ligando a luz.");
  }

  @override
  void desligar() {
    print("A luz já está desligada.");
  }

  @override
  void piscar() {
    print("Não é possível piscar a luz, pois ela está desligada.");
  }
}

// Implementação concreta do estado Piscando
class Piscando implements EstadoLuz {
  @override
  void ligar() {
    print("Não é possível ligar a luz enquanto ela está piscando.");
  }

  @override
  void desligar() {
    print("Parando o piscar e desligando a luz.");
  }

  @override
  void piscar() {
    print("A luz já está piscando.");
  }
}

// Classe principal que utiliza o padrão State
class Luz {
  late EstadoLuz _estado;

  // Construtor que define o estado inicial como Desligado
  Luz() {
    _estado = Desligado();
  }

  // Métodos delegam as operações para o estado atual
  void ligar() {
    _estado.ligar();
  }

  void desligar() {
    _estado.desligar();
  }

  void piscar() {
    _estado.piscar();
  }

  // Método para mudar o estado da luz
  void trocarEstado(EstadoLuz novoEstado) {
    _estado = novoEstado;
  }
}

void main() {
  // Exemplo de uso do padrão State
  var minhaLuz = Luz();

  minhaLuz.ligar(); // Ligando a luz.
  minhaLuz.piscar(); // A luz está piscando.

  minhaLuz.trocarEstado(Piscando());
  minhaLuz.ligar(); // Não é possível ligar a luz enquanto ela está piscando.
  minhaLuz.desligar(); // Parando o piscar e desligando a luz.
}
