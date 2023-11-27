// Suponha que estamos construindo um sistema de aprovação de despesas em uma empresa.
// Cada nível de gerente tem um limite de aprovação e, se a despesa ultrapassar esse limite, ela é enviada para o próximo nível. 

// Classe que representa uma despesa
class Despesa {
  final String descricao;
  final double valor;

  Despesa(this.descricao, this.valor);
}

// Interface para os manipuladores de aprovação
abstract class Aprovador {
  Aprovador? proximoAprovador;

  Aprovador(this.proximoAprovador);

  void aprovarDespesa(Despesa despesa);
}

// Implementação concreta do primeiro nível de aprovação
class GerenteNivel1 extends Aprovador {
  static const double LIMITE_APROVACAO = 1000.0;

  GerenteNivel1(Aprovador? proximoAprovador) : super(proximoAprovador);

  @override
  void aprovarDespesa(Despesa despesa) {
    if (despesa.valor <= LIMITE_APROVACAO) {
      print("Despesa aprovada pelo Gerente Nível 1: ${despesa.descricao}");
    } else if (proximoAprovador != null) {
      proximoAprovador!.aprovarDespesa(despesa);
    } else {
      print("Despesa não pode ser aprovada.");
    }
  }
}

// Implementação concreta do segundo nível de aprovação
class GerenteNivel2 extends Aprovador {
  static const double LIMITE_APROVACAO = 5000.0;

  GerenteNivel2(Aprovador? proximoAprovador) : super(proximoAprovador);

  @override
  void aprovarDespesa(Despesa despesa) {
    if (despesa.valor <= LIMITE_APROVACAO) {
      print("Despesa aprovada pelo Gerente Nível 2: ${despesa.descricao}");
    } else if (proximoAprovador != null) {
      proximoAprovador!.aprovarDespesa(despesa);
    } else {
      print("Despesa não pode ser aprovada.");
    }
  }
}

// Implementação concreta do terceiro nível de aprovação
class DiretorFinanceiro extends Aprovador {
  DiretorFinanceiro(Aprovador? proximoAprovador) : super(proximoAprovador);

  @override
  void aprovarDespesa(Despesa despesa) {
    print("Despesa aprovada pelo Diretor Financeiro: ${despesa.descricao}");
  }
}

void main() {
  // Configurando a corrente de aprovação
  var diretorFinanceiro = DiretorFinanceiro(null);
  var gerenteNivel2 = GerenteNivel2(diretorFinanceiro);
  var gerenteNivel1 = GerenteNivel1(gerenteNivel2);

  // Criando despesas
  var despesa1 = Despesa("Viagem de negócios", 800.0);
  var despesa2 = Despesa("Equipamento de escritório", 3500.0);
  var despesa3 = Despesa("Evento corporativo", 6000.0);

  // Enviando despesas para aprovação
  gerenteNivel1.aprovarDespesa(despesa1);
  gerenteNivel1.aprovarDespesa(despesa2);
  gerenteNivel1.aprovarDespesa(despesa3);
}
