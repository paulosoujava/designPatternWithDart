//Suponha que temos um chat onde várias pessoas podem enviar mensagens,
// mas queremos garantir que as mensagens não sejam enviadas diretamente entre os participantes.
// Em vez disso, elas passarão por um mediador.

// Mediator
class ChatMediator {
  void sendMessage(String message, Participant participant) {
    print('${participant.name} enviou: $message');
  }
}

// Participante
class Participant {
  String name;
  ChatMediator mediator;

  Participant(this.name, this.mediator);

  void sendMessage(String message) {
    mediator.sendMessage(message, this);
  }

  void receiveMessage(String message) {
    print('$name recebeu: $message');
  }
}

void main() {
  // Criando o mediador
  var chatMediator = ChatMediator();

  // Criando participantes
  var alice = Participant('Alice', chatMediator);
  var bob = Participant('Bob', chatMediator);

  // Enviando mensagens através do mediador
  alice.sendMessage('Oi, Bob! Como você está?');
  bob.sendMessage('Oi, Alice! Estou bem, obrigado!');

  // Exibindo as mensagens recebidas
  alice.receiveMessage('Oi, Alice! Estou bem, obrigado!');
  bob.receiveMessage('Oi, Bob! Como você está?');
}
