// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class Rota {
  String rota();
}

class Pessoa {
  final String nome;
  late Rota rota;

  Pessoa(this.nome);

  setRota(Rota rota) {
    this.rota = rota;
  }

  show() {
    print('Nome: $nome');
    print('Rota: ${rota.rota()}');
  }
}

class Onibus implements Rota {
  @override
  String rota() {
    return 'Rota selecionada é de BUZÃO';
  }
}

class Caminhao implements Rota {
  @override
  String rota() {
    return 'Rota selecionada é de CAMINHÃO';
  }
}

class Caminhando implements Rota {
  @override
  String rota() {
    return 'Rota selecionada é de pé';
  }
}

void main(List<String> args) {
  final pessoa = Pessoa('Joaquim');
  pessoa.setRota(Caminhao());
  pessoa.show();

  final paulo = Pessoa('Paulo');
  paulo.setRota(Caminhando());
  paulo.show();

  final jose = Pessoa('Jose');
  jose.setRota(Onibus());
  jose.show();
}
