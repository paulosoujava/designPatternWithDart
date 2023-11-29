// Classe Supermercado
import 'package:dart_patterns/comportamental/visitor/mercado/departamento.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/elemento.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/visitor.dart';

class Supermercado implements Elemento {
  String nome;
  List<Departamento> departamentos = [];

  Supermercado(this.nome);

  void addDepartamento(Departamento departamento) {
    departamentos.add(departamento);
  }

  String getNome() {
    return nome;
  }

  List<Departamento> getDepartamentos() {
    return departamentos;
  }

  @override
  double aceitar(Visitor visitor) {
    // Diz para o visitor executar o método visitSupermercado().
    // Passa a própria classe por parâmetro para o visitor.
    return visitor.visitSupermercado(this);
  }
}