// Interface para o comando
abstract class Command {
  void execute();
}

// Receptor
class Light {
  void turnOn() {
    print("Luz ligada");
  }

  void turnOff() {
    print("Luz desligada");
  }
}

// Comandos concretos
class TurnOnCommand implements Command {
  final Light light;

  TurnOnCommand(this.light);

  @override
  void execute() {
    light.turnOn();
  }
}

class TurnOffCommand implements Command {
  final Light light;

  TurnOffCommand(this.light);

  @override
  void execute() {
    light.turnOff();
  }
}

// Invocador
class RemoteControl {
  late Command _command;

  void setCommand(Command command) {
    _command = command;
  }

  void pressButton() {
    _command.execute();
  }
}

// Exemplo de uso
void main() {
  // Criar instâncias
  Light livingRoomLight = Light();
  Command turnOn = TurnOnCommand(livingRoomLight);
  Command turnOff = TurnOffCommand(livingRoomLight);

  // Configurar o controle remoto
  RemoteControl remote = RemoteControl();
  remote.setCommand(turnOn);

  // Pressionar o botão
  remote.pressButton();  // Saída: Luz ligada

  // Configurar o controle remoto com outro comando
  remote.setCommand(turnOff);

  // Pressionar o botão novamente
  remote.pressButton();  // Saída: Luz desligada
}
