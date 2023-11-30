//Sistema para simular um sistema de controle de tráfego em uma cidade. Cada cruzamento é um participante,
//e o mediador coordena o fluxo de tráfego para evitar colisões.

// Mediator
class TrafficControlCenter {
  void requestGreenLight(Crossroad crossroad) {
    print('Controle de Tráfego: Sinal verde para ${crossroad.name}');
    crossroad.receiveGreenLight();
  }
}

// Participante
class Crossroad {
  String name;
  TrafficControlCenter mediator;

  Crossroad(this.name, this.mediator);

  void requestGreenLight() {
    print('$name: Pedido de sinal verde recebido.');
    mediator.requestGreenLight(this);
  }

  void receiveGreenLight() {
    print('$name: Sinal verde! Cruzando com segurança.');
  }
}

void main() {
  // Criando o mediador
  var trafficControl = TrafficControlCenter();

  // Criando cruzamentos
  var crossroadA = Crossroad('Cruzamento A', trafficControl);
  var crossroadB = Crossroad('Cruzamento B', trafficControl);

  // Solicitando sinal verde através do mediador
  crossroadA.requestGreenLight();
  crossroadB.requestGreenLight();
}
