// ignore_for_file: file_names

import 'package:dart_patterns/comportamental/template_method/payments/pagamento.dart';


class PagamentoCredito  extends Pagamento{
  
  PagamentoCredito(super.gateway, super.valor);


  @override
  double calcularTaxa() {
    return valor * 0.05;
  }

  @override
  double calcularDesconto() {
    if (valor > 300) {
      return valor * 0.02;
    }
    return 0;
  }
 
}
