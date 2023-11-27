// ignore_for_file: slash_for_doc_comments

/**
 * Neste exemplo, a classe PreparacaoBebida define o Template Method
 *  prepararBebida(), que consiste em três etapas: ferverAgua(), 
 * misturarIngredientes(), e despejarNaXicara(). As classes concretas 
 * PreparacaoCafe e PreparacaoCha herdam dessa classe base e implementam 
 * suas etapas específicas.

Ao chamar prepararBebida(), o Template Method coordena a execução das etapas,
 proporcionando uma estrutura geral, enquanto as classes concretas fornecem
  implementações específicas para cada bebida.
 */


// Classe base com o Template Method
abstract class PreparacaoBebida {
  void ferverAgua();
  void misturarIngredientes();
  void despejarNaXicara();

  // Template Method
  void prepararBebida() {
    ferverAgua();
    misturarIngredientes();
    despejarNaXicara();
  }
}

// Classe concreta implementando a preparação de café
class PreparacaoCafe extends PreparacaoBebida {
  @override
  void ferverAgua() {
    print('Fervendo água para o café');
  }

  @override
  void misturarIngredientes() {
    print('Misturando café moído com água quente');
  }

  @override
  void despejarNaXicara() {
    print('Despejando café na xícara');
  }
}

// Classe concreta implementando a preparação de chá
class PreparacaoCha extends PreparacaoBebida {
  @override
  void ferverAgua() {
    print('Fervendo água para o chá');
  }

  @override
  void misturarIngredientes() {
    print('Adicionando saquinho de chá à água quente');
  }

  @override
  void despejarNaXicara() {
    print('Despejando chá na xícara');
  }
}

void main() {
  // Preparação de café
  print('Preparando Café:');
  var cafe = PreparacaoCafe();
  cafe.prepararBebida();

  print('\n----------------\n');

  // Preparação de chá
  print('Preparando Chá:');
  var cha = PreparacaoCha();
  cha.prepararBebida();
}
