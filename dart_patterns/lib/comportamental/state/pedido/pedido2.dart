// sistema de pagamento com diferentes estados:
// Pagamento Efetuado,
// Pagamento Cancelado,
// Pagamento Finalizado,
// Pagamento Extornado 
// Pedido Enviado:

// Interface para os estados do pagamento
abstract class EstadoPagamento {
  void efetuarPagamento();
  void cancelarPagamento();
  void finalizarPagamento();
  void estornarPagamento();
  void enviarPedido();
}

// Implementação concreta do estado Pagamento Efetuado
class PagamentoEfetuado implements EstadoPagamento {
  @override
  void efetuarPagamento() {
    print("O pagamento já foi efetuado.");
  }

  @override
  void cancelarPagamento() {
    print("Cancelando o pagamento.");
  }

  @override
  void finalizarPagamento() {
    print("Finalizando o pagamento.");
  }

  @override
  void estornarPagamento() {
    print("Estornando o pagamento.");
  }

  @override
  void enviarPedido() {
    print("Pedido não pode ser enviado antes do pagamento ser finalizado.");
  }
}

// Implementação concreta do estado Pagamento Cancelado
class PagamentoCancelado implements EstadoPagamento {
  @override
  void efetuarPagamento() {
    print("Efetuando o pagamento.");
  }

  @override
  void cancelarPagamento() {
    print("O pagamento já foi cancelado.");
  }

  @override
  void finalizarPagamento() {
    print("Finalizando o pagamento cancelado.");
  }

  @override
  void estornarPagamento() {
    print("Não é possível estornar um pagamento cancelado.");
  }

  @override
  void enviarPedido() {
    print("Pedido não pode ser enviado antes do pagamento ser finalizado.");
  }
}

// Outras implementações concretas de estados (PagamentoFinalizado, PagamentoExtornado, PedidoEnviado) podem ser adicionadas de forma semelhante.

// Classe Contexto - neste caso, o Pagamento
class Pagamento {
  EstadoPagamento estadoAtual;

  Pagamento(this.estadoAtual);

  void realizarAcao() {
    estadoAtual.efetuarPagamento();
  }

  void cancelarPagamento() {
    estadoAtual.cancelarPagamento();
  }

  void finalizarPagamento() {
    estadoAtual.finalizarPagamento();
  }

  void estornarPagamento() {
    estadoAtual.estornarPagamento();
  }

  void enviarPedido() {
    estadoAtual.enviarPedido();
  }

  void trocarEstado(EstadoPagamento novoEstado) {
    estadoAtual = novoEstado;
  }
}

void main() {
  // Criando instâncias dos estados
  var pagamentoEfetuado = PagamentoEfetuado();
  var pagamentoCancelado = PagamentoCancelado();

  // Criando uma instância do contexto (Pagamento)
  var meuPagamento = Pagamento(pagamentoEfetuado);

  // Realizando ação no estado atual (Pagamento Efetuado)
  meuPagamento.realizarAcao();  // Saída: O pagamento já foi efetuado.

  // Trocando para o estado Pagamento Cancelado
  meuPagamento.trocarEstado(pagamentoCancelado);

  // Realizando ação no novo estado (Pagamento Cancelado)
  meuPagamento.cancelarPagamento();  // Saída: O pagamento já foi cancelado.
}
