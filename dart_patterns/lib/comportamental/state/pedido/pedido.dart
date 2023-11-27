// ignore_for_file: non_constant_identifier_names, unused_import

/* Jeito errado de fazer
class Pedido {
  final AGUARDANDO_PAGAMENTO = 1;
  final PAGO = 2;
  final CANCELADO = 3;
  final ENVIADO = 4;

  int estadoAtual = 1;

  sucessoAoPagar() {
    if (estadoAtual == AGUARDANDO_PAGAMENTO) {
      estadoAtual = PAGO;
      print("Sucesso ao pagar");
    }else{
      print("Erro ao pagar");
    }
  }

  cancelarPedido(){
    if (estadoAtual == AGUARDANDO_PAGAMENTO || estadoAtual == PAGO) {
      estadoAtual = CANCELADO;
      print("Pedido cancelado");
    }else {
      print("Erro ao cancelar");
    }
  }

  despacharPedido(){
     if (estadoAtual == PAGO) {
      estadoAtual = ENVIADO;
      print("Enviado");
    }else{
      print("Erro ao enviar");
    }
  }
}

*/
import 'package:dart_patterns/comportamental/strategy/strategy.dart';

abstract interface class State {
  sucessoAoPager();
  cancelar();
  despachar();
}

class Pedido {
  late State aguardandoPagamento;
  late State pago;
  late State cancelado;
  late State enviado;
  late State estadoAtual;

  Pedido() {
    aguardandoPagamento = AguardandoPedido(this);
    pago = PagoPedido(this);
    cancelado = CanceladoPedido(this);
    enviado = EnviadoPedido(this);
    estadoAtual = AguardandoPedido(this);
  }
  realizarPagamento() {
    estadoAtual.sucessoAoPager();
  }

  cancelarPedido() {
    estadoAtual.cancelar();
  }

  despacharPedido() {
    estadoAtual.despachar();
  }

  setPedido(State state) {
    estadoAtual = state;
  }

  getState() => estadoAtual;
}

class AguardandoPedido implements State {
  final Pedido pedido;

  AguardandoPedido(this.pedido);

  @override
  cancelar() {
    pedido.setPedido(pedido.cancelado);
  }

  @override
  despachar() {
    print("PEDIDO NÃO PAGO CANCELAMENTO INEXISTENTE");
  }

  @override
  sucessoAoPager() {
    pedido.setPedido(pedido.pago);
  }
}

class PagoPedido implements State {
  final Pedido pedido;

  PagoPedido(this.pedido);

  @override
  cancelar() {
    pedido.setPedido(pedido.cancelado);
  }

  @override
  despachar() {
    pedido.setPedido(pedido.enviado);
  }

  @override
  sucessoAoPager() {
    print("PEDIDO JA PAGO");
  }
}

class CanceladoPedido implements State {
  final Pedido pedido;

  CanceladoPedido(this.pedido);

  @override
  cancelar() {
    print("PEDIDO JA Cancelado");
  }

  @override
  despachar() {
    print("PEDIDO Cancelado");
  }

  @override
  sucessoAoPager() {
    print("PEDIDO Cancelado");
  }
}

class EnviadoPedido implements State {
  final Pedido pedido;

  EnviadoPedido(this.pedido);

  @override
  cancelar() {
    print("PEDIDO ENVIADO");
  }

  @override
  despachar() {
    print("PEDIDO JÁ ENVIADO");
  }

  @override
  sucessoAoPager() {
    print("PEDIDO PAGO E ENVIADO");
  }
}

void main(List<String> args) {
  
  var pedido =  Pedido();
  pedido.realizarPagamento();
  //pedido.cancelarPedido();
  pedido.despacharPedido();
  
}
