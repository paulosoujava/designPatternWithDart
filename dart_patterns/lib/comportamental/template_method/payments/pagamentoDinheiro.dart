// ignore_for_file: file_names

import 'package:dart_patterns/comportamental/template_method/payments/pagamento.dart';

class PagamentoDinheiro extends Pagamento {
  PagamentoDinheiro(super.gateway, super.valor);

  
  @override
  double calcularDesconto() {
    return valor * 0.01;
  }
}
