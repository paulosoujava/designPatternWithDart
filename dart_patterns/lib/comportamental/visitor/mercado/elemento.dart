// Interface Elemento


import 'package:dart_patterns/comportamental/visitor/mercado/visitor.dart';

abstract class Elemento {
  // Método a ser implementado pelas classes que implementam a interface
  double aceitar(Visitor visitor);
}
