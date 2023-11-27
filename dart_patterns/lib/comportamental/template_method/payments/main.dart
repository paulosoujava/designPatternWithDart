import 'package:dart_patterns/comportamental/template_method/payments/gateway.dart';
import 'package:dart_patterns/comportamental/template_method/payments/pagamentoCredito.dart';
import 'package:dart_patterns/comportamental/template_method/payments/pagamentoDebito.dart';
import 'package:dart_patterns/comportamental/template_method/payments/pagamentoDinheiro.dart';

void main(List<String> args) {
  final valor = 1000.00;
  final gateway = Gateway();

  print("Crédito"); 
  final pagamentoCredito = PagamentoCredito(gateway, valor);
  pagamentoCredito.realizarCobranca();

  print("\nDébito");
  final pagamentoDebito = PagamentoDebito(gateway, valor);
  pagamentoDebito.realizarCobranca();

  print("\nDinheiro");
  final pagamentoDinheiro = PagamentoDinheiro(gateway, valor);
  pagamentoDinheiro.realizarCobranca();
}