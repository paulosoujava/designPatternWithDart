// A interface estratégia declara operações comuns a todas as
// versões suportadas de algum algoritmo. O contexto usa essa
// interface para chamar o algoritmo definido pelas estratégias
// concretas.
abstract class Strategy{
  int execute(int a,int b);
}

// Estratégias concretas implementam o algoritmo enquanto seguem
// a interface estratégia base. A interface faz delas
// intercomunicáveis no contexto.
class ConcreteStrategyAdd implements Strategy {
  @override
  execute(a,b)=>  a + b;
}

 class ConcreteStrategySubtract implements Strategy{
  @override
  execute(a,b) => a - b; 
 }


class ConcreteStrategyMultiply implements Strategy{
  @override
  execute(a,b) => a * b; 
 }



// O contexto define a interface de interesse para clientes.
class Context {
  // O contexto mantém uma referência para um dos objetos
  // estratégia. O contexto não sabe a classe concreta de uma
  // estratégia. Ele deve trabalhar com todas as estratégias
 // através da interface estratégia.
 late final Strategy strategy ;

// Geralmente o contexto aceita uma estratégia através do
// construtor, e também fornece um setter para que a
// estratégia possa ser trocado durante o tempo de execução.
 setStrategy(Strategy strategy){
  this.strategy = strategy;
  }

// O contexto delega algum trabalho para o objeto estratégia
// ao invés de implementar múltiplas versões do algoritmo
// por conta própria.
 executeStrategy(int a, int b)  => strategy.execute(a, b);


}

// O código cliente escolhe uma estratégia concreta e passa ela
// para o contexto. O cliente deve estar ciente das diferenças
// entre as estratégia para que faça a escolha certa.”
void main(List<String> args) {
  // Cria um objeto contexto.

//Lê o primeiro número.
//Lê o último número.
//Lê a ação desejada da entrada do usuário
final context = Context();

final action = '*';
final firstNumber = 10;
final secondNumber = 20;

if (action  =="+") {
  context.setStrategy(ConcreteStrategyAdd());
}

if (action  =="-") {
  context.setStrategy(ConcreteStrategySubtract());
}
if(action== "*"){
context.setStrategy(ConcreteStrategyMultiply());
}
final result = context.executeStrategy(firstNumber,secondNumber);

print(result);

}