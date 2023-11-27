// sistema de aprovação de descontos em uma loja online,
//onde cada nível de aprovação tem um limite de desconto
//que pode ser concedido. Se um nível não pode aprovar o
// desconto, a solicitação é encaminhada para o próximo nível.

// Define the SolicitacaoDesconto class before the ManipuladorDesconto classes

class Pedido {
  final String produto;
  final double valor;
  double descontoAprovado = 0.0;

  Pedido(this.produto, this.valor);
}

abstract class ManipuladorDesconto {
  void calcula(Pedido pedido);
  setProximo(ManipuladorDesconto solicitacao);
}


class DescontoAte10Porcento extends ManipuladorDesconto {
  static const double LIMITE_DESCONTO = 10.0;

  late ManipuladorDesconto _proximoNivel;

  @override
  void calcula(Pedido pedido) {
    if (pedido.valor <= LIMITE_DESCONTO) {
      pedido.descontoAprovado = pedido.valor * 0.1;
      print(
          "Desconto de até 10% aprovado para ${pedido.produto}. Desconto: ${pedido.descontoAprovado}");
    } else {
      _proximoNivel.calcula(pedido);
    }
  }
   @override
  setProximo(ManipuladorDesconto desconto) {
    _proximoNivel = desconto;
  }

}

class DescontoAte20Porcento extends ManipuladorDesconto {
  static const double LIMITE_DESCONTO = 20.0;

  late ManipuladorDesconto _proximoNivel;

  @override
  void calcula(Pedido pedido) {
    if (pedido.valor <= LIMITE_DESCONTO) {
      pedido.descontoAprovado = pedido.valor * 0.2;
      print(
          "Desconto de até 20% aprovado para ${pedido.produto}. Desconto: ${pedido.descontoAprovado}");
    } else {
      _proximoNivel.calcula(pedido);
    }
  }
   @override
  setProximo(ManipuladorDesconto desconto) {
    _proximoNivel = desconto;
  }
}

class DescontoAte30Porcento extends ManipuladorDesconto {
  static const double LIMITE_DESCONTO = 30.0;
  late ManipuladorDesconto _proximoNivel;

  @override
  void calcula(Pedido pedido) {
    if (pedido.valor <= LIMITE_DESCONTO) {
      pedido.descontoAprovado = pedido.valor * 0.3;
      print(
          "Desconto de até 30% aprovado para ${pedido.produto}. Desconto: ${pedido.descontoAprovado}");
    } else {
      print(
          "Nenhum desconto disponível para ${pedido.produto}. Valor muito alto.");
    }
  }
  @override
  setProximo(ManipuladorDesconto desconto) {
    _proximoNivel = desconto;
  }
}

class NenhumDesconto extends ManipuladorDesconto {

  @override
  void setProximo(ManipuladorDesconto solicitacao) {}

  @override
  void calcula(Pedido pedido) {
    print(
        "Nenhum desconto disponível para ${pedido.produto}. Valor muito alto.");
  }
}



void main() {
  // Configurando a corrente de aprovação de descontos
  final descontoAte30 = DescontoAte30Porcento();
  final descontoAte20 = DescontoAte20Porcento();
  final descontoAte10 = DescontoAte10Porcento();

descontoAte30.setProximo(descontoAte20);
descontoAte20.setProximo(descontoAte10);
descontoAte10.setProximo(NenhumDesconto());

  // Criando solicitações de desconto
  final solicitacao1 = Pedido("Produto A", 10.0);
  final solicitacao2 = Pedido("Produto B", 20.0);
  final solicitacao3 = Pedido("Produto C", 30.0);
  final solicitacao4 = Pedido("Produto D", 35.0);

  // Solicitando descontos
  descontoAte10.calcula(solicitacao1);
  print("\n");
   descontoAte30.calcula(solicitacao4);
  print("\n");
  descontoAte20.calcula(solicitacao2);
  print("\n");
  descontoAte30.calcula(solicitacao3);
  
}
