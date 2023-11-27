
/// “A in­ter­face Es­tra­té­gia é comum à todas as es­tra­té­gias con­cre­tas.
///  Ela de­clara um mé­todo que o con­texto usa para exe­cu­tar uma estratégia.”
abstract class Navigate{
  String router();
}


//“Es­tra­té­gias Con­cre­tas im­ple­men­tam di­fe­ren­tes va­ri­a­ções de um al­go­ritmo que o con­texto usa.”

class Onibus implements Navigate{

  final valor = 10;

  @override
  router() => 'Rota selecionada é de BUZÃO';
  
}

class MotoTaxi implements Navigate{

  final valor = 60;

  @override
  router()=> 'Rota selecionada é de MotoTaxi';
  
}

class Taxi implements Navigate{

  final valor = 90;

  @override
  router()=>'Rota selecionada é de Taxi';
  
}
//FIM DAS Es­tra­té­gias Con­cre­tas


/*
“O Con­texto man­tém uma re­fe­rên­cia para uma das es­tra­té­gias con­cre­tas e se
 co­mu­nica com esse ob­jeto atra­vés da in­ter­face da estratégia.”
 No caso o Pessoa esta fazendo o contexto
“O con­texto chama o mé­todo de exe­cu­ção no ob­jeto es­tra­té­gia li­gado cada vez que ele pre­cisa rodar um al­go­ritmo.
 O con­texto não sabe qual “tipo de es­tra­té­gia ele está tra­ba­lhando ou como o al­go­ritmo é executado.”
”

*/
class Pessoa{
  
  late Navigate _navigate;
  final String name;

  Pessoa(this.name);

  setNavigate(Navigate navigate){
    _navigate = navigate;
  }
  getNavigate() => _navigate;


}

void main(List<String> args) {
  final paulo = Pessoa('Paulo');

  paulo.setNavigate(Onibus());
  print("${paulo.getNavigate().router()} Valor gasto: R\$: ${paulo.getNavigate().valor}");

  paulo.setNavigate(MotoTaxi());
  print("${paulo.getNavigate().router()} Valor gasto: R\$: ${paulo.getNavigate().valor}");

  paulo.setNavigate(Taxi());
  print("${paulo.getNavigate().router()} Valor gasto: R\$: ${paulo.getNavigate().valor}");
}