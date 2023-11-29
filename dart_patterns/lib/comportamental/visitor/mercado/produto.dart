// Importando o pacote necessário para utilizar a anotação @override
import 'package:dart_patterns/comportamental/visitor/mercado/elemento.dart';

import 'package:dart_patterns/comportamental/visitor/mercado/visitor.dart';


// Classe Produto que implementa a interface Elemento
class Produto implements Elemento{
  // Atributos privados
  String nome;
  double preco;
  double margemLucro;

  // Construtor
  Produto(this.nome, this.preco, this.margemLucro);

  // Getters
  String getNome() {
    return nome;
  }

  double getPreco() {
    return preco;
  }

  double getMargemLucro() {
    return margemLucro;
  }

  // Método da interface Elemento
  @override
  double aceitar(Visitor visitor) {
    return visitor.visitProduto(this);
  }
}
