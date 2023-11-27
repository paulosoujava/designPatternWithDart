// Classe abstrata representando um herói
abstract class Hero {
  // O método padrão que define o esqueleto do jogo
  void battle() {
    selectWeapon();
    attack();
    defend();
    victoryCelebration();
  }

  // Métodos abstratos que devem ser implementados pelas subclasses
  void selectWeapon();
  void attack();
  void defend();
  void victoryCelebration();
}

// Herói Guerreiro
class WarriorHero extends Hero {
  @override
  void selectWeapon() {
    print("O Guerreiro seleciona sua espada para a batalha.");
  }

  @override
  void attack() {
    print("O Guerreiro ataca com força!");
  }

  @override
  void defend() {
    print("O Guerreiro levanta seu escudo para se defender.");
  }

  @override
  void victoryCelebration() {
    print("O Guerreiro comemora sua vitória com um grito de guerra!");
  }
}

// Herói Arqueiro
class ArcherHero extends Hero {
  @override
  void selectWeapon() {
    print("O Arqueiro escolhe seu arco e flechas para a batalha.");
  }

  @override
  void attack() {
    print("O Arqueiro dispara flechas com precisão!");
  }

  @override
  void defend() {
    print("O Arqueiro se esquiva habilmente dos ataques inimigos.");
  }

  @override
  void victoryCelebration() {
    print("O Arqueiro celebra sua vitória com uma saudação elegante!");
  }
}

void main() {
  // Exemplo de jogo com um Guerreiro
  var warrior = WarriorHero();
  print("Batalha do Guerreiro:");
  warrior.battle();
  print("\n");

  // Exemplo de jogo com um Arqueiro
  var archer = ArcherHero();
  print("Batalha do Arqueiro:");
  archer.battle();
}
