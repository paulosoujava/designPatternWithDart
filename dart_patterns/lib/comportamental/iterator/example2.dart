// Classe que representa um item na coleção
class Item {
  final String nome;

  Item(this.nome);
}

// Interface para o Iterator
abstract class Iterator {
  bool hasNext();
  Item next();
}

// Classe que implementa a coleção
class Colecao {
  List<Item> itens = [];

  void addItem(Item item) {
    itens.add(item);
  }

  Iterator createIterator() {
    return ColecaoIterator(this);
  }
}

// Classe que implementa o Iterator
class ColecaoIterator implements Iterator {
  final Colecao colecao;
  int indice = 0;

  ColecaoIterator(this.colecao);

  @override
  bool hasNext() {
    return indice < colecao.itens.length;
  }

  @override
  Item next() {
    Item item = colecao.itens[indice];
    indice++;
    return item;
  }
}

void main() {
  // Criando uma coleção
  Colecao minhaColecao = Colecao();
  minhaColecao.addItem(Item('Item 1'));
  minhaColecao.addItem(Item('Item 2'));
  minhaColecao.addItem(Item('Item 3'));

  // Criando um Iterator para percorrer a coleção
  Iterator iterator = minhaColecao.createIterator();

  // Iterando e exibindo os itens da coleção
  while (iterator.hasNext()) {
    Item item = iterator.next();
    print('Item: ${item.nome}');
  }
}
