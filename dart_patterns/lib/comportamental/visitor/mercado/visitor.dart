// Interface Visitor

import 'package:dart_patterns/comportamental/visitor/mercado/departamento.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/produto.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/supermercado.dart';

abstract class Visitor {
  double visitSupermercado(Supermercado supermercado);
  double visitDepartamento(Departamento departamento);
  double visitProduto(Produto produto);
}
