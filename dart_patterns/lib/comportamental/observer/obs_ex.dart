abstract interface class Observer {
  void update(String message);
  String getName();
  String getEmail();
}

abstract interface class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

class Cliente implements Observer {
  final String nome;
  final String email;
  final Subject subject;

  Cliente(this.nome, this.email, this.subject) {
    subject.registerObserver(this);
  }

  @override
  String getEmail() => email;

  @override
  String getName() => nome;

  @override
  void update(String message) {
    Email.enviarEmail(this, message);
  }
}

class Fornecedor implements Observer {
  final String nome;
  final String email;
  final Subject subject;

  Fornecedor(this.nome, this.email, this.subject) {
    subject.registerObserver(this);
  }

  @override
  String getEmail() => email;

  @override
  String getName() => nome;

  @override
  void update(String message) {
    Email.enviarEmail(this, message);
  }
}

class Funcionario implements Observer {
  final String nome;
  final String email;
  final Subject subject;

  Funcionario(this.nome, this.email, this.subject) {
    subject.registerObserver(this);
  }

  @override
  String getEmail() => email;

  @override
  String getName() => nome;

  @override
  void update(String message) {
    Email.enviarEmail(this, message);
  }
}

class Parceiro implements Observer {
  final String nome;
  final String email;
  final Subject subject;

  Parceiro(this.nome, this.email, this.subject) {
    subject.registerObserver(this);
  }

  @override
  String getEmail() => email;

  @override
  String getName() => nome;

  @override
  void update(String message) {
    Email.enviarEmail(this, message);
  }
}

class Email {
  static enviarEmail(Observer observer, String message) {
    print("""
        \nEnviando email para ${observer.getEmail()}\n
         Nome: ${observer.getName()}\n
          Messagem: $message
     """);
  }
}

class NewsLatter implements Subject {
  final observers = [];
  final messagens = [];

  @override
  void notifyObservers() {
    for (var element in observers) {
      element.update(messagens.last);
    }
  }

  @override
  void registerObserver(Observer observer) {
    observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    observers.remove(observer);
  }

  addMessage(String message) {
    messagens.add(message);
    notifyObservers();
  }
}

void main(List<String> args) {
  final subject = NewsLatter();
  final f1 = Fornecedor("F1", "f1@f1.com", subject);
  

  final c1 = Cliente("C1", "c1@c1.com", subject);

  //final p1 = Parceiro("P1", "p1@p1.com", subject);

  subject.addMessage("Nova promocao");
  
  print("\n NEW\n");

  subject.removeObserver(c1);
  subject.addMessage("Nova promocao");

print("\n NEW\n");

  subject.removeObserver(f1);
  subject.addMessage("Nova promocao");
}
