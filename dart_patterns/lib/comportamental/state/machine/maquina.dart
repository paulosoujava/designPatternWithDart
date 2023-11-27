//Suponha que estamos modelando um interruptor de luz que pode ter estados diferentes, como "ligado" e "desligado". O padrão State permite que o objeto mude seu comportamento 
//quando o estado interno muda. 

// Interface para os estados da luz
abstract class EstadoLuz {
  void ligar();
  void desligar();
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
}

// Classe Contexto - neste caso, a Luz
class Luz {
  EstadoLuz estadoAtual;

  Luz(this.estadoAtual);

  void realizarAcao() {
    estadoAtual.ligar();
  }

  void trocarEstado(EstadoLuz novoEstado) {
    estadoAtual = novoEstado;
  }
}

void main() {
  // Criando instâncias dos estados
  var ligado = Ligado();
  var desligado = Desligado();

  // Criando uma instância do contexto (Luz)
  var minhaLuz = Luz(desligado);

  // Realizando ação no estado atual (Desligado)
  minhaLuz.realizarAcao();  // Saída: Ligando a luz.

  // Trocando para o estado Ligado
  minhaLuz.trocarEstado(ligado);

  // Realizando ação no novo estado (Ligado)
  minhaLuz.realizarAcao();  // Saída: A luz já está ligada.
}
