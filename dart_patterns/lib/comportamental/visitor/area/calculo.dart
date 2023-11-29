// Interface Elemento
abstract class Elemento {
  double aceitar(Visitor visitor);
}

// Classe Círculo
class Circulo implements Elemento {
  double raio;

  Circulo(this.raio);

  @override
  double aceitar(Visitor visitor) {
    return visitor.visitCirculo(this);
  }
}

// Classe Quadrado
class Quadrado implements Elemento {
  double lado;

  Quadrado(this.lado);

  @override
  double aceitar(Visitor visitor) {
    return visitor.visitQuadrado(this);
  }
}

// Interface Visitor
abstract class Visitor {
  double visitCirculo(Circulo circulo);
  double visitQuadrado(Quadrado quadrado);
}

// Classe CalculadoraGeometrica que implementa Visitor
class CalculadoraGeometrica implements Visitor {
  @override
  double visitCirculo(Circulo circulo) {
    return 3.14 * circulo.raio * circulo.raio; // Área de um círculo
  }

  @override
  double visitQuadrado(Quadrado quadrado) {
    return quadrado.lado * quadrado.lado; // Área de um quadrado
  }
}

void main() {
  // Criando alguns elementos geométricos
  var circulo = Circulo(5);
  var quadrado = Quadrado(4);

  // Criando a calculadora geométrica
  var calculadora = CalculadoraGeometrica();

  // Calculando e exibindo a área de cada elemento
  var areaCirculo = circulo.aceitar(calculadora);
  var areaQuadrado = quadrado.aceitar(calculadora);

  print('Área do Círculo: $areaCirculo');
  print('Área do Quadrado: $areaQuadrado');
}
