abstract class Frete {
  double calculaFrete(double valorPedido);
}

abstract class Pedido {
  double valor;
   late Frete frete;

  Pedido({required this.valor});

  Frete getFrete() {
    return frete;
  }

  void setFrete(Frete frete) {
    this.frete = frete;
  }

  double calculaFrete() {
    return frete.calculaFrete(valor);
  }
}

class FreteComun implements Frete {
  @override
  double calculaFrete(double valor) {
    return valor * 0.05;
  }
}

class FreteExpresso implements Frete {
  @override
  double calculaFrete(double valor) {
    return valor * 0.1;
  }
}

class PedidoEletronico extends Pedido {
  final String nomeSetor = "Eletronico";

  PedidoEletronico({required super.valor});
}

class PedidoMovies extends Pedido {
  final String nomeSetor = "Moveis";

  PedidoMovies({required super.valor});
}

void main(List<String> args) {
  final freteComun = FreteComun();
  final freteExpresso = FreteExpresso();

  

  final pedido = PedidoEletronico(valor: 100, );
  pedido.setFrete(freteExpresso);
  print("PEDIDO DO SETOR: ${pedido.nomeSetor}");
  print("Frete Comum R\$: ${pedido.calculaFrete()}");
  
  pedido.setFrete(freteComun);
  print("Frete Comum R\$: ${pedido.calculaFrete()}");

  print("");

  final pedidoM = PedidoMovies(valor: 100);
  pedidoM.setFrete(freteExpresso);
  print("PEDIDO DO SETOR: ${pedidoM.nomeSetor}");
  print("Frete Comum R\$: ${pedidoM.calculaFrete()}");
}
