// Interface Command
abstract class CommandC {
  void execute();
}

// Concrete Command
class AddCommand implements CommandC {
   final Calculator calculator;
  final int value;

  AddCommand(this.calculator, this.value);

  @override
  void execute() {
    calculator.add(value);
  }
}

// Concrete Command
class SubtractCommand implements CommandC {
  final Calculator calculator;
  final int value;

  SubtractCommand(this.calculator, this.value);

  @override
  void execute() {
    calculator.subtract(value);
  }
}

// Concrete Command
class MultiplyCommand implements CommandC {
  final Calculator calculator;
  final int value;

  MultiplyCommand(this.calculator, this.value);

  @override
  void execute() {
    calculator.multiply(value);
  }
}

// Concrete Command
class DivideCommand implements CommandC {
  final Calculator calculator;
  final int value;

  DivideCommand(this.calculator, this.value);

  @override
  void execute() {
    calculator.divide(value);
  }
}

// Receptor
class Calculator {
  int _result = 0;

  void add(int value) {
    _result += value;
    print('Resultado: $_result');
  }

  void subtract(int value) {
    _result -= value;
    print('Resultado: $_result');
  }

  void multiply(int value) {
    _result *= value;
    print('Resultado: $_result');
  }

  void divide(int value) {
    if (value != 0) {
      _result ~/= value; // Ignorar parte decimal da divisão
      print('Resultado: $_result');
    } else {
      print('Não é possível dividir por zero.');
    }
  }
}

// Invoker
class RemoteControl {
  CommandC? _command;

  void setCommand(CommandC command) {
    _command = command;
  }

  void pressButton() {
    _command?.execute();
  }
}

void main() {
  // Cliente
  final Calculator calculator = Calculator();
  final RemoteControl remote = RemoteControl();

  // Configurar os comandos no controle remoto
  remote.setCommand(AddCommand(calculator, 5));

  // Pressionar o botão
  remote.pressButton(); // Saída: Resultado: 5

  // Configurar outro comando
  remote.setCommand(MultiplyCommand(calculator, 3));

  // Pressionar o botão novamente
  remote.pressButton(); // Saída: Resultado: 15

  // Configurar outro comando
  remote.setCommand(DivideCommand(calculator, 3));

  // Pressionar o botão novamente
  remote.pressButton(); // Saída: Resultado: 5

  // Configurar outro comando
  remote.setCommand(SubtractCommand(calculator, 2));

  // Pressionar o botão novamente
  remote.pressButton(); // Saída: Resultado: 3
}
