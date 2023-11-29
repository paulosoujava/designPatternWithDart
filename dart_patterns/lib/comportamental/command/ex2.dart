class Lampada {
  late String _identificacao;
  late bool _estado;

  Lampada(String identificacao, bool estado) {
    _estado = estado;
    _identificacao = identificacao;
  }

  void ligar() {
    _estado = true;
  }

  void desligar() {
    _estado = false;
  }

  String getIdentificacao() {
    return _identificacao;
  }

  bool getEstado() {
    return _estado;
  }

  void imprimeObjeto() {
    print("Identificação: $_identificacao, Estado: $_estado");
  }
}

class ArCondicionado {
  late String _identificacao;
  late bool _estado;
  late int _temperatura;

  ArCondicionado(String identificacao, bool estado, int temperatura) {
    _estado = estado;
    _identificacao = identificacao;
    _temperatura = temperatura;
  }

  void ligar() {
    _estado = true;
  }

  void desligar() {
    _estado = false;
  }

  void setTemperatura(int temperatura) {
    _temperatura = temperatura;
  }

  String getIdentificacao() {
    return _identificacao;
  }

  bool getEstado() {
    return _estado;
  }

  int getTemperatura() {
    return _temperatura;
  }

  void imprimeObjeto() {
    print("Identificação: $_identificacao, Estado: $_estado, Temperatura: $_temperatura");
  }
}

abstract interface class Command
{
    void executar();
    void desfazer();
}


class LigarLampada implements Command {
  late Lampada _lampada; // Precisamos saber qual lâmpada será ligada

  LigarLampada(Lampada lampada) {
    _lampada = lampada;
  }

  @override
  void executar() {
    // No método executar, chamar o método ligar() de um objeto Lampada
    _lampada.ligar();
    // chamar o método imprimeObjeto() de um objeto Lampada para dar feedback
    _lampada.imprimeObjeto();
  }

  @override
  void desfazer() {
    // No método desfazer, chamar o método desligar() de um objeto Lampada
    _lampada.desligar();
    // chamar o método imprimeObjeto() de um objeto Lampada para dar feedback
    _lampada.imprimeObjeto();
  }
}



class DesligarLampada implements Command {
  late Lampada _lampada; // Precisamos saber qual lâmpada será desligada

  DesligarLampada(Lampada lampada) {
    _lampada = lampada;
  }

  @override
  void executar() {
    // No método executar, chamar o método desligar() de um objeto Lampada
    _lampada.desligar();
    // chamar o método imprimeObjeto() de um objeto Lampada para dar feedback
    _lampada.imprimeObjeto();
  }

  @override
  void desfazer() {
    // No método desfazer, chamar o método ligar() de um objeto Lampada
    _lampada.ligar();
    // chamar o método imprimeObjeto() de um objeto Lampada para dar feedback
    _lampada.imprimeObjeto();
  }
}


class LigarArCondicionado implements Command {
 late  ArCondicionado _arCondicionado; // O ar-condicionado que será ligado.

  LigarArCondicionado(ArCondicionado arCondicionado) {
    _arCondicionado = arCondicionado;
  }

  @override
  void executar() {
    // No método executar, chamar o método ligar() de um objeto ArCondicionado
    _arCondicionado.ligar();
    // No método executar, chamar o método imprimeObjeto() de um objeto ArCondicionado
    _arCondicionado.imprimeObjeto();
  }

  @override
  void desfazer() {
    // No método desfazer, chamar o método desligar() de um objeto ArCondicionado
    _arCondicionado.desligar();
    // chamar o método imprimeObjeto() de um objeto ArCondicionado para dar feedback
    _arCondicionado.imprimeObjeto();
  }
}


class DesligarArCondicionado implements Command {
 late  ArCondicionado _arCondicionado; // O ar-condicionado que será desligado.

  DesligarArCondicionado(ArCondicionado arCondicionado) {
    _arCondicionado = arCondicionado;
  }

  @override
  void executar() {
    // No método executar, chamar o método desligar() de um objeto ArCondicionado
    _arCondicionado.desligar();
    // No método executar, chamar o método imprimeObjeto() de um objeto ArCondicionado
    _arCondicionado.imprimeObjeto();
  }

  @override
  void desfazer() {
    // No método desfazer, chamar o método ligar() de um objeto ArCondicionado
    _arCondicionado.ligar();
    // chamar o método imprimeObjeto() de um objeto ArCondicionado para dar feedback
    _arCondicionado.imprimeObjeto();
  }
}


class MudarTemperaturaArCondicionado implements Command {
 late  ArCondicionado _arCondicionado; // O ar-condicionado que terá a temperatura mudada.
  late int _temperatura;
  late int _temperaturaAnterior;

  MudarTemperaturaArCondicionado(ArCondicionado arCondicionado) {
    _arCondicionado = arCondicionado;
    _temperatura = arCondicionado.getTemperatura();
  }

  // Define a temperatura que o ArCondicionado terá quando o método executar for executado.
  void setTemperatura(int temperatura) {
    // Salva a temperatura antiga
    _temperaturaAnterior = _temperatura;
    // Define a nova temperatura
    _temperatura = temperatura;
  }

