abstract class NetworkSocialPost {
  final String userName;
  final String password;
  bool isLogged = false;

  NetworkSocialPost(this.userName, this.password);

  //template method
  post(String medsage) {
    if (isLogged) {
      print(medsage);
    } else {
      print("Faça o login!");
    }
  }

  hasLogged() => isLogged;

  logIn();

  logOut() {
    print("Deslogar o usuário");
    isLogged = false;
  }
}

class Facebook extends NetworkSocialPost {
  Facebook(super.userName, super.password);

  @override
  logIn() {
    if (userName == "p@p.com" && password == "123") {
      print("Fazendo post em Facebook");
      isLogged = true;
    }
  }

  @override
  logOut() {
    print("Deslogar o usuário");
  }
}

class Twitter extends NetworkSocialPost {
  Twitter(super.userName, super.password);

  @override
  logIn() {
    if (userName == "p@p.com" && password == "1234") {
      print("Fazendo post em Twitter");
      isLogged = true;
    }
  }

  @override
  logOut() {
    print("Deslogar o usuário");
  }
}

void main(List<String> args) {
  print("FACEBOOK");
  final paulo = Facebook("p@p.com", "123");
  paulo.logIn();
  paulo.post("Teste de postagem no facebook");
  paulo.logOut();

  print("\n\n");

  print("TWITTER");
  final jose = Twitter("p@p.com", "1234");
  jose.logIn();
  jose.post("Teste de postagem no twitter");
  jose.logOut();
}
