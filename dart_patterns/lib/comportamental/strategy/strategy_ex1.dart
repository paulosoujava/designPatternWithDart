// Interface Estratégia de Pagamento
abstract class EstrategiaPagamento {
  void coletarDetalhesPagamento();
  bool pagar(int valorPagamento);
}

// Estratégia Concreta: PayPal
class PagamentoPayPal implements EstrategiaPagamento {
  late String email;
  late String senha;
  bool logado = false;

  @override
  void coletarDetalhesPagamento() {
    print('Coletando detalhes de pagamento via PayPal...');
    // Em uma aplicação do mundo real, esses detalhes podem ser obtidos de uma interface de usuário.
    email = 'exemplo.paypal@exemplo.com';
    senha = 'senhaExemploPayPal';
    logado = true;
  }

  @override
  bool pagar(int valorPagamento) {
    if (logado) {
      print('Processando pagamento PayPal no valor de $valorPagamento unidades.');
      // Lógica de pagamento PayPal
      return true;
    } else {
      print('Falha no login do PayPal. Pagamento não realizado.');
      return false;
    }
  }
}

// Estratégia Concreta: Cartão de Crédito
class PagamentoCartaoCredito implements EstrategiaPagamento {
  late String numeroCartao;
  late String dataExpiracao;
  late String cvv;

  @override
  void coletarDetalhesPagamento() {
    print('Coletando detalhes de pagamento via Cartão de Crédito...');
    // Em uma aplicação do mundo real, esses detalhes podem ser obtidos de uma interface de usuário.
    numeroCartao = '1234-5678-9012-3456';
    dataExpiracao = '12/23';
    cvv = '123';
  }

  @override
  bool pagar(int valorPagamento) {
    print('Processando pagamento com Cartão de Crédito no valor de $valorPagamento unidades.');
    // Lógica de pagamento com Cartão de Crédito
    return true;
  }
}

// Classe Contexto: Pedido
class Pedido {
  int _totalCost = 0;
  bool _foiFechado = false;
  EstrategiaPagamento? _estrategiaPagamento;

  void setEstrategiaPagamento(EstrategiaPagamento estrategia) {
    _estrategiaPagamento = estrategia;
  }

  void processarPedido() {
    if (_estrategiaPagamento == null) {
      print('Por favor, defina uma estratégia de pagamento antes de processar o pedido.');
      return;
    }

    _estrategiaPagamento!.coletarDetalhesPagamento();
    print('Processando pedido com um custo total de $_totalCost unidades.');
    if (_estrategiaPagamento!.pagar(_totalCost)) {
      print('Pagamento realizado com sucesso.');
      _foiFechado = true;
    } else {
      print('Pagamento falhou. Por favor, verifique seus detalhes de pagamento.');
    }
  }

  void setTotalCost(int custo) {
    _totalCost = custo;
  }

  int getTotalCost() {
    return _totalCost;
  }

  bool foiFechado() {
    return _foiFechado;
  }
}

void main() {
  Pedido pedido = Pedido();

  // Exemplo de uso com estratégia de pagamento PayPal
  pedido.setEstrategiaPagamento(PagamentoPayPal());
  pedido.setTotalCost(100);
  pedido.processarPedido();

  // Exemplo de uso com estratégia de pagamento Cartão de Crédito
  pedido.setEstrategiaPagamento(PagamentoCartaoCredito());
  pedido.setTotalCost(150);
  pedido.processarPedido();
}
