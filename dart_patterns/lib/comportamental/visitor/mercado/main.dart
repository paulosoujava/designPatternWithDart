import 'package:dart_patterns/comportamental/visitor/mercado/departamento.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/lucratividade.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/produto.dart';
import 'package:dart_patterns/comportamental/visitor/mercado/supermercado.dart';

void main() {
  // Criação do supermercado
  var supermercado = Supermercado('Supermercado Esquina');

  // Criação do departamento 1 e seus produtos
  var departamento1 = Departamento('Alimentação Básica');
  var arroz = Produto('Arroz 5Kg', 18, 30);
  var macarrao = Produto('Macarrão', 3.20, 15);

  // Adição dos produtos ao departamento 1
  departamento1.addProduto(arroz);
  departamento1.addProduto(macarrao);

  // Criação do departamento 2 e seus produtos
  var departamento2 = Departamento('Higiene');
  var papelHigienico = Produto('Papel Higiênico', 11, 35);
  var sabonete = Produto('Sabonete', 1.20, 10);

  // Adição dos produtos ao departamento 2
  departamento2.addProduto(papelHigienico);
  departamento2.addProduto(sabonete);

  // Adição dos departamentos ao supermercado
  supermercado.addDepartamento(departamento1);
  supermercado.addDepartamento(departamento2);

  // Criação do Visitor que calcula a lucratividade
  var visitorLucratividade = Lucratividade();

  // Passagem do Visitor para o método aceitar() do Supermercado, Departamentos e produtos.
  var lucratividadeSupermercado = supermercado.aceitar(visitorLucratividade);
  print('Lucratividade Supermercado: R\$$lucratividadeSupermercado\n');

  var lucratividadeDepartamento1 = departamento1.aceitar(visitorLucratividade);
  print('Lucratividade Departamento 1: R\$$lucratividadeDepartamento1');
  var lucratividadeArroz = arroz.aceitar(visitorLucratividade);
  print('Lucratividade Arroz: R\$$lucratividadeArroz');
  var lucratividadeMacarrao = macarrao.aceitar(visitorLucratividade);
  print('Lucratividade Macarrão: R\$$lucratividadeMacarrao\n');

  var lucratividadeDepartamento2 = departamento2.aceitar(visitorLucratividade);
  print('Lucratividade Departamento 2: R\$$lucratividadeDepartamento2');
  var lucratividadePapelHigienico = papelHigienico.aceitar(visitorLucratividade);
  print('Lucratividade Papel Higiênico: R\$$lucratividadePapelHigienico');
  var lucratividadeSabonete = sabonete.aceitar(visitorLucratividade);
  print('Lucratividade Sabonete: R\$$lucratividadeSabonete');
}
