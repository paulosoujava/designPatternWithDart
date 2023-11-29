//Vamos imaginar um sistema de relatórios onde 
//temos diferentes tipos de elementos, como 
//Texto e Imagem, e queremos implementar a 
//funcionalidade de exportar esses elementos
// para diferentes formatos, como HTML e Markdown, 
//sem modificar as classes originais.

// Elemento base que aceitará visitantes
abstract class Element {
  void accept(Visitor visitor);
}

// Elemento de Texto
class Texto implements Element {
  String conteudo;

  Texto(this.conteudo);

  @override
  void accept(Visitor visitor) {
    visitor.visitTexto(this);
  }
}

// Elemento de Imagem
class Imagem implements Element {
  String caminho;

  Imagem(this.caminho);

  @override
  void accept(Visitor visitor) {
    visitor.visitImagem(this);
  }
}

// Interface do Visitor
abstract class Visitor {
  void visitTexto(Texto texto);
  void visitImagem(Imagem imagem);
}

// Implementação específica do Visitor para exportar em HTML
class ExportadorHTML implements Visitor {
  @override
  void visitTexto(Texto texto) {
    print('Exportando texto em HTML: ${texto.conteudo}');
  }

  @override
  void visitImagem(Imagem imagem) {
    print('Exportando imagem em HTML: <img src="${imagem.caminho}" />');
  }
}

// Implementação específica do Visitor para exportar em Markdown
class ExportadorMarkdown implements Visitor {
  @override
  void visitTexto(Texto texto) {
    print('Exportando texto em Markdown: ${texto.conteudo}');
  }

  @override
  void visitImagem(Imagem imagem) {
    print('Exportando imagem em Markdown: ![Imagem](${imagem.caminho})');
  }
}

void main() {
  // Criando alguns elementos
  Element texto = Texto('Isso é um texto.');
  Element imagem = Imagem('caminho/para/imagem.png');

  // Criando visitantes para HTML e Markdown
  Visitor exportadorHTML = ExportadorHTML();
  Visitor exportadorMarkdown = ExportadorMarkdown();

  // Aceitando visitantes
  texto.accept(exportadorHTML);
  imagem.accept(exportadorHTML);

  texto.accept(exportadorMarkdown);
  imagem.accept(exportadorMarkdown);
}
