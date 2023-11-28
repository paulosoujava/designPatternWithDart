//As classes Book para representar um livro,
// BookIterator que implementa o Iterator para a 
//coleção de livros, e BookCollection que é a coleção
// em si. O método createIterator em BookCollection
// retorna um Iterator que pode ser usado para percorrer
// a coleção de livros de forma abstrata, sem expor
// os detalhes internos da implementação da coleção.



// Classe para representar um livro
class Book {
  final String title;

  Book(this.title);
}

// Interface para o Iterator
abstract class Iterator {
  bool hasNext();
  dynamic next();
}

// Classe concreta que implementa o Iterator para a coleção de livros
class BookIterator implements Iterator {
  final List<Book> books;
  int currentIndex = 0;

  BookIterator(this.books);

  @override
  bool hasNext() {
    return currentIndex < books.length;
  }

  @override
  dynamic next() {
    if (hasNext()) {
      return books[currentIndex++];
    } else {
      return null;
    }
  }
}

// Classe que representa a coleção de livros
class BookCollection {
  final List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  // Método que retorna um Iterator para a coleção de livros
  Iterator createIterator() {
    return BookIterator(books);
  }
}

void main() {
  // Criando uma coleção de livros
  var bookCollection = BookCollection();
  bookCollection.addBook(Book("Harry Potter"));
  bookCollection.addBook(Book("Senhor dos Anéis"));
  bookCollection.addBook(Book("Dart Programming"));

  // Obtendo um Iterator para a coleção
  var iterator = bookCollection.createIterator();

  // Iterando e imprimindo os títulos dos livros
  while (iterator.hasNext()) {
    var book = iterator.next() as Book;
    print("Livro: ${book.title}");
  }
}
