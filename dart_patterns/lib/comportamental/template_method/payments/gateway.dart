import 'dart:math';

class Gateway {
  //simulaçao de uma cobranmça - retorna true ou false de forma randomica
  bool cobrar(double valor) {
    print("Valor: $valor\n");
    return Random().nextBool();
  }
}
