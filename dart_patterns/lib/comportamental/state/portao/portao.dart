abstract interface class PortaoEletronico {
  void aberto();
  void fechado();
}

class Aberto implements PortaoEletronico {
  Portao portao;

  Aberto(this.portao);

  @override
  void aberto() {
    print("ABRINDO PORTAL");
    portao.trocarEstado(Aberto(portao));
  }

  @override
  void fechado() {
    print("POR FAVOR MUDE O ESTADO PARA FECHADO");
  }
}

class Fechado implements PortaoEletronico {
  Portao portao;

  Fechado(this.portao);

  @override
  void aberto() {
    print("POR FAVOR TROQUE O ESTADO PARA ABERTO");
    
  }

  @override
  void fechado() {
     print("FECHANDO PORTAL");
     portao.trocarEstado(Fechado(portao));
  }
}

class Portao {
  late PortaoEletronico _estado;

  Portao() {
    _estado = Fechado(this);
  }

  abrirPortao() {
    _estado.aberto();
  }

  fecharPortao() {
    _estado.fechado();
  }

  trocarEstado(PortaoEletronico portaoEletronico){
    _estado = portaoEletronico;
  }
}

// PORTAO -> 2 ESTADOS ABERTO E FECHADO
// POREM VOCE PRECISA PRIMIERO TER CIENCIA DE QUAL ESTADO ESTA PARA ASSIM DAR O COMANDO
// EXEMPLO O NOSSO ESTADO INICIAL É O FECHADO, A FUNCAO DO FECHAR É FECHAR, E NAO ABRIR, SE O
// ESTADO INICIAL ESTA FECHADO E VC CLICA EM  ABRIR, ELE NÃO FARA ISSO POIS PARA ABRIR TEM QUE ESTA NO ESTADO ABERTO
// JÁ NO ESTADO ABERTO ELE NAO FECHARA POIS PARA FECHAR ELE TEM QUE ESTA NO ESTADO DE FECHADO
// COM ISSO VC TORNA O CODIGO CONSISTENTE POIS É BASEADO NO ESTADO QUE ELE TERA O SEU COMPORTAMENTO

void main(List<String> args) {
  Portao portao = Portao(); // estado iniciao FECHADO
  portao.trocarEstado(Aberto(portao));
  portao.abrirPortao();
  portao.fecharPortao();

  portao.trocarEstado(Fechado(portao));
  portao.fecharPortao();
  portao.abrirPortao();
  
  //portao.trocarEstado(Aberto());
  //portao.abrirPortao();
  //portao.fecharPortao();
}
