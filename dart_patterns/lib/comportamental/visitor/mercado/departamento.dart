// Classe Departamento
import 'package:dart_patterns/comportamental/visitor/mercado/elemento.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/produto.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/visitor.dart';


class Departamento implements Elemento {
  String nome;
  List<Produto> produtos = [];

  Departamento(this.nome);

  void addProduto(Produto produto) {
    produtos.add(produto);
  }

  String getNome() {
    return nome;
  }

  List<Produto> getProdutos() {
    return produtos;
  }

  @override
  double aceitar(Visitor visitor) {
    // Diz para o visitor executar o método visitDepartamento().
    // Passa a própria classe por parâmetro para o visitor.
    return visitor.visitDepartamento(this);
  }
}