  @override
  void executar() {
    // No método executar, chamar o método setTemperatura() de um objeto ArCondicionado
    _arCondicionado.setTemperatura(_temperatura);
    // chamar o método imprimeObjeto() de um objeto ArCondicionado para dar feedback
    _arCondicionado.imprimeObjeto();
  }

  @override
  void desfazer() {
    // No método desfazer, chamar o método setTemperatura() de um objeto ArCondicionado
    _arCondicionado.setTemperatura(_temperaturaAnterior);
    // chamar o método imprimeObjeto() de um objeto ArCondicionado para dar feedback
    _arCondicionado.imprimeObjeto();
  }
}


class Aplicativo {
  List<Command> _comandos = []; // Lista que suporta quantos comandos forem necessários.

  /* Para um comando ser adicionado à lista de comandos do aplicativo ele precisa
     implementar a interface Command, assim sabemos que ele possui o método executar(). */
  int setComando(Command comando) {
    _comandos.add(comando); // Adiciona o comando na última posição de _comandos.
    // Retorna para o cliente a posição do array em que o comando foi inserido.
    return _comandos.length - 1;
  }

  /* Método que será chamado sempre um botão for pressionado na interface do aplicativo.
     O botão precisa passar o índice do comando a ser executado. */
  void aoPressionarBotao(int id) {
    _comandos[id].executar();
  }

  /* Método que será chamado sempre um botão for pressionado
     duas vezes rapidamente na interface do aplicativo.
     O botão precisa passar o índice do comando a ser desfeito. */
  void duploCliqueBotao(int id) {
    _comandos[id].desfazer();
  }

  // Retorna um comando do aplicativo.
  Command getComando(int id) {
    return _comandos[id];
  }
}

void main() {
  // ----- Vamos criar a Lâmpada da sala -----
  Lampada lampadaSala = Lampada('Lâmpada da Sala', false);
  // ----- Agora a Lâmpada do quarto -----
  Lampada lampadaQuarto = Lampada('Lâmpada do Quarto', false);
  // ----- O Ar-condicionado -----
  ArCondicionado arCondicionado = ArCondicionado('Ar-Condicionado', false, 26);
  // ----- Vamos criar o Aplicativo -----
  Aplicativo aplicativo = Aplicativo();
  // ----- É a vez dos comandos serem criados -----
  // Comando para a lâmpada da sala
  LigarLampada ligarLampadaSala = LigarLampada(lampadaSala);
  DesligarLampada desligarLampadaSala = DesligarLampada(lampadaSala);
  // Comando para a lâmpada do quarto
  LigarLampada ligarLampadaQuarto = LigarLampada(lampadaQuarto);
  DesligarLampada desligarLampadaQuarto = DesligarLampada(lampadaQuarto);
  // Comandos para o Ar-condicionado
  LigarArCondicionado ligarAr = LigarArCondicionado(arCondicionado);
  DesligarArCondicionado desligarAr = DesligarArCondicionado(arCondicionado);
  MudarTemperaturaArCondicionado mudarTemperaturaAr = MudarTemperaturaArCondicionado(arCondicionado);
  // ----- Vamos armazenar os comandos no aplicativo -----
  // Os ids recebem o índice em que o comando foi adicionado ao aplicativo.
  int idLigarLampadaSala = aplicativo.setComando(ligarLampadaSala);
  int idDesligarLampadaSala = aplicativo.setComando(desligarLampadaSala);
  int idLigarAr = aplicativo.setComando(ligarAr);
  int idDesligarAr = aplicativo.setComando(desligarAr);
  int idMudarTemperaturaAr = aplicativo.setComando(mudarTemperaturaAr);
  int idLigarLampadaQuarto = aplicativo.setComando(ligarLampadaQuarto);
  int idDesligarLampadaQuarto = aplicativo.setComando(desligarLampadaQuarto);
  // ----- Vamos executar os comandos -----
  aplicativo.aoPressionarBotao(idLigarLampadaSala); // Ligar lâmpada da sala
  aplicativo.aoPressionarBotao(idDesligarLampadaSala); // Desligar lâmpada da sala
  aplicativo.aoPressionarBotao(idLigarLampadaQuarto); // Ligar lâmpada do quarto
  aplicativo.aoPressionarBotao(idDesligarLampadaQuarto); // Desligar lâmpada da quarto
  aplicativo.aoPressionarBotao(idLigarAr); // Ligar Ar-condicionado
  // Definir nova temperatura do Ar-condicionado
  mudarTemperaturaAr.setTemperatura(25);
  // Mudar temperatura do Ar-condicionado
  aplicativo.aoPressionarBotao(idMudarTemperaturaAr);
  aplicativo.aoPressionarBotao(idDesligarAr); // Desligar Ar-condicionado
  print("### Desfazer Comandos ###\n");
  aplicativo.duploCliqueBotao(idDesligarAr); // Desfazer o comando ligar ar
  aplicativo.duploCliqueBotao(idMudarTemperaturaAr); // Desfazer a mudança de temperatura
  aplicativo.duploCliqueBotao(idLigarAr); // Desfazer o ligamento do ar
  aplicativo.duploCliqueBotao(idDesligarLampadaQuarto); // Desfazer Desligar Lâmpada Quarto
}

