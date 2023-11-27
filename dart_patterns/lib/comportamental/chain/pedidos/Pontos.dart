// ignore_for_file: file_names


abstract interface class CalculadorDePontos{
  double calcula(Pedido pedido);
  setProximo(CalculadorDePontos calculadorDePontos);
}

class Ponto70Reais implements CalculadorDePontos{
  
  late CalculadorDePontos _proximo;

  @override
  double calcula(Pedido pedido) {
    if(pedido.valor >= 70){
      return pedido.valor / 5;
    }
    return _proximo.calcula(pedido);
  }

  @override
  setProximo(CalculadorDePontos calculadorDePontos) {
    _proximo = calculadorDePontos;
  }

}
class Ponto40Reais implements CalculadorDePontos{
  
  late CalculadorDePontos _proximo;

  @override
  double calcula(Pedido pedido) {
    if(pedido.valor >= 40){
      return pedido.valor / 7;
    }
    return _proximo.calcula(pedido);
  }

  @override
  setProximo(CalculadorDePontos calculadorDePontos) {
    _proximo = calculadorDePontos;
  }

}

class Ponto20Reais implements CalculadorDePontos{
  
  late CalculadorDePontos _proximo;

  @override
  double calcula(Pedido pedido) {
    if(pedido.valor >= 20){
      return pedido.valor / 10;
    }
    return _proximo.calcula(pedido);
  }

  @override
  setProximo(CalculadorDePontos calculadorDePontos) {
    _proximo = calculadorDePontos;
  }

}
class NenhumPonto implements CalculadorDePontos{

  
  @override
  double calcula(Pedido pedido){
    return  0.0;
    }
      @override
      setProximo(CalculadorDePontos calculadorDePontos) {
   
      }
  }



class Pedido{
  double valor = 0.0;
}

class CalculadoraDePontos{
  
  double calcula(Pedido pedido, int dia){

   final pt70 = Ponto70Reais();
   final pt40 = Ponto40Reais();
   final pt20 = Ponto20Reais();
   final nen = NenhumPonto();
   
   pt70.setProximo(pt40);
   pt40.setProximo(pt20);
   pt20.setProximo(nen);

   if(dia >= 16 && dia <= 31){
      return pt70.calcula(pedido) * 2;
    }
     return  pt70.calcula(pedido);
  }
}

main(){
 final pedido = Pedido();
 final calcula = CalculadoraDePontos();

pedido.valor = 21;
 print("Dia 15 ${calcula.calcula(pedido, 15)} Pontos");
 print("Dia 16 ${calcula.calcula(pedido, 16)} Pontos");
 print("\n\n");

 pedido.valor = 100;

 print("Dia 15 ${calcula.calcula(pedido, 15)} Pontos");
 print("Dia 16 ${calcula.calcula(pedido, 16)} Pontos");
}