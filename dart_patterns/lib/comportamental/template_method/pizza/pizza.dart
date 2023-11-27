// ignore_for_file: slash_for_doc_comments

/**
 * Neste exemplo, a classe PreparacaoPizza define o Template Method prepararPizza(),
 *  que consiste em três etapas: prepararMassa(), adicionarIngredientes(), e assarPizza().
 *  As classes concretas PizzaMargherita e PizzaPepperoni herdam dessa classe base e 
 * implementam suas etapas específicas.

Ao chamar prepararPizza(), o Template Method coordena a execução das etapas,
 proporcionando uma estrutura geral, enquanto as classes concretas fornecem 
 implementações específicas para cada tipo de pizza.
 */

// Classe base com o Template Method
abstract class PreparacaoPizza {
  void prepararMassa();
  void adicionarIngredientes();
  void assarPizza();

  // Template Method
  void prepararPizza() {
    prepararMassa();
    adicionarIngredientes();
    assarPizza();
  }
}

// Classe concreta implementando a preparação de uma pizza Margherita
class PizzaMargherita extends PreparacaoPizza {
  @override
  void prepararMassa() {
    print('Preparando massa fina para a pizza Margherita');
  }

  @override
  void adicionarIngredientes() {
    print('Adicionando molho de tomate, queijo mozzarella e manjericão');
  }

  @override
  void assarPizza() {
    print('Assando a pizza Margherita no forno a lenha');
  }
}

// Classe concreta implementando a preparação de uma pizza de Pepperoni
class PizzaPepperoni extends PreparacaoPizza {
  @override
  void prepararMassa() {
    print('Preparando massa tradicional para a pizza de Pepperoni');
  }

  @override
  void adicionarIngredientes() {
    print('Adicionando molho de tomate, queijo mozzarella e pepperoni');
  }

  @override
  void assarPizza() {
    print('Assando a pizza de Pepperoni no forno elétrico');
  }
}

void main() {
  // Preparação de uma pizza Margherita
  print('Preparando Pizza Margherita:');
  var pizzaMargherita = PizzaMargherita();
  pizzaMargherita.prepararPizza();

  print('\n----------------\n');

  // Preparação de uma pizza de Pepperoni
  print('Preparando Pizza de Pepperoni:');
  var pizzaPepperoni = PizzaPepperoni();
  pizzaPepperoni.prepararPizza();
}
