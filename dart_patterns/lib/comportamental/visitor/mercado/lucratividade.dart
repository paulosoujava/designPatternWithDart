// Classe Lucratividade que implementa Visitor
import 'package:dart_patterns/comportamental/visitor/mercado/departamento.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/produto.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/supermercado.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/visitor.dart';


class Lucratividade implements Visitor {
  // Método que calcula a lucratividade de um supermercado.
  @override
  double visitSupermercado(Supermercado supermercado) {
    double lucratividade = 0;
    List<Departamento> departamentos = supermercado.getDepartamentos();
    
    // Calcula a lucratividade de cada departamento.
    for (Departamento departamento in departamentos) {
      List<Produto> produtos = departamento.getProdutos();
      
      // Calcula a lucratividade de cada produto do departamento.
      for (Produto produto in produtos) {
        lucratividade += calculaLucratividadeProduto(produto);
      }
    }
    
    return lucratividade;
  }

  // Método que calcula a lucratividade de um departamento.
  @override
  double visitDepartamento(Departamento departamento) {
    double lucratividade = 0;
    List<Produto> produtos = departamento.getProdutos();
    
    // Calcula a lucratividade de cada produto do departamento.
    for (Produto produto in produtos) {
      lucratividade += calculaLucratividadeProduto(produto);
    }
    
    return lucratividade;
  }

  // Método que calcula a lucratividade de um produto.
  @override
  double visitProduto(Produto produto) {
    return calculaLucratividadeProduto(produto);
  }

  // Método que calcula a lucratividade de um produto (método base).
  double calculaLucratividadeProduto(Produto produto) {
    return (produto.getPreco() * produto.getMargemLucro()) / 100;
  }
}