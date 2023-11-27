// ignore_for_file: file_names

import 'package:dart_patterns/comportamental/template_method/payments/pagamento.dart';

class PagamentoDebito extends Pagamento {

  PagamentoDebito(super.gateway, super.valor);

  @override
  double calcularTaxa() {
    return 4;
  }

  @override
  double calcularDesconto() {
    return valor * 0.05;
  }
  
}