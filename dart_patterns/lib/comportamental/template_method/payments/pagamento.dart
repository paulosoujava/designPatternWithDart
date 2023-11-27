import 'package:dart_patterns/comportamental/template_method/payments/gateway.dart';

abstract class Pagamento {
  double valor;
  Gateway gateway;

  Pagamento(this.gateway, this.valor);

   double calcularDesconto();


   double calcularTaxa(){
    return 0; 
   }

  //template methodo este metodo é o que da nome ao template method
  bool realizarCobranca() {
    final valorFinal = valor + calcularTaxa() - calcularDesconto();
    
    print(""" 
      $valor +  ${calcularTaxa()} - ${calcularDesconto()} = ${valorFinal.toStringAsFixed(2)}
    """);
    return gateway.cobrar(valorFinal);
  }
}
