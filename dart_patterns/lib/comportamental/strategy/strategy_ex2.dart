// Interface Estratégia
abstract class EnvioMensagemStrategy {
  void enviarMensagem(String mensagem);
}

// Estratégia Concreta: Envio por Email
class EnvioEmail implements EnvioMensagemStrategy {
  @override
  void enviarMensagem(String mensagem) {
    print('Enviando mensagem por email: $mensagem');
    // Lógica específica de envio por email
  }
}

// Estratégia Concreta: Envio por SMS
class EnvioSMS implements EnvioMensagemStrategy {
  @override
  void enviarMensagem(String mensagem) {
    print('Enviando mensagem por SMS: $mensagem');
    // Lógica específica de envio por SMS
  }
}

// Contexto: Sistema de Mensagens
class SistemaMensagens {
  EnvioMensagemStrategy? _estrategia;

  void setEstrategia(EnvioMensagemStrategy estrategia) {
    _estrategia = estrategia;
  }

  void enviarMensagem(String mensagem) {
    if (_estrategia == null) {
      print('Por favor, defina uma estratégia de envio antes de enviar a mensagem.');
      return;
    }

    _estrategia!.enviarMensagem(mensagem);
  }
}

void main() {
  SistemaMensagens sistema = SistemaMensagens();

  // Exemplo de uso com a estratégia de envio por email
  sistema.setEstrategia(EnvioEmail());
  sistema.enviarMensagem('Olá, este é um email de teste.');

  // Exemplo de uso com a estratégia de envio por SMS
  sistema.setEstrategia(EnvioSMS());
  sistema.enviarMensagem('Olá, esta é uma mensagem de teste via SMS.');
}
